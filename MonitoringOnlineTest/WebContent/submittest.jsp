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
String email = (String)session.getAttribute("user");
String test_id = request.getParameter("testid");
int time = Integer.parseInt(request.getParameter("time"));
int duration = Integer.parseInt(request.getParameter("duration"));
time = duration-time;
int noofques = Integer.parseInt(request.getParameter("quesno"));
java.sql.Connection conn = DBasesql.getCon();
PreparedStatement pst;
int maxmarks=0;
String totalmarks="";
for(int i=1;i<=noofques;i++)
{
	String qid = request.getParameter("qid"+i);
	String ans = request.getParameter(""+i);
	int pmarks=0;
	int nmarks=0;
	int marks=0;
	String rightans="";
	String sql = "select question.answer,level.marks,level.negative_marks from question,level where question.ques_id=? and question.level_id=level.level_id";
	pst = conn.prepareStatement(sql);
	pst.setString(1,qid);
	ResultSet rs = pst.executeQuery();
	if(rs.next())
	{
		pmarks = Integer.parseInt(rs.getString("marks"));
		nmarks = Integer.parseInt(rs.getString("negative_marks"));
		rightans = rs.getString("answer");
		maxmarks = maxmarks+pmarks;
	}
	if(ans==null)
	{
		marks = 0;
	}
	else if(ans.equals(rightans))
	{
		marks = pmarks;
	}
	else
	{
		marks = nmarks;
	}
	String mark = ""+marks;
	sql = "insert into response(email,test_id,ques_id,marked_response,marks) values(?,?,?,?,?)";
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,qid);
	pst.setString(4,ans);
	pst.setString(5,mark);
	pst.executeUpdate();
}
String sql = "select sum(marks) m from response where email=? and test_id=?";
pst = conn.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,test_id);
ResultSet rs = pst.executeQuery();

if(rs.next())
{
	totalmarks = rs.getString("m");
	sql = "insert into result(test_id,email,total_marks,total_time) values(?,?,?,?)";
	pst = conn.prepareStatement(sql);
	pst.setString(1,test_id);
	pst.setString(2,email);
	pst.setString(3,totalmarks);
	pst.setInt(4,time);
	pst.executeUpdate();
}

%>
Congratulations for completing the test. Your score is <%= totalmarks %> out of <%= maxmarks %>
</body>
</html>