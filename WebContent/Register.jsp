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
	<script type="text/javascript" src="js/RegistrationValidation.js"></script>
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

    <div class="container">

     
      <div class="bg-faded p-4 my-4">
        <hr class="divider">
        <h2 class="text-center text-lg text-uppercase my-0">Registration
          <strong>Form</strong>
        </h2>
        <hr class="divider">
        <form name="form" action="RegisterServlet" method="post" onsubmit="return validateRegitration(form);">
         <div class="row">
         	   <div class="form-group col-lg-4">
              <label class="text-heading">First Name</label>
              <input type="text" name="firstname" id="firstname" class="form-control" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Last Name</label>
              <input type="text" name="lastname" id="lastname" class="form-control" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">User Type</label>
              <input type="text" name="type" id="type" class="form-control" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Email</label>
              <input type="text" name="email" id="email" class="form-control" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Mobile Number</label>
              <input type="text" name="mobileno" id="mobileno" class="form-control" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Address</label>
              <input type="text" name="address" id="address" class="form-control" required="required">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Username</label>
              <input type="text" name="username" id="username" class="form-control" required="required">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Password</label>
              <input type="password" name="password" id="password" class="form-control" required="required">
            </div>
            <div class="form-group col-lg-12">
              <button type="submit" class="btn btn-secondary">Register</button>
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
