<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>

   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Java EE demo</title>
<link rel="stylesheet" type="text/css" href="myStyle.css">
</head>
<body>

				
		<br><br>
		<center>
		
		<div class='portal-block'>
		
		<br><br>
		Servlet vraci : Správne prihlaseni : 
		
		<jsp:useBean id="user1" class="bean.User" scope="session"></jsp:useBean>
		<jsp:getProperty name= "user1" property ="email" /> / 
		<jsp:getProperty name= "user1" property ="password" />
		
		
		<br><br>
		<h2>Welcome to portal</h2>
		<br><br>
		
		
		<!-- chart -->
		
		<div id="donutchart" style="width: 600px; height: 500px;"></div>

		
		

</body>
</html>