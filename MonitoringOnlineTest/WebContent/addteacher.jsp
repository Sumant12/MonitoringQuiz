<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="adminheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="clearfix"></div>
<div class="main_bg"><!-- start main -->
	<div class="container">
	
		<div class="about details row">
			<h1 align="center"><span class="label label-default">Teacher</span></h1>
            <form action="addteacher1.jsp" method="post" style="text-align:center">
            <br>
            <br>
             <div align="center">
              <input type="text" class="form form-control" name="name" id="name" placeholder="Enter your name" required="required" style="width:20%">
             
              </div>
              <br/>
          
             
           
            <br>
              <div align="center">
              <input type="email" class="form form-control" name="email" id="email" placeholder="email" required="required" style="width:20%">
             <h5><Span style="color:blue">( Username.)</Span></h5>
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
             
              <input type="submit" value="Add Teacher" class="btn btn-success" >
            </form>
           
          
</div>

</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>