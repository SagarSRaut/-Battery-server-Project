<%@page import="com.project.helper.VendorHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Battery Server</title>

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
  width: 40%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: center;
  padding: 12px;
  
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
		<%@ page import="com.project.db.DBConnectionPool" %>
		<%@ page import="com.project.bean.VendorBean" %>
		<%@ page import="com.project.helper.VendorHelper" %>
		
 		<%@ page import="java.util.*" %>  
 		<% 
 		
 		VendorHelper obj=new VendorHelper(); 
	  	   VendorBean userbean=(VendorBean)session.getAttribute("userbean"); %>
	
	    <table id="myTable" align="center">
  		<tr class="header">
  		<th style="width:10%;background-color:#707070;color: white;">Attribute</th>
   		<th style="width:10%;background-color:#707070;color: white;">Values</th>
   		
   		<%-- <tr>
   		<td>ID</td>
   		<td><%=userbean.getVendor_id() %></td>
   		</tr> --%>
   		
   		<tr>
   		<td style="color:#131212;">First Name</td>
   		<td style="color:#131212;"><%=userbean.getVendor_fname()%></td>
   		</tr>
   		
   		<tr>
   		<td style="color:#131212;">Last Name</td>
   		<td style="color:#131212;"><%=userbean.getVendor_lname() %></td>
   		</tr>
   		
   		<tr>
   		<td style="color:#131212;">Firm Name</td>
   		<td style="color:#131212;"><%=userbean.getVendor_firm_name() %></td>
   		</tr>
   		
   		<tr>
   		<td style="color:#131212;">Mobile Number</td>
   		<td style="color:#131212;"><%=userbean.getVendor_mobile_number() %></td>
   		</tr>
   		
   		<tr>
   		<td style="color:#131212;">Contact Number</td>
   		<td style="color:#131212;"><%=userbean.getVendor_contact_number() %></td>
   		</tr>
   		
   		<tr>
   		<td style="color:#131212;">Email Id</td>
   		<td style="color:#131212;"><%=userbean.getVendor_email() %></td>
   		</tr>
   		
   		<tr>
   		<td style="color:#131212;">Address</td>
   		<td style="color:#131212;"><%=userbean.getVendor_address() %></td>
   		</tr>
   		
   		<tr>
   		<td style="color:#131212;">City</td>
   		<td style="color:#131212;"><%=userbean.getVendor_city() %></td>
   		</tr>
   		
   		<%-- <tr>
   		<td style="color:#131212;">Password</td>
   		<td style="color:#131212;"><%=userbean.getVendor_extra_details() %></td>
   		</tr> --%>
   		
   		<tr>
   		<td style="color:#131212;">User Name</td>
   		<td style="color:#131212;"><%=userbean.getVendor_username() %></td>
   		</tr>
   		
   		<%-- <tr>
   		<td>Password</td>
   		<td><%=userbean.getVendor_password() %></td>
   		</tr>
   		 --%>
   		
   		</table>

   		<div align="center">
   		<a href="profile_update.jsp?vendor_id=<%=userbean.getVendor_id()%>" style="color: #151414">Update</a>
   		</div>
   		
     <%@ include file="footer.jsp"%>			
 		
	
</body>
</html>