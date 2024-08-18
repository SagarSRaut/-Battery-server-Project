package com.project.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;








import com.project.bean.AdminBean;
import com.project.bean.MachineBean;
import com.project.bean.VendorBean;
import com.project.db.DBConnectionPool;

public class AdminHelper {	
	
	private Logger logger;
	
	public AdminBean validateAdmin(AdminBean bean) throws SQLException 
	{
		logger = Logger.getLogger(AdminHelper.class);
		
		System.out.println("validateUser");
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		
			String query="Select * from admin_details_tbl where admin_username=? and admin_password=?";
			PreparedStatement preparestatement = connection.prepareStatement(query);
			preparestatement.setString(1, bean.getAdmin_username());
			preparestatement.setString(2, bean.getAdmin_password());

			ResultSet resultSet = preparestatement.executeQuery();
	
			if (resultSet.next()) {
				bean.setAdmin_fname("Admin");
			}
			logger.info("Query Executed in Admin Helper");
			return bean;
			
	}
	
	public Map<VendorBean, MachineBean> getRecharge(VendorBean bean) throws SQLException{
		MachineBean machineBean =new MachineBean();
		
		 Map<VendorBean,MachineBean> map=new HashMap<VendorBean,MachineBean>(); 
		
		/*List<VendorBean> list=new ArrayList<VendorBean>();
		List<MachineBean> machinelist=new ArrayList<MachineBean>();*/
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection=pool.getConnection();
		
		String query="select * from vendor_details_tbl join machine_details_tbl on machine_vendor_id=vendor_id";
		
		PreparedStatement pstmt=connection.prepareStatement(query);
		ResultSet resultSet = pstmt.executeQuery();
		while(resultSet.next())
		{
			bean.setVendor_fname(resultSet.getString("vendor_fname"));
			machineBean.setMachine_name(resultSet.getString("machine_name"));
			machineBean.setAllocated_KWH(resultSet.getString("allocated_KWH"));
			map.put(bean,machineBean);
		}
		
		
		/*while(resultSet.next())
		{
			bean.setVendor_id(resultSet.getInt("vendor_id"));
			String query1="select * from machine_details_tbl where machine_vendor_id=?";
			pstmt.setInt(1, bean.getVendor_id());
			ResultSet machineRs=pstmt.executeQuery(query1);
			while(machineRs.next())
			{
				machineBean.setMachine_name(machineRs.getString("machine_fname"));
				machinelist.add(machineBean);
			}
			bean.setVendor_fname(resultSet.getString("vendor_fname"));
			bean.setMachinelist(machinelist);
			
		}
		*/
		return map;
	}
	
}
