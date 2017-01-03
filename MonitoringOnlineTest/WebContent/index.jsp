<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home</title>
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
<!-- start slider -->
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
<script type="text/javascript" src="js/jquery.cslider.js"></script>
	<script type="text/javascript">
			$(function() {

				$('#da-slider').cslider({
					autoplay : true,
					bgincrement : 450
				});

			});
		</script>
<!-- Owl Carousel Assets -->
<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/owl.carousel.js"></script>
		<script>
			$(document).ready(function() {

				$("#owl-demo").owlCarousel({
					items : 4,
					lazyLoad : true,
					autoPlay : true,
					navigation : true,
					navigationText : ["", ""],
					rewindNav : false,
					scrollPerPage : false,
					pagination : false,
					paginationNumbers : false,
				});

			});
		</script>
		<!-- //Owl Carousel Assets -->
<!----font-Awesome----->
   	<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
<!----font-Awesome----->

<script type="text/javascript">
function showData(value){ 

xmlHttp=GetXmlHttpObject()
var url="search.jsp";
url=url+"?name="+value;
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
function stateChanged() { 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
    var showdata = xmlHttp.responseText; 
    document.getElementById("mydiv").innerHTML= showdata;
    } 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try {
  xmlHttp=new XMLHttpRequest();
 }
catch (e) {
 try  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
</script>
</head>
<body>
<div class="header_bg">
<div class="container">
	<div class="row header">
		<div class="logo navbar-left">
			<h1><a href="index.html">Monitoring Online Test Through Data  Visualization</a></h1>
		</div>
		<div class="h_search navbar-right">
					<form name="subjects" action="search1.jsp">
				<input type="text" class="text" name="name" id="name" onkeyup="showData(this.value);" placeholder="Enter text here" >
				
				
				<input type="submit" value="search">
				<div id="mydiv" class="alert alert-success" style="width" role="alert"></div>
</form>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
</div>
<div class="container">
	<div class="row h_menu">
		<nav class="navbar navbar-default navbar-left" role="navigation">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		    </div>
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="index.jsp">Home</a></li>
		        <li><a href="technology.jsp">Technologies</a></li>
		        <li><a href="about.jsp">About</a></li>
		      
		        <li><a href="contact.jsp">Contact</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		    <!-- start soc_icons -->
		</nav>
		<div class="soc_icons navbar-right">
			<ul class="list-unstyled text-center">
				<li><a href="https://twitter.com/bilal3193" target="_blank"><i class="fa fa-twitter"></i></a></li>
				<li><a href="https://www.facebook.com/omthowzthat" target="_blank"><i class="fa fa-facebook" ></i></a></li>
				<li><a href="https://plus.google.com/u/0/b/117650567104375940110/117650567104375940110/about" target="_blank"><i class="fa fa-google-plus" ></i></a></li>
			</ul>	
		</div>
	</div>
</div>
<div class="slider_bg"><!-- start slider -->
	<div class="container">
		<div id="da-slider" class="da-slider text-center">
			<div class="da-slide">
				<h2 style="color:#FFF">learner</h2>
				<p style="color:#FFF">
                Students are the real learner. This online test portal is for the students to answer the quiz and test their knowledge.
                </p>
				<h3 class="da-link"><a href="about.jsp" class="fa-btn btn-1 btn-1e"><label style="color:#06C">view more</label></a></h3>
			</div>
		
			
			<div class="da-slide">
				<h2 style="color:#FFF">teachers</h2>
				<p style="color:#FFF">
                Teachers test the students by creating various quizzes. It is an easy and efficient way for testing the students.
                </p>
				<h3 class="da-link"><a href="about.jsp" class="fa-btn btn-1 btn-1e"><label style="color:#06C">view more</label></a></h3>
			</div>
	   </div>
	</div>
</div><!-- end slider -->
<div class="main_bg"><!-- start main -->
	<div class="container">
		<div class="main row">
			<div class="col-md-3 images_1_of_4 text-center">
				<span class="bg"><i class="fa fa-globe"></i></span>
				<h4><a href="#">Login</a></h4>
				<p class="para">Students and teachers can login here to access all the features.</p>
				<a href="login.jsp" class="fa-btn btn-1 btn-1e">Login</a>
			</div>
			<div class="col-md-3 images_1_of_4 bg1 text-center">
				<span class="bg"><i class="fa fa-laptop"></i></span>
				<h4><a href="#">create quiz</a></h4>
				<p class="para">The teachers can create a quiz containing MCQ type questions.</p>
				<a href="createtest.jsp" class="fa-btn btn-1 btn-1e">create</a>
			</div>
			<div class="col-md-3 images_1_of_4 bg1 text-center">
				<span class="bg"><i class="fa fa-cog"></i></span>
				<h4><a href="#">Register</a></h4>
				<p class="para">A new user has to first register to create or answer a quiz.</p>
				<a href="register.jsp" class="fa-btn btn-1 btn-1e">Register</a>
			</div>		
			<div class="col-md-3 images_1_of_4 bg1 text-center">
				<span class="bg"><i class="fa fa-shield"></i> </span>
				<h4><a href="#">Support</a></h4>
				<p class="para">Support us by liking our page on facebook. </p>
				<a href="https://www.facebook.com/omthowzthat" target="_blank" class="fa-btn btn-1 btn-1e">Like</a>
			</div>	
		</div>
	</div>
</div><!-- end main -->
<div class="main_btm"><!-- start main_btm -->
	<div class="container">
		<div class="main row">
			<div class="col-md-6 content_left">
				<img src="images/pic1.jpg" alt="" class="img-responsive">
			</div>
			<div class="col-md-6 content_right">
				<h4>The function of education is to teach one <span>to think intensively and to think critically.
 </span> Intelligence plus character - that is the goal of true education.</h4>
				<p class="para">      E-testing systems are widely adopted in academic environments, as well as in combination with other assessment means, providing tutors with powerful tools to submit different types of tests in order to assess learners’ knowledge. Among these, multiple- choice tests are extremely popular, since they can be automatically corrected. However, many learners do not welcome this type of test, because often, it does not let them properly express their capacity, due to the characteristics of multiple-choice questions of being closed-ended. </p>
				<a href="about.jsp" class="fa-btn btn-1 btn-1e">read more</a>
			</div>
		<!-- </div>
				--start-img-cursual--
					<div id="owl-demo" class="owl-carousel text-center">
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c1.jpeg" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Sumanth Sai</a></h4>
								<p>
									
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c2.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Bilal Ahmed</a></h4>
								<p>
								
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c3.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Manmohan</a></h4>
								<p>
								
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c4.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Shreyansh Jain</a></h4>
								<p>
								
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c2.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Bilal Ahmed</a></h4>
								<p>
						
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c3.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Manmohan</a></h4>
								<p>
									
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c4.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Shreyansh Jain</a></h4>
								<p>
									
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c1.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Iqbal Singh Duggal</a></h4>
								<p>
									
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c2.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Bilal Ahmed</a></h4>
								<p>
									
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c3.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Manmohan</a></h4>
								<p>
									
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c1.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Iqbal Singh Duggal</a></h4>
								<p>
									
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cau_left">
								<img class="lazyOwl" data-src="images/c4.gif" alt="Lazy Owl Image">
							</div>
							<div class="cau_left">
								<h4><a href="#">Shreyansh Jain</a></h4>
								<p>
									
								</p>
							</div>
						</div>
					</div>
					--//End-img-cursual--
	</div> -->
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