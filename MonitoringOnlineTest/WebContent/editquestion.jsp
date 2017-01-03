<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Questions</title>
</head>
<body>
<div>
<%
java.sql.Connection conn=DBasesql.getCon();
%>
</div>

<form name="viewquesform" method="post" action="deletequesmock.jsp" style="text-align:center">
<br>

<%

String test_id=request.getParameter("id");
String sql = "select * from question,testquestion where testquestion.test_id=? and question.ques_id=testquestion.ques_id";


PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
ResultSet rs = pst.executeQuery();
String sql1 = "select level.marks from level,question where question.level_id=level.level_id and question.ques_id=?";
PreparedStatement pst1 = conn.prepareStatement(sql1);

ResultSet rs1;
int marks = 0;


%>


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
	
	pst1.setString(1,rs.getString("ques_id"));
	 rs1 =pst1.executeQuery();
	if(rs1.next())
	{
		marks = marks+Integer.parseInt(rs1.getString("marks"));
	}
	
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
<br>

<input type="hidden" name="testid" value=<%=test_id%>>
<br>
<input type="submit" value="Delete" class="btn btn-primary" >
<div >

<h3><span class="label label-danger">Total marks till now = <%= marks %></span></h3>
</div>
</div>


</form>
</body>
</html>