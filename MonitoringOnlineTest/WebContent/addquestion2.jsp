<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Questions</title>
</head>
<body>
<br>
<% String test_id = request.getParameter("id");  %>
<% String subj_id = request.getParameter("sid");  %>

<form name="addques" action="quesadded.jsp" method="post" style="text-align:center">
 <input type="hidden" name="testid" value=<%= test_id %>>
 <input type="hidden" name="subjid" value=<%= subj_id %>>
 
 
<div align="center">
<textarea rows="4" cols="4" class="form form-control" name="question" id="question" placeholder="Enter your question" required="required" style="width:20%">
</textarea>

<br>
</div>
 <div align="center">
              <input type="text" class="form form-control" name="option1" id="option1" placeholder="option 1" required="required" style="width:20%">
               
             <br>
              </div>
               <div align="center">
              <input type="text" class="form form-control" name="option2" id="option2" placeholder="option 2" required="required" style="width:20%">
              
             <br>
              </div>
              <div align="center">
              <input type="text" class="form form-control" name="option3" id="option3" placeholder="option 3" required="required" style="width:20%">
               
             <br>
              </div> 
               <div align="center">
              <input type="text" class="form form-control" name="option4" id="option4" placeholder="option 4" required="required" style="width:20%">
               
             <br>
              </div>
               <div align="center">
              <input type="text" class="form form-control" name="answer" id="answer" placeholder="Answer" required="required" style="width:20%">
               
             <br>
              </div>
              <div align="center">
              <select class="form form-control" style="width:20%" name="level">
            <%
            String sql = "select * from level";
            java.sql.Connection conn = DBasesql.getCon();
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	%>
            	<option value=<%= rs.getString(1) %>><%= "level - "+rs.getString(1)+" marks:"+rs.getString(2)+" negative marks:"+rs.getString(3) %></option>
            	<%
            }
            %>
              </select>
              <h5><Span style="color:blue">(Select the level of question.)</Span></h5>
              </div>
              <br>
              
               <input type="submit" name="addquestion" value="Add Question" class="btn btn-primary" >
</form>
</body>
</html>