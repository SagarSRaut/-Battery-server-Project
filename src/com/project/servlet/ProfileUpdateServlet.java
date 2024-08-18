package com.project.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.project.bean.VendorBean;
import com.project.helper.VendorHelper;

@WebServlet("/ProfileUpdateServlet")
public class ProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = Logger.getLogger(VendorUpdateServlet.class);
			
			
		
		try {
			int vendor_id=Integer.parseInt(request.getParameter("vendor_id"));
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


			HttpSession session=request.getSession();
			
			VendorBean bean = (VendorBean) session.getAttribute("userbean");
					//new VendorBean();
			bean.setVendor_id(vendor_id);
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

			
			VendorHelper helper = new VendorHelper();
			try {
				bean = helper.updateVendorDetails(bean);
				
				System.out.println("vendor details......"+bean);
				
			} catch (SQLException e) {

				e.printStackTrace();
				logger.error("Database Error while Profile Updating Details"+e);
				//response.sendRedirect("error.jsp?msg=DB error");

			}

			if (bean != null && bean.getVendor_id() > 0) {
				logger.info("Profile Updated Successfully");
				response.sendRedirect("profileView.jsp?success=yes");
				
			} else {
				logger.info("Profile is not Updated");
				response.sendRedirect("profile_update.jsp?success=no");
			}

		} catch (Exception e) {

			try {
				logger.error("Profile Not Updated try after sometimes");
				response.sendRedirect("error.jsp");
			} catch (IOException e1) {
				logger.error("IOException While Profile Updating"+e);
				e1.printStackTrace();
			}
		}
		
	}

}
