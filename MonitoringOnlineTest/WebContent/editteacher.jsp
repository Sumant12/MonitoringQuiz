<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<body>

<div class="container">

<h1 align="center"><span class="label label-default">Update Information</span></h1>
<br>
<form action="edituser2.jsp" method="post" style="text-align:center">
<%
String email = (String)session.getAttribute("user");
java.sql.Connection conn = DBasesql.getCon();
String sql = "select * from user where email=?";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,email);
//pst.setString(2,"2");
ResultSet rs = pst.executeQuery();
if(rs.next())
{
	
	%>
	
	<div align="center">
              <input type="text" class="form form-control" name="name" id="name" value="<%=rs.getString("name")%>" placeholder="Enter your name" required="required" style="width:20%">
             
              </div>
              <br/>
          
             
           
            <br>
              <div align="center">
              <input type="email" class="form form-control" name="email" id="email" value=<%= rs.getString("email") %> placeholder="email" required="required" style="width:20%">
             <h5><Span style="color:blue">(This will be your username.)</Span></h5>
              </div>
              <br>
              <input type="submit" value="Update" class="btn btn-success" >
	
	
	
	<%
}
else
{
	response.setHeader("Refresh","0;index.jsp");
}

%>

</form>

</div>

</body>
</html>