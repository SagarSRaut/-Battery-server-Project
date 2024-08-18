<!DOCTYPE html>
<html lang="en">

  <head>

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
  </head>

  <body>
<% if(request.getAttribute("msg")=="registermsg")
                    {
                           %>
                         <script type="text/javascript">
                            alert("Invalid data");
                            </script>
	<%}%>
	
   <%@ include file="header.jsp"%>
    <!-- Navigation -->
     <%@ include file="Navigation.jsp"%> 
     
     <%@ page import="com.project.db.DBConnectionPool" %>
		<%@ page import="com.project.bean.VendorBean" %>
		<%@ page import="com.project.helper.VendorHelper" %>
		
 		<%@ page import="java.util.*" %>  
 		<%
 			if(request.getParameter("vendor_id")!=null)
 			{	
 			int vendor_id=Integer.parseInt(request.getParameter("vendor_id"));
 			VendorBean vendorBean=new VendorBean();
 			vendorBean.setVendor_id(vendor_id);
 			VendorHelper vendorHelper=new VendorHelper();
 			vendorBean=vendorHelper.getVendorById(vendorBean);
 			
 		%>
 	
		
    <div class="container">

     
      <div class="bg-faded p-4 my-4">
        <hr class="divider">
        <h2 class="text-center text-lg text-uppercase my-0">Vendor Update
          <strong>Form</strong>
        </h2>
        <hr class="divider">
        <form name="form" action="ProfileUpdateServlet" method="post" onsubmit="return validateVendorRegitration(form);">
         <div class="row">
         		 <input type="hidden" name="vendor_id" id="vendor_id" class="form-control" value="<%=vendorBean.getVendor_id() %>" required="required">
         
         	  <div class="form-group col-lg-4">
              <label class="text-heading">First Name</label>
              <input type="text" name="vendor_fname" id="vendor_fname" class="form-control" value="<%=vendorBean.getVendor_fname() %>" required="required">
            </div> 
            <div class="form-group col-lg-4">
              <label class="text-heading">Last Name</label>
              <input type="text" name="vendor_lname" id="vendor_lname" class="form-control" value="<%=vendorBean.getVendor_lname() %>" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Firm Name</label>
              <input type="text" name="vendor_firm_name" id="vendor_firm_name" class="form-control" value="<%=vendorBean.getVendor_firm_name() %>" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Mobile Number</label>
              <input type="text" name="vendor_mobile_number" id="vendor_mobile_number" class="form-control" value="<%=vendorBean.getVendor_mobile_number() %>" required="required">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Contact Number</label>
              <input type="text" name="vendor_contact_number" id="vendor_contact_number" class="form-control" value="<%=vendorBean.getVendor_contact_number() %>" required="required">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Email</label>
              <input type="email" name="vendor_email" id="vendor_email" class="form-control" value="<%=vendorBean.getVendor_email() %>" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Address</label>
              <input type="text" name="vendor_address" id="vendor_address" class="form-control" value="<%=vendorBean.getVendor_address() %>" required="required">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">City</label>
              <input type="text" name="vendor_city" id="vendor_city" class="form-control" value="<%=vendorBean.getVendor_city() %>" required="required">
            </div>
           
           	  <div class="form-group col-lg-4">
              
              <input type="hidden" name="vendor_extra_details" id="vendor_extra_details" class="form-control" value="<%=vendorBean.getVendor_extra_details() %>" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Username</label>
              <input type="text" name="vendor_username" id="vendor_username" class="form-control" value="<%=vendorBean.getVendor_username() %>" disabled>
            </div> 
            
              <input type="hidden" name="vendor_password" id="vendor_password" class="form-control" value="<%=vendorBean.getVendor_password() %>" required="required">
           
            <div class="form-group col-lg-12">
              <button type="submit" class="btn btn-secondary">Update</button>
            </div>
          </div>
        </form>
      </div>
    </div>
   <%}%>
    <!-- /.container -->

      <%@ include file="footer.jsp"%>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="js/RegistrationValidation.js"></script>
    <!-- Zoom when clicked function for Google Map -->
    <script>
      $('.map-container').click(function () {
        $(this).find('iframe').addClass('clicked')
      }).mouseleave(function () {
        $(this).find('iframe').removeClass('clicked')
      });
    </script>

  </body>

</html>
