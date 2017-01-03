<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Visualization </title>

		<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
		<script src="js/highcharts.js"></script>
<script src="js/exporting.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<% 
		if(session.getAttribute("user")==null)
		{
			response.sendRedirect("index.jsp");
		}

String xAxis=null;
String marks=null;
String time=null;
try
{
String id=request.getParameter("id");

Connection con=DBasesql.getCon();

String query="select  email,total_time,total_marks from result where test_id=?";

PreparedStatement pst = con.prepareStatement(query);
pst.setString(1,id);

ResultSet rs=pst.executeQuery();

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



%>
		<script type="text/javascript">
$(function () {


$('#container').highcharts({
    chart: {
        type: 'bar'
    },
    title: {
        text: 'MultiUserGraph'
    },
    subtitle: {
        text: 'Source: www.mottdv.com'
    },
    xAxis: {
    	categories: [<%out.println(xAxis);%>],
        title: {
            text: null
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'time (seconds) & marks',
            align: 'center'
        },
        labels: {
            overflow: 'justify'
        }
    },
    tooltip: {
        valueSuffix: ' '
    },
    plotOptions: {
        bar: {
            dataLabels: {
                enabled: true
            }
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -40,
        y: 100,
        floating: true,
        borderWidth: 1,
        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        shadow: true
    },
    credits: {
        enabled: false
    },
    series: [{
        name: 'time',
        data: [<%out.println(time);%>]
    }, {
        name: 'marks',
        data: [<%out.println(marks);%>]
    }]
});
});
	</script>
</head>
<body>


 <div id="container" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>

<%
if(session.getAttribute("role").equals("1"))
{

%>
 <div class="list-group" style="width:40% ; position:relative; top:5% ;left:30%" align="center">
  <a href="#" class="list-group-item active" style="font-size:18px">
   Test taken by 
  </a>
 <% 
 String query1="select  email from result where test_id=?";

  pst = con.prepareStatement(query);
 pst.setString(1,id);

  rs=pst.executeQuery();
 
 String testname=request.getParameter("testname");
 while(rs.next())
{
	
	String email=rs.getString("email");
	%>
  <a href="marksgraph.jsp?id=<%=id%>&email=<%=email%>&testname=<%=testname%>" class="list-group-item" style="font-size:16px"><%=rs.getString("email") %></a>
	<%
}
 
 
}
}
catch(Exception e)
{
	
	out.println(e);
}

%> 
</div>

</body>
</html>
