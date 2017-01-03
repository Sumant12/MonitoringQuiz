
<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<% 

String xAxis=null;
String marks=null;
String time=null;
try
{
int id=8;		
Connection con=DBasesql.getCon();

String query="select email,total_time,total_marks from result where test_id=?";

PreparedStatement pst = con.prepareStatement(query);
pst.setInt(1,id);

ResultSet rs=pst.executeQuery( query);

int flag=1;
while(rs.next())
{

if(flag==1)
{
xAxis= "'"+rs.getString(1)+"',"	;
time=rs.getString(2)+",";
marks=rs.getString(3)+",";
flag=0;
}


else{

xAxis=xAxis + "'"+rs.getString(1)+"',"	;
time=time +rs.getString(2)+",";
marks=marks+rs.getString(3)+",";

}

}
out.println(xAxis);
}
catch(Exception e)
{
	
	out.println(e);
}


%>