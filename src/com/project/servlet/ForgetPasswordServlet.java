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


@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger logger=Logger.getLogger(ForgetPasswordServlet.class);

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String vendor_username=request.getParameter("vendor_username");
		String vendor_mobile_number = request.getParameter("vendor_mobile_number");
		String vendor_email = request.getParameter("vendor_email");

		VendorBean bean = new VendorBean();
		bean.setVendor_username(vendor_username);
		bean.setVendor_mobile_number(vendor_mobile_number);
		bean.setVendor_email(vendor_email);

		VendorHelper helper=new VendorHelper();


		try {
			bean=helper.forgotPassword(bean);
		} catch (SQLException e) {
			logger.error(e);
			e.printStackTrace();
		}
		String password=bean.getVendor_password();

		if(password!=null)
		{
			EmailHelper.getObject();
			try {
				logger.info("Password validate and Email has sent");
				EmailHelper.sendEmail(vendor_email, "Battery Server Forget Password","your password is "+password+". Plz try to login again.." );
			} catch (MessagingException e) {
				logger.error(e);

				e.printStackTrace();
			}				
		}
		response.sendRedirect("login.jsp?success=yes");
	}

}
