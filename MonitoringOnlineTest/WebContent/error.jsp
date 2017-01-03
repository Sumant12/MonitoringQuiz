<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
</head>
<body>
<div class="main_bg"><!-- start main -->
	<div class="container">
		<div class="about details row">
		<div align="center">
		<h3><span class="label label-danger">Invalid Username or Password</span></h3>
		<br>
		
		
		</div>
			<h1 align="center"><span class="label label-default">Login Form</span></h1>
            <form action="logincheck.jsp" method="post" style="text-align:center">
            <br>
            <br>
            <div align="center" >
            <input type="text" class="form form-control" name="uname" id="uname" placeholder="Username" style="width:20%">
            </div>
            <br>
            <br>
                <div align="center">
              <input type="password" class="form form-control" name="pass" id="pass" placeholder="Password" style="width:20%; border-color:">
             
              </div>
             <br>
             <br>
              <input type="submit" value="Login" class="btn btn-primary" >
            </form>
            <br>
            <div align="center">
            <a href="forgot.jsp" style=" font-size:14px">forgot password</a>
            </div>
          
</div><!-- end main -->
</div>
</div>
<div class="footer_bg"><!-- start footer -->
	<div class="container">
		<div class="row  footer">
			<div class="copy text-center">
				<p class="link"><span>&#169; All rights reserved -2015</span></p>
			</div>
		</div>
	</div>
</div>


</body>
</html>