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
    
    
</head>
<body>
<%@ include file="header.jsp"%>
    <!-- Navigation -->
  <%@ include file="Navigation.jsp"%>   
 
    <div class="container">

      <div class="bg-faded p-4 my-4">
        <!-- Image Carousel -->
        
        
      <%
      String user_type1=(String)session.getAttribute("USER_TYPE");
		
      		if(user_type1.equalsIgnoreCase("VENDOR") && session.getAttribute("userbean")==null)
      		{
      			response.sendRedirect("login.jsp");
      			return;
      		}
      		else{%>
      			<%@ page import="com.project.bean.AdminBean" %>

      <% AdminBean adminBean=(AdminBean)session.getAttribute("userbean"); 
      		String name=adminBean.getAdmin_fname();
      %> 
       
        <!-- Welcome Message -->
        <div class="text-center mt-4">
          <div class="text-heading text-muted text-lg">Welcome</div>
          <h1 class="my-2"><%=name %></h1>
          
        </div>
      </div>
    </div>
    <!-- /.container -->

   <%@ include file="footer.jsp"%>
<%} %>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>