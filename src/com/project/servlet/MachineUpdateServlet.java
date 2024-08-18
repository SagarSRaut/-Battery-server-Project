package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.project.bean.MachineBean;
import com.project.helper.MachineHelper;


@WebServlet("/MachineUpdateServlet")
public class MachineUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger; 
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = Logger.getLogger(MachineUpdateServlet.class);
		
		try {
			System.out.println(request.getParameter("machine_vendor_id"));
			int machine_id=Integer.parseInt(request.getParameter("machine_id"));
			int machine_vendor_id = Integer.parseInt(request.getParameter("machine_vendor_id"));
			String machine_name = request.getParameter("machine_name");
			String machine_specification = request.getParameter("machine_specification");
			int machine_serial_no = Integer.parseInt(request.getParameter("machine_serial_no"));
			String machine_activation_code = request.getParameter("machine_activation_code");
			String machine_status = request.getParameter("machine_status");
			String machine_password = request.getParameter("machine_password");
			String allocated_KWH = request.getParameter("allocated_KWH");

			MachineBean bean = new MachineBean();
			bean.setMachine_id(machine_id);
			bean.setMachine_vendor_id(machine_vendor_id);
			bean.setMachine_name(machine_name);
			bean.setMachine_specification(machine_specification);
			bean.setMachine_serial_no(machine_serial_no);
			bean.setMachine_activation_code(machine_activation_code);
			bean.setMachine_status(machine_status);
			bean.setMachine_password(machine_password);
			bean.setAllocated_KWH(allocated_KWH);
			
			MachineHelper machineHelper=new MachineHelper();
			int status=machineHelper.updateMachineDetails(bean);
			if(status>0)
			{
				logger.info("machine updated successfully");
				response.sendRedirect("machine_details.jsp?machine_vendor_id="+machine_vendor_id);
			}
			else
			{
				logger.info("machine updated error");
				response.sendRedirect("machine_update.jsp?success=no");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			logger.error("something goes wrong in MachineUpdateServlet"+e);
		}

	}

}
