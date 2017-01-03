<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Instructions</title>
</head>
<body>
<%
if(session.getAttribute("user")==null)
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("index.jsp");
}
String email = (String)session.getAttribute("user");
java.sql.Connection conn = DBasesql.getCon();
String sql = "select * from user where email=? and role=?";

PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,"2");
ResultSet rs = pst.executeQuery();


if(!rs.next())
{
	response.setHeader("Refresh","0;index.jsp");

}
String test_id = request.getParameter("id");

sql = "select COUNT(*) c,SUM(marks) s,test_duration dur from testquestion,question,level,test where testquestion.test_id=? and testquestion.ques_id=question.ques_id and question.level_id=level.level_id and test.test_id=testquestion.test_id";
pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
String noofques="";
String marks="";
String duration = "";
if(rs.next())
{
	noofques = rs.getString("c");
	marks = rs.getString("s");
	duration = rs.getString("dur");
}
%>
<br>
<div class="container">
<div class="panel panel-primary">
   <div class="panel-heading">
     <h3 class="panel-title" align="center">Instructions</h3>
     
   </div>
   <div class="panel-body" style="font-size:16px">
     1. Total number of questions : <b><%= noofques %></b>
     <br>
     <br>
     2. Total marks : <b><%= marks %></b>
     <br>
     <br>
     3. Questions are divided into 3 levels.
     <br>
     <br>
    &nbsp; &nbsp; 3(a). <b>Level 0 </b>: Questions in level 0 carry 1 mark each and there is <b>NO NEGATIVE MARKS</b> for questions of level 0. (+1, -0)
     <br>
     <br>
     &nbsp; &nbsp; 3(b). <b>Level 1</b> : Questions in level 1 carry 3 marks each and there is <b>1 NEGATIVE MARK</b> for questions of level 1.
     For correct answer to a level 1 <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; question, a student gets 3 marks and for a wrong answer 1 mark is to be deducted. (+3, -1)
     <br>
     <br>
     &nbsp; &nbsp; 3(c). <b>Level 2</b> : Questions in level 2 carry 6 marks each and there is <b>2 NEGATIVE MARKS</b> for questions of level 2.
     For correct answer to a level 2 <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; question, a student gets 6 marks and for a wrong answer 2 marks are to be deducted. (+6, -2)
   <br>
   <br>
   4. Test will be submitted automatically if the time expires.
   <br>
   <br>
   5. Don't refresh the page.
   <br>
   <br>
   6. Click on submit to submit answer for each question.
   <br>
   <br>
   7. If you don't want to attempt a question just click on submit <b>WITHOUT SELECTING ANY OPTION.</b>
   <br>
   <br>
   8. Once a question has been submitted <b>you cannot move to that question again</b>.
    <br>
   <br>
   9. Total Duration = <b><%= duration %> Minutes</b>
   <%
   int dur = (Integer.parseInt(duration))*60;
   %>
   <form method="post" action="test.jsp" align="center">
   <input type="hidden" name="id" value="<%= test_id %>">
   <input type="hidden" name="d" value="<%= dur %>">
   <br>
   <input type="submit" value="Start Test" class="btn btn-primary">
   </form>
   </div>
</div>

</div>
</body>
</html>