<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Questions</title>
</head>
<body>
<%
java.sql.Connection conn = DBasesql.getCon();
String test_id = request.getParameter("testid");
String subj_id = request.getParameter("subjid");
String question = request.getParameter("question");
String option1 = request.getParameter("option1");
String option2 = request.getParameter("option2");
String option3 = request.getParameter("option3");
String option4 = request.getParameter("option4");
String answer = request.getParameter("answer");
String level = request.getParameter("level");
String sql = "insert into question(question,subj_id,option1,option2,option3,option4,answer,level_id) values(?,?,?,?,?,?,?,?)";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,question);
pst.setString(2,subj_id);
pst.setString(3,option1);
pst.setString(4,option2);
pst.setString(5,option3);
pst.setString(6,option4);
pst.setString(7,answer);
pst.setString(8,level);
pst.executeUpdate();
%>
  
<jsp:forward page="addquestion1.jsp">
<jsp:param name="test" value="<%=test_id%>" />
</jsp:forward>


</body>
</html>