<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Teacher</title>
</head>
<body>
<% 
try{
String name=request.getParameter("name");
String password=request.getParameter("pass");
String email=request.getParameter("email");
int role = 1;
out.println(name);
out.println(password);
out.println(email);
java.sql.Connection conn = DBasesql.getCon();
String sql = "insert into user(email,name,password,role) values(?,?,?,?)";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,name);
pst.setString(3,password);
pst.setInt(4,role);
int x=pst.executeUpdate();
pst.close();
conn.close();
}
catch(Exception e)
{
out.println("DB OPERTION UNSUCCESFUL");

}
%>
<div class="clearfix"></div>
<div class="main_bg"><!-- start main -->
	<div class="container">
	
		<div class="about details row">
			<h1 align="center"><span class="label label-default">Register</span></h1>
<div class="alert alert-success">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>Success!</strong>  your account  has been succesfully  verified click here to  <a href="login.jsp">login</a>again!!!!! 
</div>
<%response.sendRedirect("adminhome.jsp"); %>
           
         
          
</div>

</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
