package com.project.helper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;

public class ChartHelper {
	
	public Logger logger;
	
	//public String getPiChart(HashMap<String, String> values, String divName)
	public String getPiChart(String divName)
	{
		 logger = Logger.getLogger(ChartHelper.class);
		 
		String str="<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>"
+"<script type='text/javascript'>"
+"google.charts.load('current', {'packages':['corechart']});"
+"google.charts.setOnLoadCallback(drawChart);"
+"function drawChart() {"
+"var data = google.visualization.arrayToDataTable(["
+"['Name', 'KWH'],"
+"['Allocated KWH', 75],"
+"['used KWH', 25],"
+"]);"
+"var options = {'width':150, 'height':150};"
+"var chart = new google.visualization.PieChart(document.getElementById('"+divName+"'));"
+"chart.draw(data, options);"
+"}"
+"</script>";
		logger.info("Pie Chart is Return");
		return str;
		
	}
	
	public String getBarChart(ArrayList<String> values,String divName)
	{
		logger = Logger.getLogger("ChartHelper.class");
		String str="<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>"

+"<script type='text/javascript'>"
+"google.charts.load('current', {'packages':['corechart']});"
+"google.charts.setOnLoadCallback(drawChart);"
+"function drawChart() {"
+"var data = google.visualization.arrayToDataTable(["
+"['Marks','Name' ],"
+"['Priyanka',85 ],"
+"['Adarsh', 84],"
+"['Richa', 70],"
+"['Surbhi', 75],"
+"['Rohan', 45]"
+"]);"
+"var options = {'title':'Class Report', 'width':440, 'height':500};"
+"var chart = new google.visualization.BarChart(document.getElementById('"+divName+"'));"
+"chart.draw(data, options);"
+"}"
+"</script>";
		logger.info("Bar Chart Is return");
		return str;
	}
}
