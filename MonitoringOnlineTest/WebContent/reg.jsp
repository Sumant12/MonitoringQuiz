<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var emailid=document.getElementById("email").value;
var urls="pass.jsp?ver="+emailid;
 
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
        //document.getElementById("err").style.color="red";
        document.getElementById("err").innerHTML=xmlhttp.responseText;
 
    }
  }
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>
</head>
<body>
<div class="clearfix"></div>
<div class="main_bg"><!-- start main -->
	<div class="container">
	
		<div class="about details row">
			<h1 align="center"><span class="label label-default">Register</span></h1>
            <form action="registeruser.jsp" method="post" style="text-align:center">
            <br>
            <br>
             <div align="center">
              <input type="text" class="form form-control" name="name" id="name" placeholder="Enter your name" required="required" style="width:20%">
             
              </div>
              <br/>
          
             
           
            <br>
              <div align="center">
              <input type="email" class="form form-control" name="email" id="email" placeholder="email" required="required" style="width:20%"  onfocusout="loadXMLDoc()" >
             <h5><Span style="color:blue">(This will be your username.)</Span></h5>
             <h5> <span id="err"> </span> </h5>
              </div>
              
              <br/>
            
            
                <div align="center">
              <input type="password" class="form form-control" name="pass" id="pass" placeholder="Password" required="required" style="width:20%">
             
              </div>
              <br>
               <div align="center">
              <input type="password" class="form form-control" name="cpass" id="cpass" placeholder="Confirm Password" required="required" style="width:20%">
             
              </div>
         
             <br>
             <br>
             <br>
             
              <input type="submit" value="register" class="btn btn-success" >
            </form>
           
          
</div>

</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>