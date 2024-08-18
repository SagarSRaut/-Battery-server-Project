<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
    <script type="text/javascript" src="js/change_password_validation.js"></script>
</head>
<body>	
<%@ include file="header_login.jsp"%>
    <!-- Navigation -->
 <%@ include file="Navigation.jsp"%> 
 
 <%

 			
 			if(request.getParameter("vendor_id")!=null)
 			{	
 				int id=Integer.parseInt(request.getParameter("vendor_id"));
 	    		System.out.println(id);
 			int vendor_id=Integer.parseInt(request.getParameter("vendor_id"));
 			VendorBean vendorBean=new VendorBean();
 			vendorBean.setVendor_id(vendor_id);

 		%>
   


     <div class="container">

     
      <div class="bg-faded p-4 my-4">
        <hr class="divider">
        <h2 class="text-center text-lg text-uppercase my-0">Change Password
          <strong>Form</strong>
        </h2>
        <hr class="divider">
        <form name="form" action="ChangePasswordServlet" method="post" onsubmit="return validateChangePassword(form);">
         <div class="row">
         <input type="hidden" name="vendor_id" id="vendor_id" class="form-control" value="<%=vendorBean.getVendor_id() %>" required="required">

        
         	
             
             <div class="form-group col-lg-4">
              <label class="text-heading">New Password</label>
              <input type="password" name="vendor_password" id="vendor_password" class="form-control">
            </div>  
             <div class="form-group col-lg-4">
              <label class="text-heading">Confirm Password</label>
              <input type="password" name="vendor_confirm_password" id="vendor_confirm_password" class="form-control">
            </div>
            
            <div class="form-group col-lg-12">
              <button type="submit" class="button">Submit</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    
    
    <!-- /.container -->
 <%} %>
   <%@ include file="footer.jsp"%>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>