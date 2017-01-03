<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>

<% 
try{

String email=request.getParameter("ver");


java.sql.Connection conn = DBasesql.getCon();
String sql = "select * from user where email=? ";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setString(1,email);


ResultSet rs=pst.executeQuery();

if(rs.next())
{    
	session.setAttribute("register","1");
    out.print("Name already taken.Try Another?");
    
}

pst.close();
conn.close();
}
catch(Exception e)
{
out.println("DB OPERATION UNSUCCESFUL");

}
%>

