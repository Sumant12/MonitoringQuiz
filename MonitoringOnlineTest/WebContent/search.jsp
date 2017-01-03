   <%@ page import="java.sql.*" %>
   <%@page import="dbsql.DBasesql"  %> 
    <%

    String name = request.getParameter("name").toString();
    String buffer="";  
    try{
    	Connection con=DBasesql.getCon();
               Statement st=con.createStatement();
               ResultSet rs=st.executeQuery("select * from subject where subj_name like '"+name+"%'");
    while(rs.next())
    {
      buffer=buffer+"<li>"+rs.getString("subj_name")+"</li>";
}
  
response.getWriter().println(buffer);
}
    catch (Exception e) {
    System.out.println(e);
    }
    %>