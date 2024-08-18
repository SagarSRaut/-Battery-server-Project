package com.project.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.project.bean.MachineBean;
import com.project.bean.VendorBean;
import com.project.db.DBConnectionPool;

public class MachineHelper {

	static final Logger logger=Logger.getLogger("MachineHelper.class");
	public MachineBean addMachine(MachineBean bean) throws SQLException {
		
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		
		System.out.println("In add machine method");
		String query="insert into machine_details_tbl(machine_vendor_id,machine_name,machine_specification,"
				+ "machine_serial_no,machine_activation_code,machine_status,machine_password,allocated_KWH)"
				+ " values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=connection.prepareStatement(query);
		pstmt.setInt(1, bean.getMachine_vendor_id());
		pstmt.setString(2, bean.getMachine_name());
		pstmt.setString(3, bean.getMachine_specification());
		pstmt.setInt(4, bean.getMachine_serial_no());
		pstmt.setString(5, bean.getMachine_activation_code());
		pstmt.setString(6, bean.getMachine_status());
		pstmt.setString(7, bean.getMachine_password());
		pstmt.setString(8, bean.getAllocated_KWH());
		

		pstmt.executeUpdate();
		logger.info("In AddMachine Method insert query Executed");
		return bean;		
	}

	public List<MachineBean> viewAllMachines() throws SQLException{
		List<MachineBean> list=new ArrayList<MachineBean>();  
		
		
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
	            PreparedStatement ps=connection.prepareStatement("select * from machine_details_tbl");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	            	MachineBean bean=new MachineBean();
	            	
	            	bean.setMachine_id(rs.getInt("machine_id"));
	            	bean.setMachine_vendor_id(rs.getInt("machine_vendor_id"));
	            	bean.setMachine_name(rs.getString("machine_name"));
	            	bean.setMachine_specification(rs.getString("machine_specification"));
	            	bean.setMachine_serial_no(rs.getInt("machine_serial_no"));
	            	bean.setMachine_activation_code(rs.getString("machine_activation_code"));
	            	bean.setMachine_status(rs.getString("machine_status"));
	            	bean.setMachine_password(rs.getString("machine_password"));
	            	bean.setAllocated_KWH(rs.getString("allocated_KWH"));
	            	list.add(bean);  
	  	            connection.close();        
	}
	            logger.info("In ViewallMachine method view all query executed");
	            return list;
	}
	
	public MachineBean getMachineById(MachineBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from machine_details_tbl where machine_id=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, bean.getMachine_id());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new MachineBean();
			bean.setMachine_id(rs.getInt("machine_id"));
        	bean.setMachine_vendor_id(rs.getInt("machine_vendor_id"));
        	bean.setMachine_name(rs.getString("machine_name"));
        	bean.setMachine_specification(rs.getString("machine_specification"));
        	bean.setMachine_serial_no(rs.getInt("machine_serial_no"));
        	bean.setMachine_activation_code(rs.getString("machine_activation_code"));
        	bean.setMachine_status(rs.getString("machine_status"));
        	bean.setMachine_password(rs.getString("machine_password"));
        	bean.setAllocated_KWH(rs.getString("allocated_KWH"));
		}
		logger.info("In getMachineById method query executed");
		return bean;
	}
	
	public MachineBean getMachineByName(MachineBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from machine_details_tbl where machine_name=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, bean.getMachine_name());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new MachineBean();
			bean.setMachine_id(rs.getInt("machine_id"));
        	bean.setMachine_vendor_id(rs.getInt("machine_vendor_id"));
        	bean.setMachine_name(rs.getString("machine_name"));
        	bean.setMachine_specification(rs.getString("machine_specification"));
        	bean.setMachine_serial_no(rs.getInt("machine_serial_no"));
        	bean.setMachine_activation_code(rs.getString("machine_activation_code"));
        	bean.setMachine_status(rs.getString("machine_status"));
        	bean.setMachine_password(rs.getString("machine_password"));
        	bean.setAllocated_KWH(rs.getString("allocated_KWH"));
		}
		logger.info("In getMachineByName method query executed");
		return bean;
	}
	
	public List<MachineBean> getOngoingSession(MachineBean bean) throws SQLException
	{
		List<MachineBean> list=new ArrayList<MachineBean>();  
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection =pool.getConnection();
		String query=" select * from machine_details_tbl join session_tbl using (machine_id) where status='In-progress'";
		PreparedStatement pstmt=connection.prepareStatement(query);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			bean.setMachine_name(rs.getString("machine_name"));
        	bean.setMachine_specification(rs.getString("machine_specification"));
        	bean.setMachine_serial_no(rs.getInt("machine_serial_no"));
        	bean.setMachine_activation_code(rs.getString("machine_activation_code"));
        	bean.setMachine_status(rs.getString("machine_status"));
        	list.add(bean);
        	
		}
		return list;
	}
	
	
	public MachineBean getMachineBySerialNo(MachineBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from machine_details_tbl where machine_serial_no=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, bean.getMachine_serial_no());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new MachineBean();
			bean.setMachine_id(rs.getInt("machine_id"));
        	bean.setMachine_vendor_id(rs.getInt("machine_vendor_id"));
        	bean.setMachine_name(rs.getString("machine_name"));
        	bean.setMachine_specification(rs.getString("machine_specification"));
        	bean.setMachine_serial_no(rs.getInt("machine_serial_no"));
        	bean.setMachine_activation_code(rs.getString("machine_activation_code"));
        	bean.setMachine_status(rs.getString("machine_status"));
        	bean.setMachine_password(rs.getString("machine_password"));
        	bean.setAllocated_KWH(rs.getString("allocated_KWH"));
		}
		logger.info("In getMachineBySerialNo method query executed");
		return bean;
	}
	
	public int deleteMachine(MachineBean bean){  
        int status=0;  
        try{  
        	DBConnectionPool pool = DBConnectionPool.getInstance();
    		Connection connection = pool.getConnection();
    		String query="delete from machine_details_tbl where machine_id=?";
            PreparedStatement pstmt=connection.prepareStatement(query);  
            pstmt.setInt(1,bean.getMachine_id());  
            status=pstmt.executeUpdate();  
              
            connection.close();  
        }catch(Exception e)
        {
        	e.printStackTrace();
        }  
        logger.info("In deleteMachine method query executed");
        return status;  
    } 
	
	public int updateMachineDetails(MachineBean bean) throws SQLException{  
       
        
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
    		String query="update machine_details_tbl set machine_vendor_id=?,machine_name=?,machine_specification=?,"
				+ "machine_serial_no=?,machine_activation_code=?,machine_status=?,machine_password=?,"
				+ "machine_other_2=? where machine_id=?";
            PreparedStatement pstmt=connection.prepareStatement(query);  
            pstmt.setInt(1, bean.getMachine_vendor_id());
    		pstmt.setString(2, bean.getMachine_name());
    		pstmt.setString(3, bean.getMachine_specification());
    		pstmt.setInt(4, bean.getMachine_serial_no());
    		pstmt.setString(5, bean.getMachine_activation_code());
    		pstmt.setString(6, bean.getMachine_status());
    		pstmt.setString(7, bean.getMachine_password());
    	//	pstmt.setString(8, bean.getAllocated_KWH());
    	
            pstmt.setInt(9, bean.getMachine_id());  
           
            int status=pstmt.executeUpdate();    
            logger.info("In updateMachineDetails method query executed");
        return status;  
    }

	public List<MachineBean> getMachineByVendorId(MachineBean machineBean) throws SQLException {
		
		List<MachineBean> list=new ArrayList<MachineBean>();  
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query=" select * from machine_details_tbl left join vendor_details_tbl on machine_vendor_id=vendor_id"
				+ " where machine_vendor_id=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, machineBean.getMachine_vendor_id());
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			machineBean=new MachineBean();
			machineBean.setMachine_id(rs.getInt("machine_id"));
			machineBean.setMachine_vendor_id(rs.getInt("machine_vendor_id"));
			machineBean.setMachine_name(rs.getString("machine_name"));
			machineBean.setMachine_specification(rs.getString("machine_specification"));
			machineBean.setMachine_serial_no(rs.getInt("machine_serial_no"));
			machineBean.setMachine_activation_code(rs.getString("machine_activation_code"));
			machineBean.setMachine_status(rs.getString("machine_status"));
			machineBean.setMachine_password(rs.getString("machine_password"));
			machineBean.setAllocated_KWH(rs.getString("allocated_KWH"));
		//	machineBean.setMachine_other_2(rs.getString("machine_other_2"));
			list.add(machineBean);   
	                 
		}
		 logger.info("In getMachineByVendorId method query executed");
		return list;
		
	}  
	
