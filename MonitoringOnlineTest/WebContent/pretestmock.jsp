<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
java.sql.Connection conn = DBasesql.getCon();
String email = (String)session.getAttribute("user");
int i=0;
String test_id = request.getParameter("test");
//String test_id = "4";
String sql = "select COUNT(*) c from question,testquestion where question.ques_id=testquestion.ques_id and testquestion.test_id=?";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
i = rs.getInt("c");

}
int ques[] = new int[i];

sql = "select * from question,testquestion where question.ques_id=testquestion.ques_id and testquestion.test_id=? order by rand()";
pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
for(int j=0;j<i;j++)
{
	if(rs.next())
	{
		ques[j] = rs.getInt("ques_id");
	}
	out.println(ques[j]+" ");
}
session.setAttribute("questions",ques);
i=0;
session.setAttribute("flag",i);
sql = "select test_duration from test where test_id=?";
pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
if(rs.next())
{
	int duration = rs.getInt("test_duration");
	duration = duration*60;
	session.setAttribute("duration",duration);
}

%>
<input type="hidden" name="test" value=<%=test_id%>>
<%
response.sendRedirect("instructionmocktest.jsp?id="+test_id);

%>
</body>
</html>