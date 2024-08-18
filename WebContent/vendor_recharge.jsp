<!DOCTYPE html>
<%@page import="com.project.helper.MachineHelper"%>
<%@page import="com.project.bean.MachineBean"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Battery Server</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/business-casual.css" rel="stylesheet">
	<script type="text/javascript" src="js/vendor_validation.js"></script>

<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/img/bg.jpg');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 50%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 5px;
  
}


#myTable tr:nth-child(odd) {
 
  background: #C0C0C0;
}

#myTable tr:nth-child(even) {
 
  background:	#b8d1f3;
}


#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
 



</style>

</head>
<body>
<%@ include file="header.jsp"%>
    <!-- Navigation -->
 <%@ include file="Navigation.jsp"%>    


<br>
<%
if(request.getParameter("machine_vendor_id") ==null)
{
	response.sendRedirect("login.jsp");
	return;
}
else
{

int machine_vendor_id=Integer.parseInt(request.getParameter("machine_vendor_id")); %>




<table id="myTable" align="center">
  <tr class="header" >
   
   
  
    <th style="width:5%;background-color:#707070;color: white;">Machines</th>
   	 <th style="width:5%;background-color:#707070;color: white;">KWH</th>

    
		<%@ page import="com.project.db.DBConnectionPool" %>
		<%@ page import="com.project.bean.MachineBean" %>
		<%@ page import="com.project.helper.MachineHelper" %>
		<%@ page import="com.project.helper.ChartHelper" %>
 		<%@ page import="java.util.*" %>  
	
 		<%
		 
		
			MachineBean machineBean=new MachineBean();
			machineBean.setMachine_vendor_id(machine_vendor_id);
			MachineHelper machineHelper=new MachineHelper();
			ChartHelper helper=new ChartHelper();
 			String chartCode=helper.getPiChart("mypie");
			List<MachineBean> machinelist=machineHelper.getMachineRechargeByVendorId(machineBean);
			
			for( MachineBean mb:machinelist)
			{
		%>
		<%=chartCode %>
		<tr>

	
		<td style="color:#131212;"><%=mb.getMachine_name()%></td> 
		
		<td style="color:#131212;"><div id="mypie"></div></td>
		</tr>
		<%
			}
		%>


    

</table>


   <%@ include file="footer.jsp"%>
<%} %>
    
</body>
</html>
