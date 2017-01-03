<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add to my test</title>
</head>
<body>
<%
String questions[] = request.getParameterValues("cbquestion");
String test_id = request.getParameter("testid");
if(questions==null)
{
	%>
<jsp:forward page="addquestion1.jsp">
<jsp:param name="test" value="<%=test_id%>" />
</jsp:forward>
	<%
}
String sql = "";

java.sql.Connection conn = DBasesql.getCon();

sql = "insert into testquestion(test_id,ques_id) values(?,?)";

PreparedStatement pst = conn.prepareStatement(sql);

for(int i=0;i<questions.length;i++)
{



pst.setString(1,test_id);
pst.setString(2,questions[i]);
pst.executeUpdate();

}



%>
<jsp:forward page="addquestion1.jsp">
<jsp:param name="test" value="<%=test_id%>" />
</jsp:forward>
</body>
</html>