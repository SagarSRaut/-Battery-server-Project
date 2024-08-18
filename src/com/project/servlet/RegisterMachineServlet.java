package com.project.servlet;

import java.io.IOException;
import java.sql.SQLException;




import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.project.bean.MachineBean;
import com.project.helper.MachineHelper;


public class RegisterMachineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		
		logger = Logger.getLogger(RegisterMachineServlet.class);
		
		try {
			int machine_vendor_id = Integer.parseInt(request.getParameter("machine_vendor_id"));
			
			
			String machine_name = request.getParameter("machine_name");
			String machine_specification = request.getParameter("machine_specification");
			int machine_serial_no = Integer.parseInt(request.getParameter("machine_serial_no"));
			
			String machine_activation_code = request.getParameter("machine_activation_code");
			//System.out.println(machine_activation_code);
			String machine_status = request.getParameter("machine_status");
			String machine_password = request.getParameter("machine_password");
			String allocated_KWH = request.getParameter("allocated_KWH");

			MachineBean bean = new MachineBean();
			bean.setMachine_id(-1);
			bean.setMachine_vendor_id(machine_vendor_id);
			bean.setMachine_name(machine_name);
			bean.setMachine_specification(machine_specification);
			bean.setMachine_serial_no(machine_serial_no);
			bean.setMachine_activation_code(machine_activation_code);
			bean.setMachine_status(machine_status);
			bean.setMachine_password(machine_password);
			bean.setAllocated_KWH(allocated_KWH);

			MachineHelper helper = new MachineHelper();
			try {
				bean = helper.addMachine(bean);
			} catch (SQLException e) {
				
				
				e.printStackTrace();
				logger.error("Database Error while Machine Details Register"+e);
				//response.sendRedirect("error.jsp?msg=DB error");
			}

			if (bean != null && bean.getMachine_id() > 0) {
				logger.info("Machine Details Registered Successfully");
				response.sendRedirect("machine_register.jsp?success=yes");
			} else {
				logger.info("Machine Details not Registered");
				response.sendRedirect("machine_details.jsp?success=no&machine_vendor_id="+machine_vendor_id);
			}

		} catch (Exception e) {

			try {
				logger.error("Machine Deatils Not Registred try after sometimes");
				response.sendRedirect("error.jsp");
			} catch (IOException e1) {
				logger.error("IOException While Machine Register"+e1);
				e1.printStackTrace();
			}
		}
	}
}
