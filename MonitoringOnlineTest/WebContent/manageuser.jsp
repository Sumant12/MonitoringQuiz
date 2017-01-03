<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!----font-Awesome----->
   	<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
<!----font-Awesome----->
</head>
<body>
<jsp:include page="adminheader.jsp" />
	<div class="clearfix"></div> 






<form name="displayuser" method="post" action="deleteuser.jsp" style="text-align:center">
<br>

<%
try
{
java.sql.Connection conn=DBasesql.getCon();

String sql="select * from user where role=? ";
PreparedStatement  pst = conn.prepareStatement(sql);
System.out.println("pass2");
String getUser=request.getParameter("user");
System.out.println(getUser);
if(getUser.equals("student"))
{
		 
	pst.setInt(1,2);
	
}
else
	
{	

	pst.setInt(1,1);
	
}


ResultSet rs=pst.executeQuery();

%>


<br>
<br>
<div class="table-responsive" align="center">
<table class="table-bordered" style="width:100%">
<thead>
<tr style="font-size:18px" >
	<th> Select</th>
	<th> Email</th>
	<th> Name</th>
	<th> Password</th>
	<th> Edit</th>
</tr>
</thead>
<%
while(rs.next())
{
	%>
	<tr style="font-size:16px">
	<td><input type="checkbox"  name="selectuser" value=<%= rs.getString(1)  %>> </td>
	<td><%= rs.getString("email") %> </td>
	<td><%= rs.getString("name") %> </td>
	<td><%= rs.getString("password") %> </td>
	<td><a href="edituser1.jsp?email=<%=rs.getString("email") %>"  >edit </a></td>
	</tr>
	<%
	
}
}
catch(Exception e)
{
System.out.println("EHHEEEEE");
}
%>
</table>
</div>
<input type="hidden" name="testid" value="">
<br>
<input type="submit" value="Delete" class="btn btn-primary" >
</form>









</body>
</html>