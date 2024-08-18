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
	
	<style>
.button {
    background-color: #deecdf;
    border: none;
    color: #403d3d;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>

<style type="text/css">
.text-area {
    display: block;
    width: 100%;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 0.70;
    color: #495057;
    background-color: #fff;
    background-image: none;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
</style>
  </head>

  <body>

	
   <%@ include file="header.jsp"%>
    <!-- Navigation -->
     <%@ include file="Navigation.jsp"%> 

    <div class="container">

     
      <div class="bg-faded p-4 my-4">
        <hr class="divider">
        <h2 class="text-center text-lg text-uppercase my-0">Vendor Registration
          <strong>Form</strong>
        </h2>
        <hr class="divider">
        <form name="form" action="VendorRegisterServlet" method="post" onsubmit="return validateVendorRegitration(form);">
         <div class="row">
         	  <div class="form-group col-lg-4">
              <label class="text-heading">First Name *</label>
              <input type="text" name="vendor_fname" id="vendor_fname" class="form-control">
         		
            </div> 
            <div class="form-group col-lg-4">
              <label class="text-heading">Last Name  *</label>
              <input type="text" name="vendor_lname" id="vendor_lname" class="form-control">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Firm Name  *</label>
              <input type="text" name="vendor_firm_name" id="vendor_firm_name" class="form-control">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Mobile Number  *</label>
              <input type="text" name="vendor_mobile_number" id="vendor_mobile_number" class="form-control">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Contact Number  *</label>
              <input type="text" name="vendor_contact_number" id="vendor_contact_number" class="form-control">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Email  *</label>
              <input type="text" name="vendor_email" id="vendor_email" class="form-control">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Address  *</label>
              <textarea rows="10" cols="20" name="vendor_address" id="vendor_address" class="text-area"></textarea>
               
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">City  *</label>
              <input type="text" name="vendor_city" id="vendor_city" class="form-control">
            </div>
           
           	  <div class="form-group col-lg-4">
              <label class="text-heading">Extra Details  </label>
             
              <input type="text" name="vendor_extra_details" id="vendor_extra_details" class="form-control">
              
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Username  *</label>
              <input type="text" name="vendor_username" id="vendor_username" class="form-control">
             
              
            </div> 
            <div class="form-group col-lg-4">
              <label class="text-heading">Password  *</label>
              <input type="password" name="vendor_password" id="vendor_password" class="form-control">
            </div> 
            
               <div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Confirm Password  *</label>
              <input type="password" name="vendor_confirm_password" id="vendor_confirm_password" class="form-control">
            </div> 
            
             </div> 
            
         
          
             
            <div class="form-group col-lg-12">
              <button type="submit" class="button">Register</button>
            </div>
          </div>
        </form>
      </div>
    </div>
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
