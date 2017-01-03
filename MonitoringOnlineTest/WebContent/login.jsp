<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
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
<jsp:include page="header.jsp" />
	<div class="clearfix"></div>
<div class="main_bg"><!-- start main -->
	<div class="container">
		<div class="about details row">
			<h1 align="center"><span class="label label-default">Login Form</span></h1>
            <form action="logincheck.jsp" method="post" style="text-align:center">
            <br>
            <br>
            <div align="center" >
            <input type="text" class="form form-control" name="uname" id="uname" placeholder="Username" required="required" style="width:20%">
            </div>
            <br>
            <br>
                <div align="center">
              <input type="password" class="form form-control" name="pass" id="pass" placeholder="Password" required="required" style="width:20%; border-color:">
             
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
<jsp:include page="footer.jsp" />

</body>
</html>