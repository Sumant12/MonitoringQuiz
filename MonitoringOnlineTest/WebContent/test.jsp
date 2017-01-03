<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
var count;

var counter=setInterval(timer, 1000); 
function timer()
{
  count=count-1;
  document.getElementById("time").value = count;
  if (count <= 0)
  {
	  
    clearInterval(counter);
    document.getElementById("finish").click();
    //window.location.replace("submittest.jsp");
    //document.getElementById("testform").submit();
  }
var c=parseInt(count);
var hour=(parseInt)(c/3600);
var mins=(parseInt)((c-(hour*3600))/60);
var sec=(parseInt)(c%60);
if(sec<10)
	{
	sec = "0"+sec;
	}
if(mins<10)
{
mins = "0"+mins;
}
document.getElementById("timer").innerHTML="<center>"+"Time left: "+ hour +":"+ mins +":" + sec +"</center>"; 
}
function getcount()
{
var t=document.getElementById("t").value;
count=t;
}  
</script>
<title>Test</title>
</head>
<body onLoad="getcount()"> 
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





//java.sql.Connection conn = DBasesql.getCon();
String test_id = request.getParameter("id");
sql = "select * from question where ques_id=?";
int i = ((Integer)session.getAttribute("flag")).intValue();
if(i<0)
{
	i=0;
	session.setAttribute("flag",i);
}
int[] questions = (int[])session.getAttribute("questions");
int ques_id=0;
if(i>=questions.length)
{
	i = questions.length-1;
	session.setAttribute("flag",i);
	//response.sendRedirect("testresult.jsp?testid="+test_id);
}
else
{
ques_id = questions[i];
}
//i=i+1;
//session.setAttribute("flag",i);
pst = conn.prepareStatement(sql);
pst.setInt(1,ques_id);
rs = pst.executeQuery();
String sql1 = "select * from test where test_id=?";
PreparedStatement pst1 = conn.prepareStatement(sql1);
pst1.setString(1,test_id);
ResultSet rs1 = pst1.executeQuery();
int duration = 0;
if(rs1.next())
{
	
		//duration = Integer.parseInt(request.getParameter("d"));
		duration = (Integer)session.getAttribute("duration");
	
	
%>
<h1 align="center"><span class="label label-default"><%=rs1.getString("test_name")%></span></h1>
<form method="post" action="submittest2.jsp" name="testform" id="testform" >

<br>
 

<br>


<input type=hidden name="t" id="t" value=<%=duration %>>
<input type=hidden name="duration" value=<%=duration %>>

<div class="container" style="font-size:16px">

<div class="panel panel-primary" style="width:60%;float:left; height:90%">
  


<%
}
int h=0;
sql1 = "select * from response where email=? and test_id=? and ques_id=?";
pst1 = conn.prepareStatement(sql1);
pst1.setString(1,email);
pst1.setString(2,test_id);
pst1.setInt(3,ques_id);
rs1 = pst1.executeQuery();
String ans = " ";
if(rs1.next())
{
	ans = rs1.getString("marked_response");
	if(ans==null)
	{
		ans = " ";
	}
}

while(rs.next())
{
	
	%>
	 <div class="panel-heading">
      <h3 class="panel-title" align="center"><%="Ques. "+ (i+1)+") "+rs.getString("question")+" (level : "+rs.getString("level_id")+" )" %></h3>
   </div>
   <div class="panel-body" style="font-size:16px">
	
	
	<input type="hidden" name="time" id="time" value="">
	
	
	<input type="radio" name="<%= i %>" id="<%= h %>" value="a" <% if(ans.equals("a")){%> checked="checked" <% }  %>><%= rs.getString("option1") %>
	<br>
	<br>
	<input type="radio" name="<%= i %>" id="<%= h+1 %>" value="b" <% if(ans.equals("b")){%> checked="checked" <% }  %>><%= rs.getString("option2") %>
	<br>
	<br>
	<input type="radio" name="<%= i %>" id="<%= h+2 %>" value="c" <% if(ans.equals("c")){%> checked="checked" <% }  %> ><%= rs.getString("option3") %>
	<br>
	<br>
	<input type="radio" name="<%= i %>" id="<%= h+3 %>" value="d" <% if(ans.equals("d")){%> checked="checked" <% }  %> ><%= rs.getString("option4") %>
	<br>
	<br>
	
	<input type="hidden" name="quesid" value="<%= rs.getString("ques_id") %>">
	<input type="button" value="Reset" onclick="document.getElementById('<%=h%>').checked = false;document.getElementById('<%=h+1%>').checked = false;document.getElementById('<%=h+2%>').checked = false;document.getElementById('<%=h+3%>').checked = false">
	<br>
	<br>
	<%

	//h=h+4;
}

%>
<input type="hidden" name="quesno" value="<%= i-1 %>">
<input type="hidden" name="testid" value="<%= test_id %>">

 <input type="submit" value="previous" name="submit" class="btn btn-success" <% if(i==0) { %> disabled="disabled" <% }%>>
 <input type="submit" value="submit answer" name="submit" class="btn btn-success" >
 <input type="submit" value="next" name="submit" class="btn btn-success" <% if(i==questions.length-1) { %> disabled="disabled" <% }%> >
<input type="submit" id="finish" value="finish test" name="submit" class="btn btn-success">
 
 </div>
 <div class="panel panel-danger" align="center" style="width:100%;float:left; height:90%">
  <div class="panel-heading">
      <h3 class="panel-title" align="center">Question navigator</h3>
   </div>
   <div class="panel-body" style="font-size:16px">
   <nav>
  <ul class="pagination">

 
    <% 
   for(int j=0; j<questions.length;j++)
   {
	   %>
 
	  <li><input type="submit" class="btn btn-info" name="navigation" <%if(i==j){ %> style="background-color:pink" <% }%> value="<%= j+1 %>"></li>
<%
   }
%>
   </ul>
   </nav>
   
   </div>
   </div>
   
   
 
 </div>

 
 <div class="panel panel-danger" style="width:30%; float:left; margin-left:8%">
   <div class="panel-heading">
      <h3 class="panel-title" align="center" id="timer"></h3>
   </div>
   <div class="panel-body" style="font-size:16px">

<b>Level 0 </b>: Questions in level 0 carry 1 mark each and there is <b>NO NEGATIVE MARKS</b> for questions of level 0. (+1, -0)
     <br>
     <br>
 <b>Level 1</b> : Questions in level 1 carry 3 marks each and there is <b>1 NEGATIVE MARK</b> for questions of level 1.
     For correct answer to a level 1 question, a student gets 3 marks and for a wrong answer 1 mark is to be deducted. (+3, -1)
     <br>
     <br>
 <b>Level 2</b> : Questions in level 2 carry 6 marks each and there is <b>2 NEGATIVE MARKS</b> for questions of level 2.
     For correct answer to a level 2 question, a student gets 6 marks and for a wrong answer 2 marks are to be deducted. (+6, -2)   

   </div>

   </div>
   
  </div>
</form>
</body>
</html>