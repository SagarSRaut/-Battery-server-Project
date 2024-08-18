<!DOCTYPE html>
<%@page import="com.project.helper.ChartHelper"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="com.project.helper.VendorHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.project.helper.AdminHelper"%>
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
<table id="myTable" align="center">
  <tr class="header">
    <th style="width:5%;background-color:#707070;color: white;">Vendor Name</th>
    <th style="width:5%;background-color:#707070;color: white;">Machines</th>
    <th style="width:5%;background-color:#707070;color: white;">KWH</th>
  </tr>
  <%
 // Logger logger=Logger.getLogger("admin_recharge.jsp");
  try{
 	
 		 
 	
		VendorHelper vendorHelper=new VendorHelper();
		List<VendorBean> list=vendorHelper.viewAllVendors();
		int id=0;%>
		<% 
		//ChartHelper helper=new ChartHelper();
		//String chartCode = "";
		for(VendorBean vb:list)
 		{
			
			 id=vb.getVendor_id();
			//machineBean.setMachine_vendor_id(id);
		 	MachineHelper machineHelper=new MachineHelper();
		 	List<MachineBean> mlist=new ArrayList<MachineBean>();
		 	//mlist=machineHelper.getAllMachinesByVendorId(vb);
		 	mlist=machineHelper.getAllMachinesByVendorId(vb);
		   
			
  	   	 		for(MachineBean mb:mlist)
	  	 	 	{
  	   	 		/* ChartHelper helper=new ChartHelper();
  	   	 		String chartCode = helper.getPiChart("mypie"); */
	   	 	 	System.out.println(id);
   	 	 %>
   	 	 <tr>
   	 	 <td style="color:#131212;"><%=vb.getVendor_fname()%></td>
   	 	 
   	 	<td style="color:#131212;"><%=mb.getMachine_name() %></td>
   	 	<%-- <td style="color:#131212;"><span id="mypie"><%=chartCode%></span></td> --%>
		 <td style="color:#131212;"><%=mb.getAllocated_KWH() %></td> 
		</tr>
	 
	 <%	} %>
	 
	 <%	}
	//	logger.info("All Vendor Machine Data Fetch and Shown");
   	 	 }
   catch(Exception e)
 	 {
 		System.out.println(e);
 		//logger.error("In Admin Recharge Exception occured"+e);
 	 }
  %>
</table>

   <%@ include file="footer.jsp"%>
<script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    
</body>
</html>
