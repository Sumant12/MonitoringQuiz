<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Test</title>
<script type="text/javascript">
function validate()
{
	var v = document.testform.subject.value;
	var u = document.testform.subj.value;
	if(v=="")
		{
		alert("Please select a subject!!!!");
		return false;
		}
	if(v=="other" && (u=="na" || u=="NA"))
		{
		alert("Please enter a valid subject");
		return false;
		}
	}
</script>
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
			<form action="createtest2.jsp" method="post" style="text-align:center" name="testform" >
			
			 <div align="center">
              <input type="text" class="form form-control" name="testname" id="testname" placeholder="Name of the test *" required="required" style="width:20%">
               <h5><Span style="color:blue">(Enter the name of the test.)</Span></h5>
             <br>
              </div>
               <div align="center">
              <input type="number" class="form form-control" name="duration" id="duration" placeholder="Duration of test *" required="required" style="width:20%">
            
              <h5><Span style="color:blue">(Enter the test duration in minutes.)</Span></h5>
               <br>
              </div>
              <div align="center">
              <select class="form form-control" size="1" name="subject" style="width:20%">
              <option value="">Select Subject *</option>
              <%
           
              sql = "select * from subject";
              pst=conn.prepareStatement(sql);
              rs=pst.executeQuery();
              while(rs.next())
              {
            	  String opt = rs.getString(2);
            	  int id = rs.getInt(1);
            	  %>
            	  <option value=<%= id %>><%= opt %></option>
            	  <% 
              }
              
              %>
              <option value="other">Other</option>
   
              
             
              </select>
              <h5><Span style="color:blue">(Select the subject name.)</Span></h5>
              
        
              </div>
              
            
               <div align="center">
              <input type="text" class="form form-control" name="subj" id="subj" required="required" placeholder="Subject Name" style="width:20%">
               <h5><Span style="color:blue">(Enter the name of subject if not given in the above list else write NA.)</Span></h5>
             <br>
              </div>
              <br>
              
               <input type="submit" value="Create" class="btn btn-primary" >
			
			</form>
</body>
</html>