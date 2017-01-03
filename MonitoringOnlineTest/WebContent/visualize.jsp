<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
<%
if(session.getAttribute("user")==null)
{
	
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
	
	response.sendRedirect("index.jsp");
}
%>




<%
sql = "select * from test,subject where test.email=? and test.status='1' and test.subj_id=subject.subj_id";
pst = conn.prepareStatement(sql);
pst.setString(1,email);
rs = pst.executeQuery();
%>






<div class="list-group" style="width:40% ; position:relative; top:30% ;left:30%" align="center">
  <a href="#" class="list-group-item active" style="font-size:18px">
   Published Tests
  </a>
 <%  while(rs.next())
{
	String test_id = rs.getString("test_id");
	%>
  <a href="PerformanceGraph.jsp?id=<%=test_id%>&testname=<%=rs.getString("test_name") %>" class="list-group-item" style="font-size:16px"><%=rs.getString("test_name") %> Subject:<%=rs.getString("subj_name")%></a>
	<%
}
%> 
</div>
<br>
<br>
<div align="center">
<a href="strategy.jsp" class="btn btn-success">Strategies adopted</a>

</div>







</body>
</html>