<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.log4j.Logger"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Battery Server</title>
</head>
<body>
	 <%
	 	 Logger logger=Logger.getLogger("logout.jsp");
		try {
			if (session != null) {
				request.getSession().invalidate();
				logger.info("In Logout Page Session invalidate");
				response.sendRedirect("login.jsp");
			} else {
				logger.info("Tring to access logut page without session valid");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			logger.error("In logout page Exception Thrown"+e);
			e.printStackTrace();
		}
	%> 
	
	
	
	
</body>
</html>