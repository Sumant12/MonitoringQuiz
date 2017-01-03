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
String test_id = request.getParameter("testid");
String ques_id = request.getParameter("quesid");
String i = session.getAttribute("flag").toString();

String ans = request.getParameter(i);
String time = request.getParameter("time");
try
{
int duration = ((Integer)session.getAttribute("duration")).intValue();
int questime = duration-Integer.parseInt(time);
int pmarks=0;
int nmarks=0;
int marks=0;
int flag = Integer.parseInt(i);
String rightans="";
String sql = "select question.answer,level.marks,level.negative_marks from question,level where question.ques_id=? and question.level_id=level.level_id";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,ques_id);
ResultSet rs = pst.executeQuery();

String sql1 = null;
PreparedStatement pst1 = null;

int time2 = 0;


if(rs.next())
{
	pmarks = Integer.parseInt(rs.getString("marks"));
	nmarks = Integer.parseInt(rs.getString("negative_marks"));
	rightans = rs.getString("answer");
	
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



if(request.getParameter("submit")!=null)
{
if(request.getParameter("submit").equals("next"))
{
	
	sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	
	
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,ques_id);
	rs = pst.executeQuery();
	
	if(rs.next())
	{
		time2 = rs.getInt("time");
		questime = time2 + questime;
		sql = "update response set time=? where email=? and test_id=? and ques_id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setInt(1,questime);
		pst.setString(2,email);
		pst.setString(3,test_id);
		pst.setString(4,ques_id);
		pst.executeUpdate();
		
	}
	else
	{
		ans = null;
		mark = "0";
		pst.close();
		sql = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1,email);
		pst.setString(2,test_id);
		pst.setString(3,ques_id);
		pst.setString(4,ans);
		pst.setString(5,mark);
		pst.setInt(6,questime);
		pst.executeUpdate();
		
	
	}
	
	flag = flag+1;
	session.setAttribute("flag",flag);
	
	
	session.setAttribute("duration",Integer.parseInt(time));

	response.sendRedirect("test.jsp?id="+test_id+"&d="+time+"&hello");
	
	

}









else if(request.getParameter("submit").equals("submit answer"))
{
	pst.close();
	rs.close();
sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,ques_id);
	
	rs = pst.executeQuery();

	if(rs.next())
	{
		
		time2 = rs.getInt("time");
		questime = time2 + questime;
		sql = "update response set marked_response=?,marks=?,time=? where email=? and test_id=? and ques_id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setString(1,ans);
		pst.setString(2,mark);
		pst.setInt(3,questime);
		pst.setString(4,email);
		pst.setString(5,test_id);
		pst.setString(6,ques_id);
		pst.executeUpdate();
	
	}
	else
	{
		pst.close();
	sql = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";

	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,ques_id);
	pst.setString(4,ans);
	pst.setString(5,mark);
	pst.setInt(6,questime);
	pst.executeUpdate();
	}
	
	if((((int[])session.getAttribute("questions")).length-1)!=flag)	
	{
	flag = flag+1;
	}
	session.setAttribute("flag",flag);
	
	session.setAttribute("duration",Integer.parseInt(time));

	response.sendRedirect("test.jsp?id="+test_id+"&d="+time);
}

else if(request.getParameter("submit").equals("previous"))
{
	pst.close();
	rs.close();
sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,ques_id);
	
	rs = pst.executeQuery();
	
	if(rs.next())
	{
		
		time2 = rs.getInt("time");
		questime = time2 + questime;
		sql = "update response set time=? where email=? and test_id=? and ques_id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setInt(1,questime);
		pst.setString(2,email);
		pst.setString(3,test_id);
		pst.setString(4,ques_id);
		pst.executeUpdate();
	
	}
	else
	{
		
		ans = null;
		mark = "0";
		pst.close();
		sql = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1,email);
		pst.setString(2,test_id);
		pst.setString(3,ques_id);
		pst.setString(4,ans);
		pst.setString(5,mark);
		pst.setInt(6,questime);
		pst.executeUpdate();
	}
	
	

	flag = flag-1;
	session.setAttribute("flag",flag);
	
	session.setAttribute("duration",Integer.parseInt(time));

	response.sendRedirect("test.jsp?id="+test_id+"&d="+time);
}



