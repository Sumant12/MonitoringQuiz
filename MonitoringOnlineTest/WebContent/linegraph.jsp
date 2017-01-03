<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<!DOCTYPE HTML>
<html>
	<head>
	<style type="text/css">
	
	
	ul {
    margin: 20px;
    display: inline;
}

.input-color {
    position: relative;
}
.input-color input {
    padding-left: 20px;
}
.input-color .color-box {
    width: 10px;
    height: 10px;
    display: inline-block;
    background-color: #ccc;
   
}
	
	</style>
	
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
		<title>Time Graph</title>

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		
		
		<% 

int questions=0;

String time=null;
String id=request.getParameter("id");
String email=request.getParameter("email");
String testname=request.getParameter("testname");
String marks=null;
char c[]=new char[50];
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
marks=rs.getString(1);
time=rs.getString(2)+",";

flag=0;
}

else{
	marks=marks+rs.getString(1);
time=time+rs.getString(2)+",";
}

}
c=marks.toCharArray();

}
catch(Exception e)
{
	
	out.println(e);
}


%>
		
		
		
		
		<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        title: {
            text: 'Time Graph ',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: MonitoringOnlineTest.com',
            x: -20
        },
        xAxis: {
            categories: [<% for(int i=1;i<=questions;i++){out.println("'"+"Q"+": "+i+"',");}%>]
        },
        yAxis: {
            title: {
                text: 'Time(seconds)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '  seconds'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: '<%=testname%>',
            data: [<%=time%>]
        }]
        
        
        
    });
    
    
    <%for(int i=0;i<c.length;i++)
    {
    
    if(c[i]>48)
    {
    	System.out.println(c[i]);
    
    %>
    $('#button').click(function() {
        var chart = $('#container').highcharts();
        
        	
        		 chart.series[0].data[<%=i%>].update({
        	            
        	            marker:{
        	                fillColor: '#4CBB17',
        	                states: {
        	                            	hover: {
        	                                	fillColor: '#4CBB17',
        	                                	lineColor: '#4CBB17'                                	
        	                            	}
        	                        	}
        	            }
        	        }
        	                                      );
        	
        
       
    });
    <%
    }
    
    else{%>
    	
    $('#button').click(function() {
        var chart = $('#container').highcharts();
        
        	
        		 chart.series[0].data[<%=i%>].update({
        	            
        	            marker:{
        	                fillColor: 'red',
        	                states: {
        	                            	hover: {
        	                                	fillColor: 'red',
        	                                	lineColor: 'red'                                	
        	                            	}
        	                        	}
        	            }
        	        }
        	                                      );
        	
        
       
    });
    <%}
    
    
    }
    %>
    
    
});  
    
//});
		</script>
	</head>
	<body>
<script src="js/highcharts.js"></script>
<script src="js/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<div  align="center">
<ul>
    <li>
        <div class="input-color">
            
            <div class="color-box" style="background-color: #4CBB17;"><div style="position: absolute; margin-left:1%">correct</div></div>
            <!-- Replace "#FF850A" to change the color -->
        </div>
    </li>
    <li>
        <div class="input-color">
            
            <div class="color-box" style="background-color: red;"><div style="position: absolute;margin-left:1%">wrong</div></div>
            <!-- Replace "navy" to change the color -->
        </div>
    </li>
</ul>
<button id="button" class="btn btn-success">View Responses</button>
</div>
	</body>
</html>