public List<MachineBean> getAllMachinesByVendorId(VendorBean vendorBean) throws SQLException {
	int vendor_id=vendorBean.getVendor_id();	
	
		List<MachineBean> list=new ArrayList<MachineBean>();  
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query=" select * from machine_details_tbl where machine_vendor_id=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, vendor_id);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			MachineBean machineBean=new MachineBean();
			machineBean.setMachine_id(rs.getInt("machine_id"));
			machineBean.setMachine_vendor_id(rs.getInt("machine_vendor_id"));
			machineBean.setMachine_name(rs.getString("machine_name"));
			machineBean.setMachine_specification(rs.getString("machine_specification"));
			machineBean.setMachine_serial_no(rs.getInt("machine_serial_no"));
			machineBean.setMachine_activation_code(rs.getString("machine_activation_code"));
			machineBean.setMachine_status(rs.getString("machine_status"));
			machineBean.setMachine_password(rs.getString("machine_password"));
			machineBean.setAllocated_KWH(rs.getString("allocated_KWH"));
		//	machineBean.setMachine_other_2(rs.getString("machine_other_2"));
			list.add(machineBean);   
	                 
		}
		 logger.info("In getAllMachinesByVendorId method query executed");
		return list;
		
	}  

public List<MachineBean> getMachineRechargeByVendorId(MachineBean machineBean) throws SQLException {
	
	List<MachineBean> list=new ArrayList<MachineBean>();  
	DBConnectionPool pool = DBConnectionPool.getInstance();
	Connection connection = pool.getConnection();
	String query="select * from machine_details_tbl where machine_vendor_id=?";
	PreparedStatement ps = connection.prepareStatement(query);
	ps.setInt(1, machineBean.getMachine_vendor_id());
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		machineBean=new MachineBean();
		
		
		machineBean.setMachine_name(rs.getString("machine_name"));
		
		list.add(machineBean);  
                 
	}
	
	return list;
}
	
}

