<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<!DOCTYPE HTML>
<html>
	<head>
	
	<%
if(session.getAttribute("role").equals("2"))
{
	

%>
<jsp:include page="userheader.jsp" />
<%
}
else
{
	%>
	<jsp:include page="teacherheader.jsp" />
	<%
}
%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Marks Graph</title>

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		
		
		
		<% 

int questions=0;
String weightage=null;
String marksObtained=null;
String time=null;
String id=request.getParameter("id");
String email=request.getParameter("email");
String testname=request.getParameter("testname");
try
{

Connection con=DBasesql.getCon();

String query="select marks,time from response where email=? and test_id=?";

PreparedStatement pst = con.prepareStatement(query);
pst.setString(1,email);
pst.setString(2,id);

ResultSet rs=pst.executeQuery();

int flag=1;
while(rs.next())
{
questions++;
if(flag==1)
{

marksObtained=rs.getString(1)+",";
time=rs.getString(2)+",";
if(rs.getString(1).equals("1")||rs.getString(1).equals("0"))

{

	weightage="1";
}

else if(rs.getString(1).equals("3")||rs.getString(1).equals("-1"))

{
	weightage="3";	
}

else
{
if(rs.getString(1).equals("6")||rs.getString(1).equals("-2"))

{
	weightage="6";
	}	
}
flag=0;
}


else{


marksObtained=marksObtained+rs.getString(1)+",";
time=time+rs.getString(2)+",";


if(rs.getString(1).equals("1")||rs.getString(1).equals("0"))

{

	weightage=weightage+",1";
}

else if(rs.getString(1).equals("3")||rs.getString(1).equals("-1"))

{
	weightage=weightage+",3";	
}

else
{
if(rs.getString(1).equals("6")||rs.getString(1).equals("-2"))

{
	weightage=weightage+",6";
	}	
}




}

}

}
catch(Exception e)
{
	
	out.println(e);
}


%>
		
		
		
		
		<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        
        
        title: {
            text: 'Response Graph:<%=testname%>'
			},
			
			subtitle: {
	            text: '<%=email%>'
	        },
        xAxis: {
            categories: [<% for(int i=1;i<=questions;i++){out.println("'"+"Question"+": "+i+"',");}%>]
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'weightage',
            data: [<% out.println(weightage);%>]
        }, {
            name: 'Marks Obtained',
            data: [<% out.println(marksObtained);%>]
        },
        {
            name: 'Time Taken(seconds)',
            data: [<% out.println(time);%>]
        }]
    });
});
		</script>
	</head>
	<body>
<script src="js/highcharts.js"></script>
<script src="js/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<div align="center">
<a href="linegraph.jsp?id=<%=id%>&email=<%=email%>&testname=<%=testname%>" class="btn btn-success"> View Time Graph</a>

</div>
	</body>
</html>
