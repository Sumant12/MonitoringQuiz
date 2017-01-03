<%@page import="java.sql.*" %>
<%@page import="dbsql.DBasesql" %>
<% try
{
	String email=request.getParameter("email");
	String password=request.getParameter("pass");
	String name=request.getParameter("name");
	
java.sql.Connection conn=DBasesql.getCon();

String sql="update  user set email=? ,name=?, password=? where email=?  ";
PreparedStatement  pst = conn.prepareStatement(sql);
System.out.println("pass2");
pst.setString(1,email);
pst.setString(2,name);
pst.setString(3,password);
pst.setString(4,email);
int x=pst.executeUpdate();
if(x!=0)
{
	%>
	<script type="text/javascript">
alert("user data Updted");
</script>
	<% 
response.sendRedirect("adminhome.jsp");
}
}
catch(Exception e)
{
	
	out.println(e);
	}
%>

