<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
$(function () {
	
			<% 
			out.println("ok1");
			String xAxis=null;
			String marks=null;
			String time=null;
			try
		{
	String id="8";		
Connection con=DBasesql.getCon();
out.println("ok1");
String query="select email,total_time,total_marks from result where test_id=?";
out.println("ok2");
PreparedStatement pst = con.prepareStatement(query);
pst.setString(1, id);
out.println("ok3");
ResultSet rs=pst.executeQuery( query);
out.println("ok4");
int flag=1;
while(rs.next())
{
	System.out.println(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3));
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
System.out.println(xAxis);
		}
		catch(Exception e)
		{
			
			out.println(e);
		}
%>
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
            categories: [<%=xAxis%>],
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
            data: [<%=time%>]
        }, {
            name: 'marks',
            data: [<%=marks%>]
        }]
    });
});
		</script>
	</head>
	<body>
<script src="js/highcharts.js"></script>
<script src="js/exporting.js"></script>

<div id="container" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
adjlsjdldjajdljdldjalsjladjlsjdaljldsjslajdldjldjaldjkldjasdlajdlkj
	</body>
</html>
