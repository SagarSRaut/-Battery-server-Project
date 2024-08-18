package com.project.servlet;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.project.bean.VendorBean;
import com.project.helper.VendorHelper;

import com.project.helper.EmailHelper;


public class VendorRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException 
	{
		logger = Logger.getLogger(RegisterMachineServlet.class);

		try {
			String vendor_fname = request.getParameter("vendor_fname");
			String vendor_lname = request.getParameter("vendor_lname");
			String vendor_firm_name = request.getParameter("vendor_firm_name");
			String vendor_mobile_number = request.getParameter("vendor_mobile_number");
			String vendor_contact_number = request.getParameter("vendor_contact_number");
			String vendor_email = request.getParameter("vendor_email");
			String vendor_address = request.getParameter("vendor_address");
			String vendor_city = request.getParameter("vendor_city");
			String vendor_extra_details = request.getParameter("vendor_extra_details");
			String vendor_username =request.getParameter("vendor_username");
			String vendor_password =request.getParameter("vendor_password");


			
			VendorBean bean = new VendorBean();
			bean.setVendor_id(-1);
			bean.setVendor_fname(vendor_fname);
			bean.setVendor_lname(vendor_lname);
			bean.setVendor_firm_name(vendor_firm_name);
			bean.setVendor_address(vendor_address);
			bean.setVendor_mobile_number(vendor_mobile_number);
			bean.setVendor_email(vendor_email);
			bean.setVendor_city(vendor_city);
			bean.setVendor_extra_details(vendor_extra_details);
			bean.setVendor_contact_number(vendor_contact_number);
			bean.setVendor_username(vendor_username);
			bean.setVendor_password(vendor_password);

			int status=0;
			VendorHelper helper = new VendorHelper();
			try {
				 status = helper.addVendor(bean);
			
			} catch (SQLException e) {

				e.printStackTrace();
				logger.error("Database Error while Vendor Register"+e);
				//response.sendRedirect("error.jsp?msg=DB error");

			}
				System.out.println(status);
			if (status>0) {
				EmailHelper.getObject();
				EmailHelper.sendEmail(vendor_email,"Battery Server","Welcome "+vendor_fname+" Your username: "+vendor_username+" your password: "+vendor_password);
				logger.info("Vendor Registered Successfully");
				response.sendRedirect("vendor_registration.jsp?success=yes");
				
			} else {
				logger.info("Vendor not Registered");
				response.sendRedirect("vendor_registration.jsp?success=no");
			}

		} catch (Exception e) {

			try {
				logger.error("Vendor Not Registred try after sometimes");
				response.sendRedirect("error.jsp");
			} catch (IOException e1) {
				logger.error("IOException While Vendor trying to Register"+e);
				e1.printStackTrace();
			}
		}
	}
}
