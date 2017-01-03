<%@page import="java.sql.*" %>
<%@page import="dbsql.DBasesql" %>
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
<% 
try
{
	
java.sql.Connection conn=DBasesql.getCon();

String sql="select * from user where email='admin@gmail.com' ";
PreparedStatement  pst = conn.prepareStatement(sql);
System.out.println("pass2");
ResultSet rs=pst.executeQuery();
if(rs.next())
{
	


%>
<div class="clearfix"></div>
<div class="main_bg"><!-- start main -->
	<div class="container">
	
		<div class="about details row">
			<h1 align="center"><span class="label label-default">Edit User</span></h1>
            <form action="adminpass1.jsp" method="post" style="text-align:center">
            <br>
            <br>
             
              
              <br/>
            
            
                <div align="center">
              <input type="text" class="form form-control" name="pass" id="pass" placeholder="Password" required="required" style="width:20%" value="<%=rs.getString(3)%>">
              <h5><Span style="color:blue">(Password)</Span></h5>
              </div>
              <br>
              
        
             <br>
             <br>
             <br>
             
              <input type="submit" value="Change Password" class="btn btn-success" >
            </form>
           
          
</div>

</div>
</div>
<% 
}
}
catch(Exception e)
{
	}
%>
</body>
</html>