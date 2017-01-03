<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
if(session.getAttribute("role").equals("2"))
{
	

%>
<jsp:include page="userheader.jsp" />
<%
}
else
{
	%>
	<jsp:include page="teacherheader.jsp" />
	<%
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Rank</title>
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
String sql = "select * from user where email=?";

PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,email);

ResultSet rs = pst.executeQuery();


if(!rs.next())
{
	response.setHeader("Refresh","0;index.jsp");

}

String test_id = request.getParameter("id");
sql = "select * from test,result where result.test_id = test.test_id and result.test_id=? ORDER BY result.total_marks desc, result.total_time";
String sql1 = "select * from user where email=?";
pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
PreparedStatement pst1 = conn.prepareStatement(sql1);
int r=1;
rs = pst.executeQuery();
ResultSet rs1;
%>
<div class="container">
<br>
<div class="table-responsive">
<table class="table-bordered" style="width:100%">
<thead>
<tr style="font-size:18px" >
	<th> Rank</th>
	
	<th> Name</th>
	<th> Marks</th>

	<th> Time Taken</th>
	
	
</tr>
</thead>
<%
while(rs.next())
{
	pst1.setString(1,rs.getString("result.email"));
	rs1 = pst1.executeQuery();
	
	%>
	
	<tr style="font-size:16px" >
	<td><%= r %></td>
	<%
	if(rs1.next())
	{
		
		if(rs.getString("result.email").equals(email))
		{
			%>
		<td style="background-color:pink"><%= rs1.getString("name") %></td>
		
		<%
		}
		else
		{
			%>
			<td><%= rs1.getString("name") %></td>
			<%
		}
	}
	
	%>
	<td><%= rs.getString("total_marks") %></td>
	<td><%= rs.getString("total_time") %></td>
	</tr>
	<%
	r++;
}
%>
</table>

</div>
</div>


</body>
</html>