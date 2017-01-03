<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Test</title>
</head>
<body>
<%
java.sql.Connection conn = DBasesql.getCon();
String test_id = request.getParameter("id");
String sql = "select * from test,subject where test.test_id='"+test_id+"' and test.subj_id=subject.subj_id";
PreparedStatement pst = conn.prepareStatement(sql);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
	

%>

<h1 align="center"><span class="label label-default">Edit Test</span></h1>
			<br>
			<form action="edittest2.jsp" method="post" style="text-align:center" name="testform" >
			<input type="hidden" name="testid" value="<%=test_id%>">
			 <div align="center">
              <input type="text" class="form form-control" name="testname" value="<%=rs.getString("test_name")%>" id="testname"  required="required" style="width:20%">
               <h5><Span style="color:blue">(Enter the name of the test.)</Span></h5>
             <br>
              </div>
               <div align="center">
              <input type="number" class="form form-control" name="duration" id="duration" value="<%=rs.getString("test_duration") %>" required="required" style="width:20%">
            
              <h5><Span style="color:blue">(Enter the test duration in minutes.)</Span></h5>
               <br>
              </div>
              <div align="center">
              <select class="form form-control" size="1" name="subject" style="width:20%">
              <option value="<%=rs.getString("subj_id") %>"><%=rs.getString("subj_name") %></option>
              <%
              String subj_id = rs.getString("subj_id");
          
              String sql1 = "select * from subject where subj_id<>'"+subj_id+"'";
              PreparedStatement pst1=conn.prepareStatement(sql1);
              ResultSet rs1=pst1.executeQuery();
              while(rs1.next())
              {
            	  String opt = rs1.getString(2);
            	  int id = rs1.getInt(1);
            	  %>
            	  <option value=<%= id %>><%= opt %></option>
            	  <% 
              }
}
              
              %>
              <option value="other">Other</option>
   
              
             
              </select>
              <h5><Span style="color:blue">(Select the subject name.)</Span></h5>
              
        
              </div>
              
            
               <div align="center">
              <input type="text" class="form form-control" name="subj" id="subj" required="required" value="NA" style="width:20%">
               <h5><Span style="color:blue">(Enter the name of subject if not given in the above list else write NA.)</Span></h5>
             <br>
              </div>
              <br>
              
               <input type="submit" value="Update" class="btn btn-primary" >
			
			</form>

</body>
</html>