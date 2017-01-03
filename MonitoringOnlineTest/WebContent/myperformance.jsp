<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="userheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Performance</title>
</head>
<body>
<% 
if(session.getAttribute("user")==null)
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("index.jsp");
}

String email = (String)session.getAttribute("user");
java.sql.Connection conn = DBasesql.getCon();
String sql = "select * from user where email=? and role=?";

PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,"2");
ResultSet rs = pst.executeQuery();


if(!rs.next())
{
	response.setHeader("Refresh","0;index.jsp");

}

sql = "select * from test,subject,result where result.email=? and test.test_id=result.test_id and test.subj_id=subject.subj_id";
pst = conn.prepareStatement(sql);
pst.setString(1,email);
rs = pst.executeQuery();
String sql1 = "select sum(marks) m from testquestion,question,level where testquestion.test_id=? and testquestion.ques_id=question.ques_id and question.level_id=level.level_id";
PreparedStatement pst1 = conn.prepareStatement(sql1);

ResultSet rs1;
int maxmarks = 0;


%>
<div class="container">

<h3 align="center">Tests Taken</h3>
<div class="table-responsive">
<table class="table table-striped table-hover table-bordered table-condensed" style="width:100%">
<thead>
<tr class="error" style="font-size:18px; background:#FA8072" >
	<th> Test Name</th>
	<th> Subject</th>
	<th> Your Score</th>
	<th> Maximum marks(Out of)</th>
	<th> Time Taken</th>
	<th> View Ranklist</th>
	<th> Test Visualization</th>
	
</tr>
</thead>
<%
while(rs.next())
	
{
	pst1.setString(1,rs.getString("test_id"));
	rs1 = pst1.executeQuery();
	if(rs1.next())
	{
		maxmarks = rs1.getInt("m");
	}
	int seconds = Integer.parseInt(rs.getString("total_time"));
	int minutes = Integer.parseInt(rs.getString("total_time"));
	minutes = minutes/60;
	seconds = seconds%60;
	%>
	<tr style="font-size:16px">
	<td><%=rs.getString("test_name") %></td>
	<td><%=rs.getString("subj_name") %></td>
	<td><%=rs.getString("total_marks") %></td>
	<td><%=maxmarks %></td>
	<td><%=minutes+" minutes and "+seconds+" seconds" %></td>
	<td><a href="userrank.jsp?id=<%=rs.getString("test_id")%>">View Rank List</a></td>
	<td><a href="PerformanceGraph.jsp?id=<%=rs.getInt("test_id")%>">Performance Graph</a></td>
	</tr>
	<%
}
%>

</table>
</div>
</div>


</body>
</html>