<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pass Reset</title>
<jsp:include page="header.jsp" />
</head>
<body>
<h1>Password Reset</h1>
<div class="alert alert-success">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>Done   </strong>password reset complete, kindly <a href="login.jsp">login</a>again.
</div>
<%



response.setHeader("Refresh","3;index.jsp");
%>
</body>
</html>