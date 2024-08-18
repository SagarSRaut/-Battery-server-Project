<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<html>
<head>
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
  width: 100%;
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


<table id="myTable1">
  <tr class="header" >
<th><input type="text" id="myFirst" onkeyup="myFunctionFirst()" placeholder="Search for first names.." title="Type in a name"></th> 
<th> <input type="text" id="myLast" onkeyup="myFunctionLast()" placeholder="Search for City.." title="Type in a name"></th>
<th> <input type="text" id="myMobile" onkeyup="myFunctionMobile()" placeholder="Search for Mobile Number.." title="Type in a number"></th>
</tr>
</table>	
<br>  
<table id="myTable">
  <tr class="header" >
    <th style="width:5.5%;background-color:#707070;color: white;">id</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Fname</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Lname</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Firm name</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Address</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Mobile No</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Contact No</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Email</th>
    <th style="width:5.5%;background-color:#707070;color: white;">City</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Extra Details</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Update</th>
    <th style="width:5.5%;background-color:#707070;color: white;">Machine Details</th>
    
 </tr>
	
	<%@ page import="com.project.db.DBConnectionPool" %>
		<%@ page import="com.project.bean.VendorBean" %>
		<%@ page import="com.project.helper.VendorHelper" %>
		
 		<%@ page import="java.util.*" %>  
	
 		<%
 			VendorBean vendorBean = new VendorBean(); 
		 	VendorHelper obj=new VendorHelper(); 
			List<VendorBean> alist=obj.viewAllVendors();
			
			for( VendorBean vb:alist)
			{
		%>
		<tr>
		<td style="color:#131212;"><%=vb.getVendor_id() %></td>
		<td style="color:#131212;"><%=vb.getVendor_fname() %></td>
		<td style="color:#131212;"><%=vb.getVendor_lname() %></td>
		<td style="color:#131212;"><%=vb.getVendor_firm_name()%></td>
		<td style="color:#131212;"><%=vb.getVendor_address() %></td>
		<td style="color:#131212;"><%=vb.getVendor_mobile_number() %></td>
		<td style="color:#131212;"><%=vb.getVendor_contact_number() %></td>
		<td style="color:#131212;"><%=vb.getVendor_email() %></td>
		<td style="color:#131212;"><%=vb.getVendor_city() %></td>
		<td style="color:#131212;"><%=vb.getVendor_extra_details() %></td>
		<td><a href="vendor_update.jsp?vendor_id=<%=vb.getVendor_id() %>" style="color: #151414">Update</a></td>
		<td><a href="machine_details.jsp?machine_vendor_id=<%=vb.getVendor_id()%>" style="color: #151414">View</a></td>
		</tr>
		<%
			}
		%>

</table>
 <script>
function myFunctionFirst() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myFirst");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

</script> 
<script>
function myFunctionLast() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myLast");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[8];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

</script>

<script>
function myFunctionMobile() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myMobile");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[5];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

</script>

   <%@ include file="footer.jsp"%>
</body>
</html>
