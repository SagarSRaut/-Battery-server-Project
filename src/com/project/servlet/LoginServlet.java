package com.project.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.project.bean.AdminBean;
import com.project.bean.VendorBean;
import com.project.helper.AdminHelper;
import com.project.helper.VendorHelper;

import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		logger = Logger.getLogger(LoginServlet.class);
		 
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		AdminBean adminBean = new AdminBean();
		adminBean.setAdmin_username(username);
		adminBean.setAdmin_password(password);
		adminBean.setAdmin_fname("");

		AdminHelper aHelper = new AdminHelper();

		try {

			adminBean = aHelper.validateAdmin(adminBean);
			
			
			if(adminBean.getAdmin_fname().length() > 1)
			{
				HttpSession adminSession=req.getSession();
				adminSession.setAttribute("userbean",adminBean);
				adminSession.setAttribute("USER_TYPE", "ADMIN");
				logger.info("Admin UserName and Passsword is Vaild Admin loged in");
				resp.sendRedirect("welcome_admin.jsp");				
			}
			else
			{				
				VendorBean vendorBean = new VendorBean();
				vendorBean.setVendor_username(username);
				vendorBean.setVendor_password(password);
				
				
				vendorBean.setVendor_id(-1);
				
				VendorHelper vHelper = new VendorHelper();
				vendorBean = vHelper.validateVendor(vendorBean);
				vendorBean=  vHelper.getVendorById(vendorBean);
				
				
				if(vendorBean.getVendor_id() > 0)
				{
					HttpSession vendorSession=req.getSession();
					vendorSession.setAttribute("userbean",vendorBean);
					vendorSession.setAttribute("USER_TYPE", "VENDOR");
					logger.info("Vendor UserName and Passsword is Vaild vendor loged in");
					resp.sendRedirect("welcome_vendor.jsp");
					
				}
				else
				{
					logger.info("invalid user...");
					resp.sendRedirect("login.jsp?msg=Error");
				}
			}
		} catch (SQLException e) {
			logger.error("Something wrong While Login"+e);
			e.printStackTrace();
		}
	}
}