else
{
	pst.close();
	rs.close();
 int[] questions = (int[])session.getAttribute("questions");
 
 sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,ques_id);
	
	rs = pst.executeQuery();
	
	if(rs.next())
	{
		time2 = rs.getInt("time");
		questime = time2 + questime;
		sql = "update response set time=? where email=? and test_id=? and ques_id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setInt(1,questime);
		pst.setString(2,email);
		pst.setString(3,test_id);
		pst.setString(4,ques_id);
		pst.executeUpdate();
		
	}
	else
	{
		pst.close();
		sql = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1,email);
		pst.setString(2,test_id);
		pst.setString(3,ques_id);
		pst.setString(4,null);
		pst.setString(5,"0");
		pst.setInt(6,questime);
		pst.executeUpdate();
	}
 
	
sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
 
	
	
	sql1 = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";
	pst1 = conn.prepareStatement(sql1);
	pst1.setString(1,email);
	pst1.setString(2,test_id);
	pst1.setString(4,null);
	pst1.setString(5,"0");
	pst1.setString(6,"0");
	
 for(int j=0;j<questions.length;j++)
 {
	 int qid = questions[j];
	 pst.setInt(3,qid);
		
		rs = pst.executeQuery();
		
		if(rs.next())
		{
			
		}
		else
		{
			
			pst1.setInt(3,qid);
			
			pst1.executeUpdate();
		}
	 
 }
	
	response.sendRedirect("testresult.jsp?testid="+test_id);
}



}

else if(request.getParameter("navigation")!=null)
{
	
	pst.close();
	rs.close();
sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	flag = Integer.parseInt(request.getParameter("navigation"));
	flag = flag-1;
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,ques_id);
	rs = pst.executeQuery();
	
	if(rs.next())
	{
		time2 = rs.getInt("time");
		questime = time2 + questime;
		sql = "update response set time=? where email=? and test_id=? and ques_id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setInt(1,questime);
		pst.setString(2,email);
		pst.setString(3,test_id);
		pst.setString(4,ques_id);
		pst.executeUpdate();
		
	}
	else
	{
		ans = null;
		mark = "0";
		pst.close();
		sql = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";
		
		pst = conn.prepareStatement(sql);
		pst.setString(1,email);
		pst.setString(2,test_id);
		pst.setString(3,ques_id);
		pst.setString(4,ans);
		pst.setString(5,mark);
		pst.setInt(6,questime);
		pst.executeUpdate();
		
	
	}
session.setAttribute("flag",flag);
	
	session.setAttribute("duration",Integer.parseInt(time));

	response.sendRedirect("test.jsp?id="+test_id+"&d="+time);
	
}


else
{
	pst.close();
	rs.close();
 int[] questions = (int[])session.getAttribute("questions");
 
 sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
	pst.setString(3,ques_id);
	
	rs = pst.executeQuery();
	
	if(rs.next())
	{
		time2 = rs.getInt("time");
		questime = time2 + questime;
		sql = "update response set time=? where email=? and test_id=? and ques_id=?";
		pst = conn.prepareStatement(sql);
		
		pst.setInt(1,questime);
		pst.setString(2,email);
		pst.setString(3,test_id);
		pst.setString(4,ques_id);
		pst.executeUpdate();
		
	}
	else
	{
		pst.close();
		sql = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1,email);
		pst.setString(2,test_id);
		pst.setString(3,ques_id);
		pst.setString(4,null);
		pst.setString(5,"0");
		pst.setInt(6,questime);
		pst.executeUpdate();
	}
 
	
sql = "select * from response where email=? and test_id=? and ques_id=?";
	
	
	
	pst = conn.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,test_id);
 
	
	
	sql1 = "insert into response(email,test_id,ques_id,marked_response,marks,time) values(?,?,?,?,?,?)";
	pst1 = conn.prepareStatement(sql1);
	pst1.setString(1,email);
	pst1.setString(2,test_id);
	pst1.setString(4,null);
	pst1.setString(5,"0");
	pst1.setString(6,"0");
	
 for(int j=0;j<questions.length;j++)
 {
	 int qid = questions[j];
	 pst.setInt(3,qid);
		
		rs = pst.executeQuery();
		
		if(rs.next())
		{
			
		}
		else
		{
			
			pst1.setInt(3,qid);
			
			pst1.executeUpdate();
		}
	 
 }
	
	response.sendRedirect("testresult.jsp?testid="+test_id);
}


}

catch(Exception e)
{
	out.println("Please Be Patient and click back on browser");
	//out.println(e);
	//session.setAttribute("duration",Integer.parseInt(time));

	//response.sendRedirect("test.jsp?id="+test_id+"&d="+time);
}









//session.setAttribute("duration",Integer.parseInt(time));

//response.sendRedirect("test.jsp?id="+test_id+"&d="+time);

%>

</body>
</html>