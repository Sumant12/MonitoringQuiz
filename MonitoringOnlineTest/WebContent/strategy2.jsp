<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Strategy</title>
</head>
<body>
<br>
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
pst.setString(2,"1");
ResultSet rs = pst.executeQuery();
if(!rs.next())
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("index.jsp");
}
String totalmarks = "";
String test_id = request.getParameter("test");
sql = "select SUM(marks) sm from testquestion,question,level where testquestion.test_id=? and testquestion.ques_id=question.ques_id and question.level_id=level.level_id";
pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
if(rs.next())
{
	totalmarks = rs.getString("sm");
}

int count=0;
sql = "select COUNT(*) c from result where test_id=?";
pst=conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
if(rs.next())
{
	count = rs.getInt("c");
}
int h = count/3;
int m = (count*2)/3;
int numofques = 0;
sql = "select COUNT(*) cnt from testquestion where test_id=?";
pst=conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
if(rs.next())
{
	numofques = rs.getInt("cnt");
}



%>
<div class="container">

<div class="table-responsive">
<table class="table-bordered" style="width:100%">
<thead style="background-color:red">
<tr style="font-size:18px" >
	<th> Performers</th>
	<th> Avg. Marks out of <%= totalmarks %></th>
	<th> Avg. Time(In Seconds)</th>
	<th> Avg. Number of questions attempted</th>
	
</tr>
</thead>
<tr style="font-size:16px">
<%
int marks = 0;
int time = 0;
int ques = 0;
int totalques = 0;
float avgmark=0;
float avgtime=0;
int avgques=0;
sql = "select * from result where test_id=? ORDER BY total_marks desc,total_time";
pst=conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
String sql1 = "select COUNT(*) cques from response where email=? and test_id=? and marked_response IS NULL";
PreparedStatement pst1 = conn.prepareStatement(sql1); 
ResultSet rs1 = null;
for(int i=1;i<=h;i++)
{
	if(rs.next())
	{
		email = rs.getString("email");
		marks = marks + rs.getInt("total_marks");
		time = time + rs.getInt("total_time");
		
		pst1.setString(1,email);
		pst1.setString(2,test_id);
		rs1 = pst1.executeQuery();
		if(rs1.next())
		{
			ques = rs1.getInt("cques");
			ques = numofques-ques;
			totalques = totalques+ques;
		}
	}
}
avgmark = (float)marks/h;
avgtime = (float)time/h;
try
{
avgques = totalques/h;
}
catch(Exception e)
{
	
}


%>
<td>Top</td>
<td><%= avgmark %></td>
<td><%= avgtime %></td>
<td><%= avgques %></td>
</tr>




<tr style="font-size:16px">
<%
marks = 0;
time = 0;
ques = 0;
totalques = 0;
avgmark=0;
avgtime=0;
avgques=0;

for(int i=h+1;i<=m;i++)
{
	if(rs.next())
	{
		email = rs.getString("email");
		marks = marks + rs.getInt("total_marks");
		time = time + rs.getInt("total_time");
		
		pst1.setString(1,email);
		pst1.setString(2,test_id);
		rs1 = pst1.executeQuery();
		if(rs1.next())
		{
			ques = rs1.getInt("cques");
			ques = numofques-ques;
			totalques = totalques+ques;
		}
	}
}
avgmark = (float)marks/(m-h);
avgtime = (float)time/(m-h);
try
{
avgques = totalques/(m-h);
}
catch(Exception e)
{
	
}


%>
<td>Average</td>
<td><%= avgmark %></td>
<td><%= avgtime %></td>
<td><%= avgques %></td>
</tr>






<tr style="font-size:16px">
<%
marks = 0;
time = 0;
ques = 0;
totalques = 0;
avgmark=0;
avgtime=0;
avgques=0;

for(int i=m+1;i<=count;i++)
{
	if(rs.next())
	{
		email = rs.getString("email");
		marks = marks + rs.getInt("total_marks");
		time = time + rs.getInt("total_time");
		
		pst1.setString(1,email);
		pst1.setString(2,test_id);
		rs1 = pst1.executeQuery();
		if(rs1.next())
		{
			ques = rs1.getInt("cques");
			ques = numofques-ques;
			totalques = totalques+ques;
		}
	}
}
avgmark = (float)marks/(count-m);
avgtime = (float)time/(count-m);
avgques = totalques/(count-m);



%>
<td>Below Average</td>
<td><%= avgmark %></td>
<td><%= avgtime %></td>
<td><%= avgques %></td>
</tr>










</table>
</div>







</div>
</body>
</html>