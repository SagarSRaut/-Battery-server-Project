<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
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

<script type="text/javascript" src="js/machine_validation.js"></script>

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
	<%@ page import="java.util.Random" %>	
	<%@page import="com.project.helper.MachineHelper"%>
<%@page import="com.project.bean.MachineBean"%>
<%@ include file="header.jsp"%>
</head>
	
  <body>
  <% 
  
  
  String errMsg = request.getParameter("msg");
	
		if(errMsg != null)
	                {%>
	                
	                <P></P>
	                
	                     <script type="text/javascript">
	                        alert("Invalid Username or Password");
	                        </script>
	<%}%>
  
  <%String user_type1=(String)session.getAttribute("USER_TYPE");
  if(user_type1.equalsIgnoreCase("VENDOR") && request.getParameter("machine_vendor_id") ==null)
  {
	  session.invalidate();
  	response.sendRedirect("login.jsp");
  	return;
  }
  else
  {
  String activationCode="";
  Random rand = new Random();
	 for(int i=0;i<=9;i++)
	 {
	    int rand_int1 = rand.nextInt(9);
	    activationCode=activationCode+rand_int1;
	 }
  %>
  
<%
	if (request.getAttribute("msg") == "registermsg") {
%>
                         <script type="text/javascript">
                            alert("Invalid data");
                            </script>
	<%}%>
	
	<%
	
		int machine_vendor_id=Integer.parseInt(request.getParameter("machine_vendor_id"));
		System.out.println("machine_vendor_id= "+machine_vendor_id);
	%>
	
  
    <!-- Navigation -->
     <%@ include file="Navigation.jsp"%> 

    <div class="container">

     
      <div class="bg-faded p-4 my-4">
        <hr class="divider">
        <h2 class="text-center text-lg text-uppercase my-0">Machine Registration
          <strong>Form</strong>
        </h2>
        <hr class="divider">
        <form name="form" action="RegisterMachineServlet" method="post" onsubmit="return validateMachineRegitration(form);">
         <div class="row">
         	<!-- <div class="form-group col-lg-4">
              <label class="text-heading">Machine Id</label>
              <input type="text" name="machine_id" id="machine_id" class="form-control" >
            </div> -->	
           <div class="form-group col-lg-4">
             
              <input type="hidden" name="machine_vendor_id" id="machine_vendor_id" value="<%=machine_vendor_id%>" class="form-control">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Machine Name</label>
              <input type="text" name="machine_name" id="machine_name" class="form-control">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Machine Specification</label>
              <input type="text" name="machine_specification" id="machine_specification" class="form-control">
            </div>  
             <div class="form-group col-lg-4">
              <label class="text-heading">Machine Serial Number</label>
              <input type="text" name="machine_serial_no" id="machine_serial_no" class="form-control">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Machine Activation Code</label>
              <input type="text" name="machine_activation_code" id="machine_activation_code" class="form-control" value="<%=activationCode %>" readonly="readonly">
            </div>
            
           
            <div class="dropdown">
  				
 				 <label class="text-heading">Status  </label>
 				 <select name="machine_status">
 				 <option value="active">Active</option>
 				  <option value="in-active">In-Active</option>
 				   <option value="locked">Locked</option>
 				    <option value="blocked">Blocked</option>
 				    </select>
			</div>
            
              <div class="form-group col-lg-4">
              <label class="text-heading">Password</label>
              <input type="password" name="machine_password" id="machine_password" class="form-control">
            </div>
            
             <div class="form-group col-lg-4">
              <label class="text-heading">KWH</label>
              <input type="text" name="allocated_KWH" id="allocated_KWH" class="form-control">
            </div>
         
            <div class="form-group col-lg-12">
              <button type="submit" class="button">Register Machine</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <!-- /.container -->

      <%@ include file="footer.jsp"%>
<%} %>
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
