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
			<h2 align="center"><span class="label label-info">Trouble Signing In?</span></h2>
            <form action="forgot1.jsp" method="post" style="text-align:center">
            <br>
            <br>
                <div align="center">
              <input type="email" class="form form-control" name="forgottenemail" id="forgottenemail" placeholder="Enter Your Email " required="required" style="width:20%; border-color:">
             
              </div>
             <br>
             <br>
              <input type="submit" value="Reset Password" class="btn btn-primary" >
            </form>
            
          
</div><!-- end main -->
</div>
</div>


</body>
</html>