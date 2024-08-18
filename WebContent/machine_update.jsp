<!DOCTYPE html>
<%@page import="com.project.helper.MachineHelper"%>
<%@page import="com.project.bean.MachineBean"%>
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
		<%@ page import="com.project.bean.MachineBean" %>
		<%@ page import="com.project.helper.MachineHelper" %>
		<%@ page import="java.util.*" %>  
 		
 		<%
 		String user_type1=(String)session.getAttribute("USER_TYPE");
 		  if(user_type1.equalsIgnoreCase("VENDOR") && request.getParameter("machine_id") ==null)
 		  {
 			  session.invalidate();
 		  	response.sendRedirect("login.jsp");
 		  	return;
 		  }
 		
 		  else
 			{	
 			int machine_id=Integer.parseInt(request.getParameter("machine_id"));
 			MachineBean machineBean=new MachineBean();
 			machineBean.setMachine_id(machine_id);
 			MachineHelper machineHelper=new MachineHelper();
 			machineBean=machineHelper.getMachineById(machineBean);
 			
 		%>
    <div class="container">

     
      <div class="bg-faded p-4 my-4">
        <hr class="divider">
        <h2 class="text-center text-lg text-uppercase my-0">Machine Update
          <strong>Form</strong>
        </h2>
        <hr class="divider">
        <form name="form" action="MachineUpdateServlet" method="post" onsubmit="return validateMachineRegitration(form);" >
         <div class="row">
         	  <div class="form-group col-lg-4">
              <input type="hidden" name="machine_id" id="machine_id" class="form-control" value="<%=machineBean.getMachine_id() %>" required="required" >
            </div> 
            <div class="form-group col-lg-4">
        
              <input type="hidden" name="machine_vendor_id" id="machine_vendor_id" class="form-control" value="<%=machineBean.getMachine_vendor_id()%>" required="required">
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Machine Name</label>
              <input type="text" name="machine_name" id="machine_name" class="form-control" value="<%=machineBean.getMachine_name()%>" required="required" >
            </div>
             <div class="form-group col-lg-4">
              <label class="text-heading">Machine Specification</label>
              <input type="text" name="machine_specification" id="machine_specification" class="form-control" value="<%=machineBean.getMachine_specification()%>" required="required">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Machine Serial Number</label>
              <input type="text" name="machine_serial_no" id="machine_serial_no" class="form-control" value="<%=machineBean.getMachine_serial_no()%>" required="required">
            </div>
            <div class="form-group col-lg-4">
              <label class="text-heading">Machine Activation Code</label>
              <input type="text" name="machine_activation_code" id="machine_activation_code" class="form-control" value="<%=machineBean.getMachine_activation_code()%>" required="required">
            </div>
             <div class="dropdown">
  				
 				 <label class="text-heading">Status  </label>
 				 <select name="machine_status" >
 				 <option value="<%=machineBean.getMachine_status()%>"><%=machineBean.getMachine_status()%></option>
 				 <option value="active">Active</option>
 				  <option value="in-active">In-Active</option>
 				   <option value="locked">Locked</option>
 				    <option value="blocked">Blocked</option>
 				    </select>
			</div>
            <%--  <div class="form-group col-lg-4">
              <label class="text-heading">Machine Status</label>
              <input type="text" name="machine_status" id="machine_status" class="form-control" value="<%=machineBean.getMachine_status()%>" required="required">
            </div> --%>
            <div class="form-group col-lg-4">
              <label class="text-heading">Machine Password</label>
              <input type="text" name="machine_password" id="machine_password" class="form-control" value="<%=machineBean.getMachine_password()%>" required="required">
            </div>
           
           	  <div class="form-group col-lg-4">
           
              <input type="hidden" name="machine_other_2" id="machine_other_2" class="form-control" value="<%=machineBean.getAllocated_KWH()%>" required="required" >
            </div>
            
            <div class="form-group col-lg-12">
              <button type="submit" class="btn btn-secondary">Update</button>
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
