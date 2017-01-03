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
<% if(session.getAttribute("user")==null)
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("index.jsp");
}
%>
<jsp:include page="adminheader.jsp" />
	<div class="clearfix"></div>
<% //java.sql.Connection conn = DBasesql.getCon();%> 
<form method="post" action="manageuser.jsp">
<div align="center">  
<br>
<select class="form form-control" size="1" name="user" style="width:20%">
<option value="student">Student</option>
<option value="teachers">Teachers</option>
</select>
<br>

<input type="submit" value="Manage" class="btn btn-primary">
</div>
</form>

</body>
</html>