<html>
<head>
<style>
.dropbtn {
    background-color: rgba(82, 82, 99);
    color: rgba(251,244,244,0.5);
    padding: 7px;
    font-size: 18px;
    border: none;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: rgba(82, 82, 99);
    min-width: 125px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color:rgba(82, 82, 99);}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color:rgba(82, 82, 99);}


</style>
</head>
<body>

<div>
<nav class="navbar navbar-expand-lg navbar-light bg-faded py-lg-4">
      <div class="container">
        <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="#">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
         
            <%@ page import="com.project.bean.VendorBean" %>
            <%@ page import="com.project.bean.AdminBean" %>
            <%
            String u_type= (String) session.getAttribute("USER_TYPE");

			try{
            
			if (u_type != null && u_type.equalsIgnoreCase("ADMIN")) {
            
            	%>
            	
            	<li class="nav-item px-lg-4">
			<div class="dropdown">
  			<button class="dropbtn">VENDOR</button>
  			<div class="dropdown-content">
   			 <a href="vendor_registration.jsp">Add</a>
    		
    		<a href="vendor_details.jsp">View</a>
  			</div>
			</div>
			</li>
			<li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="machine_onprogress.jsp">Ongoing Session</a>
            </li>
            
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="admin_recharge.jsp">Recharge</a>
            </li>
            
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="logout.jsp">Logout</a>
            </li>
          		<% }
				else if (u_type != null && u_type.equalsIgnoreCase("VENDOR")) {  
					
					VendorBean bean = (VendorBean) session.getAttribute("userbean");
					int id = bean.getVendor_id();
					
            	%>
				 
				<li class="nav-item px-lg-4">
             	 <a class="nav-link text-uppercase text-expanded" href="profileView.jsp">Profile</a>
          		</li>
          		<li class="nav-item px-lg-4">
          		<a class="nav-link text-uppercase text-expanded" href="machine_details_invendor.jsp?machine_vendor_id=<%=id%>">Machines</a> 
           		 </li>
           		  <li class="nav-item px-lg-4">
            		  <a class="nav-link text-uppercase text-expanded" href="vendor_recharge.jsp?machine_vendor_id=<%=id%>">Recharge</a>
           		 </li>
           		 <li class="nav-item px-lg-4">
             	 <a class="nav-link text-uppercase text-expanded" href="vendor_change_password.jsp?vendor_id=<%=id%>">Change Password</a>
           		 </li>
            	<li class="nav-item px-lg-4">
             	 <a class="nav-link text-uppercase text-expanded" href="logout.jsp">Logout</a>
           		 </li>	
            
            			<%}
            			else{
            			%>
            				<li class="nav-item px-lg-4">
              				<a class="nav-link text-uppercase text-expanded" href="login.jsp">Login</a>
            				</li>
            			
            			<% 
            			}
						} catch (Exception e) {
						System.out.println(e);
						}
						%>
				
          </ul>
        </div>
        
       </nav>
</div>

      
   
    
    </body>
</html>
    