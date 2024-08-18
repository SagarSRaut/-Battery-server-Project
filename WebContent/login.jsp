<!DOCTYPE html>
<%@page import="org.apache.log4j.Logger"%>
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
		<style>
		a:link {
		    text-decoration: none;
		}
		
		a:visited {
		    text-decoration: none;
		}
		
		a:hover {
		    text-decoration: underline;
		}
		
		a:active {
		    text-decoration: underline;
		}
		a:visited { 
   			 color: white;
		}
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

  </head>
  


 
  <body>

<script src="js/LoginValidation.js"></script>
 	
	<% 	
	Logger logger=Logger.getLogger("login.jsp");
	
	logger.info("In login Page");
	String errMsg = request.getParameter("msg");
	
		if(errMsg != null)
	                {%>
	                
	                     <script type="text/javascript">
	                        alert("Invalid Username or Password");
	                        </script>
	<%}%>
			
				
   <%@ include file="header_login.jsp"%>

				
    <!-- Navigation -->
     <%@ include file="Navigation.jsp"%> 

    <div class="container">

     
      <div class="bg-faded p-4 my-4">
        <hr class="divider">
        <h2 class="text-center text-lg text-uppercase my-0">Login
          <strong>Form</strong>
        </h2>
        <hr class="divider">
        <form name="form" action="LoginServlet" method="post" onsubmit="return validateLogin(form);">
          <div class="row">
            <div class="form-group col-lg-4">
              <label class="text-heading">Username</label>
              <input type="text" name="username" id="username" class="form-control">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Password</label>
              <input type="password" name="password" id="password" class="form-control">
            </div>
            <div class="form-group col-lg-12">
              <button type="submit" class="button">Submit</button>
              <a href="vendor_forget_password.jsp">Forget Password?</a></p>
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
