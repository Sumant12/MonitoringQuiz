<%@page import="java.sql.*"%>

<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="userheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Quiz</title>
</head>
<body>
<%

if(session.getAttribute("user")==null)
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("login.jsp");
}
String email = (String)session.getAttribute("user");
java.sql.Connection conn = DBasesql.getCon();
String sql = "select * from user where email=? and role=?";

PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,"1");
ResultSet rs = pst.executeQuery();


if(!rs.next())
{
	response.setHeader("Refresh","0;index.jsp");

}
%>
<h1 align="center"><span class="label label-default">Create Test</span></h1>
<br>
<form action="" name="quizform" method="post" style="text-align:center">




<div align="center">
              <input type="text" class="form form-control" name="testname" id="testname" placeholder="Name of quiz" required="required" style="width:20%">
             <h5><Span style="color:blue">(Enter the name of the test)</Span></h5>
             <br>
              </div>
<div align="center">
              <select size="1" name="subject" class="form form-control" style="width:20%">
              <option value="">Select Subject</option>
              <% 
             
             sql="select * from subject";
             pst = conn.prepareStatement(sql);
              rs = pst.executeQuery();
              while(rs.next())
              {
            	  String opt = rs.getString(2);
            	  %>
            	  <option><%= opt %></option>
            	  <%
              }
              %>
              </select>
             <h5><Span style="color:blue">(Enter the subject of the test)</Span></h5>
             <br>
              </div>
<div align="center">
              <input type="text" class="form form-control" name="duration" id="duration" placeholder="Test Duration" required="required" style="width:20%">
             <h5><Span style="color:blue">(Enter the duration of the test in seconds)</Span></h5>
             <br>
              </div>
<input type="submit" value="Create" class="btn btn-success" >
</form>
</body>
</html>