package com.project.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.project.bean.VendorBean;
import com.project.helper.EmailHelper;
import com.project.helper.VendorHelper;


@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = Logger.getLogger(ChangePasswordServlet.class);
		
		try{
			
		String vendor_password=request.getParameter("vendor_password");
		int id= Integer.parseInt(request.getParameter("vendor_id"));
		
		VendorBean bean = new VendorBean();
		bean.setVendor_password(vendor_password);
		bean.setVendor_id(id);
		
		
		

		VendorHelper helper=new VendorHelper();


		try {
			bean=helper.changePassword(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//String password=bean.getVendor_password();

		if(bean != null && bean.getVendor_id() > 0)
		{
			System.out.println("in if condition");
			//logger.info("Password Updated Successfully");
			response.sendRedirect("login.jsp?success=yes");
		} else {
			System.out.println("in else condition");

			logger.info("Password is not Updated");
			response.sendRedirect("vendor_change_password.jsp?success=no");
		}
		}catch (Exception e) {
		    try {
					logger.error("Password Not Updated try after sometimes");
					response.sendRedirect("error.jsp");
				} catch (IOException e1) {
					logger.error("IOException While Password Updating");
					e1.printStackTrace();
				}
	}
	}
}
	



							
		

