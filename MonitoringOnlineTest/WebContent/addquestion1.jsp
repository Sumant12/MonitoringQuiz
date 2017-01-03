<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Of Questions</title>
</head>
<body>
<form name="queslistform" method="post" action="addquestion3.jsp" style="text-align:center">
<br>

<%
java.sql.Connection conn=DBasesql.getCon();
String test_id=request.getParameter("test");
String subj_id="";
String sql="select subj_id from test where test_id=?";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
	subj_id = rs.getString("subj_id");
	
}

//sql = "select * from question LEFT JOIN testquestion on testquestion.ques_id=question.ques_id where testquestion.ques_id IS NULL and question.subj_id=?";
//sql = "select * from question LEFT JOIN testquestion on testquestion.ques_id=question.ques_id where testquestion.test_id<>'"+test_id+"' and question.subj_id=?";
sql = "select * from question where ques_id NOT IN(select ques_id from testquestion where test_id='"+test_id+"') and subj_id=?";
pst = conn.prepareStatement(sql);
pst.setString(1,subj_id);
//pst.setString(2,test_id);
rs = pst.executeQuery();

%>

<a class="btn btn-success" href="addquestion2.jsp?id=<%=test_id%>&sid=<%=subj_id%>">Add new questions</a>
&nbsp;
<a class="btn btn-danger" href="publish.jsp?id=<%=test_id%>">Publish Test</a>

<br>
<br>
<div class="container">
<div class="table-responsive" align="center">
<table class="table-bordered" style="width:100%">
<thead>
<tr style="font-size:18px" >
	<th> Select</th>
	<th> Question</th>
	<th> Option1</th>
	<th> Option2</th>
	<th> Option3</th>
	<th> Option4</th>
	<th> Level</th>
	<th> Answer</th>
</tr>
</thead>
<%
while(rs.next())
{
	%>
	<tr style="font-size:16px">
	<td><input type="checkbox"  name="cbquestion" value=<%= rs.getString(1)  %>> </td>
	<td><%= rs.getString("question") %> </td>
	<td><%= rs.getString("option1") %> </td>
	<td><%= rs.getString("option2") %> </td>
	<td><%= rs.getString("option3") %> </td>
	<td><%= rs.getString("option4") %> </td>
	<td><%= rs.getString("level_id") %> </td>
	<td><%= rs.getString("answer") %> </td>
	</tr>
	<%
	
}
%>
</table>
</div>
</div>
<input type="hidden" name="testid" value=<%=test_id%>>
<br>
<input type="submit" value="Add to my test" class="btn btn-primary" >
<a class="btn btn-success" href="viewquestion.jsp?id=<%=test_id%>">View existing questions</a>
</form>
</body>
</html>