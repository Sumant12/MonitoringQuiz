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
	String email=request.getParameter("email");
java.sql.Connection conn=DBasesql.getCon();

String sql="select * from user where email=? ";
PreparedStatement  pst = conn.prepareStatement(sql);
System.out.println("pass2");
pst.setString(1,email);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
	


%>
<div class="clearfix"></div>
<div class="main_bg"><!-- start main -->
	<div class="container">
	
		<div class="about details row">
			<h1 align="center"><span class="label label-default">Edit User</span></h1>
            <form action="updateuser.jsp" method="post" style="text-align:center">
            <br>
            <br>
             <div align="center">
              <input type="text" class="form form-control" name="name" id="name" placeholder="Enter your name" required="required" style="width:20% " value="<%=rs.getString(2) %>" >
             
              </div>
              <br/>
          
             
           
            <br>
              <div align="center">
              <input type="email" class="form form-control" name="email" id="email" placeholder="email" required="required" style="width:20%" value="<%=rs.getString(1)%>">
             <h5><Span style="color:blue">(Username.)</Span></h5>
              </div>
              
              <br/>
            
            
                <div align="center">
              <input type="text" class="form form-control" name="pass" id="pass" placeholder="Password" required="required" style="width:20%" value="<%=rs.getString(3)%>">
              <h5><Span style="color:blue">(Password)</Span></h5>
              </div>
              <br>
              
         <!--      
                <div align="center">
              <div class="alert">
            <div class="form-inline">
                <label class="control-label">
                   Gender:</label>
                <label class="radio">
                    <input value="male" type="radio" name="gender" checked>Male
                </label>
                <label class="radio">
                    <input value="female" type="radio"  name="gender">Female
                </label>
                <label class="radio">
                    <input value="others" type="radio"  name="gender">Others
                </label>
                
            </div>
        </div>
              
              </div>
               
              
              <div align="center">
              <input type="text" class="form form-control" name="mobile" id="mobile" placeholder="mobile no." required="required" style="width:20%">
             
              </div>
              <br/>
              <div align="center">
              <input type="text" class="form form-control" name="qualification" id="qualification" placeholder="qualification" style="width:20%">
             
              </div>
              <br/>
              <div align="center">
              <input type="text" class="form form-control" name="skills" id="skills" required="required" placeholder="skills" style="width:20%; border-color:">
             
              </div>
             <br>
             <div align="center">
              <input type="text" class="form form-control" name="experience" id="experience" placeholder="experience" style="width:20%; border-color:">
             
              </div>
             <br>
             <div align="center">
             <textarea rows="4" cols="" class="form form-control" name="address" id="address" placeholder="Address" style="width:20%"></textarea>
          
              </div>
              -->
             <br>
             <br>
             <br>
             
              <input type="submit" value="update" class="btn btn-success" >
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