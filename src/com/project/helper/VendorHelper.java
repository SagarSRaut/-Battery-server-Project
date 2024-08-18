package com.project.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.project.bean.VendorBean;
import com.project.db.DBConnectionPool;

public class VendorHelper {

	/*
	 * add vendor
	 */
	
	static final Logger logger=Logger.getLogger(VendorHelper.class);
	
	public int addVendor(VendorBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		
		System.out.println("LastName.........."+bean.getVendor_lname());
		//System.out.println("In insert vendor method");
		String query = "insert into vendor_details_tbl(vendor_fname, vendor_lname,vendor_firm_name,vendor_address,"
				+ "vendor_mobile_number, vendor_contact_number,vendor_email,vendor_city,"
				+ "vendor_extra_details,vendor_username,vendor_password) values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, bean.getVendor_fname());
		pstmt.setString(2, bean.getVendor_lname());
		pstmt.setString(3, bean.getVendor_firm_name());
		pstmt.setString(4, bean.getVendor_address());
		pstmt.setString(5, bean.getVendor_mobile_number());
		pstmt.setString(6, bean.getVendor_contact_number());
		pstmt.setString(7, bean.getVendor_email());
		pstmt.setString(8, bean.getVendor_city());
		pstmt.setString(9, bean.getVendor_extra_details());
		pstmt.setString(10, bean.getVendor_username());
		pstmt.setString(11, bean.getVendor_password());

		int status=pstmt.executeUpdate();
		System.out.println("data is inserted successfully..");
		logger.info("In addVendor Method query executed");
		return status;
	}

	/*
	 * Use to validate Vendor
	 */
	public VendorBean validateVendor(VendorBean bean) throws SQLException {
		System.out.println("validate Vendor");
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		try {
			String query = "select vendor_id from vendor_details_tbl where vendor_username=? and vendor_password=?";
			PreparedStatement preparestatement = connection.prepareStatement(query);
			preparestatement.setString(1, bean.getVendor_username());
			preparestatement.setString(2, bean.getVendor_password());
			
			ResultSet resultSet = preparestatement.executeQuery();
			if (resultSet.next()) {
				bean.setVendor_id(resultSet.getInt("vendor_id"));
				logger.info("In validateVendor method query executed");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}

	/*
	 * 
	 * search by vendor id
	 */
	public VendorBean getVendorById(VendorBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from vendor_details_tbl where vendor_id=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setInt(1, bean.getVendor_id());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new VendorBean();
			bean.setVendor_id(rs.getInt("vendor_id"));
			bean.setVendor_fname(rs.getString("vendor_fname"));
			bean.setVendor_lname(rs.getString("vendor_lname"));
			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
			bean.setVendor_address(rs.getString("vendor_address"));
			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
			bean.setVendor_email(rs.getString("vendor_email"));
			bean.setVendor_city(rs.getString("vendor_city"));
			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
			bean.setVendor_username(rs.getString("vendor_username"));
			bean.setVendor_password(rs.getString("vendor_password"));

		}
		logger.info("In getVendorById method query executed");

		return bean;
	}
	
	/*
	 * 
	 * search by vendor fname
	 */
	public VendorBean getVendorByFname(VendorBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from vendor_details_tbl where vendor_fname=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, bean.getVendor_fname());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new VendorBean();
			bean.setVendor_id(rs.getInt("vendor_id"));
			bean.setVendor_fname(rs.getString("vendor_fname"));
			bean.setVendor_lname(rs.getString("vendor_lname"));
			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
			bean.setVendor_address(rs.getString("vendor_address"));
			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
			bean.setVendor_email(rs.getString("vendor_email"));
			bean.setVendor_city(rs.getString("vendor_city"));
			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
			bean.setVendor_username(rs.getString("vendor_username"));
			bean.setVendor_password(rs.getString("vendor_password"));

		}
		logger.info("In getVendorByFname method query executed");

		return bean;
	}
	
	/*
	 * 
	 * search by vendor lname
	 */
	public VendorBean getVendorByLname(VendorBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from vendor_details_tbl where vendor_lname=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, bean.getVendor_lname());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new VendorBean();
			bean.setVendor_id(rs.getInt("vendor_id"));
			bean.setVendor_fname(rs.getString("vendor_fname"));
			bean.setVendor_lname(rs.getString("vendor_lname"));
			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
			bean.setVendor_address(rs.getString("vendor_address"));
			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
			bean.setVendor_email(rs.getString("vendor_email"));
			bean.setVendor_city(rs.getString("vendor_city"));
			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
			bean.setVendor_username(rs.getString("vendor_username"));
			bean.setVendor_password(rs.getString("vendor_password"));

		}
		logger.info("In getVendorByLname method query executed");

		return bean;
	}
	
	/*
	 * 
	 * search by vendor mobile no
	 */
	public VendorBean getVendorByMobileNo(VendorBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from vendor_details_tbl where vendor_mobile_number=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, bean.getVendor_mobile_number());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new VendorBean();
			bean.setVendor_id(rs.getInt("vendor_id"));
			bean.setVendor_fname(rs.getString("vendor_fname"));
			bean.setVendor_lname(rs.getString("vendor_lname"));
			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
			bean.setVendor_address(rs.getString("vendor_address"));
			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
			bean.setVendor_email(rs.getString("vendor_email"));
			bean.setVendor_city(rs.getString("vendor_city"));
			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
			bean.setVendor_username(rs.getString("vendor_username"));
			bean.setVendor_password(rs.getString("vendor_password"));

		}
		logger.info("In getVendorByMobileNo method query executed");

		return bean;
	}
	
	/*
	 * 
	 * search by vendor email id
	 */
	public VendorBean getVendorByEmailId(VendorBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from vendor_details_tbl where vendor_email=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, bean.getVendor_email());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new VendorBean();
			bean.setVendor_id(rs.getInt("vendor_id"));
			bean.setVendor_fname(rs.getString("vendor_fname"));
			bean.setVendor_lname(rs.getString("vendor_lname"));
			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
			bean.setVendor_address(rs.getString("vendor_address"));
			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
			bean.setVendor_email(rs.getString("vendor_email"));
			bean.setVendor_city(rs.getString("vendor_city"));
			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
			bean.setVendor_username(rs.getString("vendor_username"));
			bean.setVendor_password(rs.getString("vendor_password"));

		}
		logger.info("In getVendorByEmailId method query executed");

		return bean;
	}
	
	/*
	 * Get Vendor By UserName
	 * */
	
	public VendorBean getVendorByUserName(VendorBean bean) throws SQLException {

		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		String query = "select * from vendor_details_tbl where vendor_username=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, bean.getVendor_username());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bean = new VendorBean();
			bean.setVendor_id(rs.getInt("vendor_id"));
			bean.setVendor_fname(rs.getString("vendor_fname"));
			bean.setVendor_lname(rs.getString("vendor_lname"));
			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
			bean.setVendor_address(rs.getString("vendor_address"));
			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
			bean.setVendor_email(rs.getString("vendor_email"));
			bean.setVendor_city(rs.getString("vendor_city"));
			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
			bean.setVendor_username(rs.getString("vendor_username"));
			bean.setVendor_password(rs.getString("vendor_password"));

		}
		logger.info("In getVendorByUserName method query executed");

		return bean;
	}
	
	
	/*
	 * view all vendors
	 * 
	 * */
	
	public List<VendorBean> viewAllVendors(){  
        List<VendorBean> list=new ArrayList<VendorBean>();  
          
        try{  
        	DBConnectionPool pool = DBConnectionPool.getInstance();
    		Connection connection = pool.getConnection();
    		 PreparedStatement ps=connection.prepareStatement("select * from vendor_details_tbl");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
            	VendorBean bean=new VendorBean();  
            	bean.setVendor_id(rs.getInt("vendor_id"));
    			bean.setVendor_fname(rs.getString("vendor_fname"));
    			bean.setVendor_lname(rs.getString("vendor_lname"));
    			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
    			bean.setVendor_address(rs.getString("vendor_address"));
    			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
    			bean.setVendor_email(rs.getString("vendor_email"));
    			bean.setVendor_city(rs.getString("vendor_city"));
    			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
    			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
    			bean.setVendor_username(rs.getString("vendor_username"));
    			bean.setVendor_password(rs.getString("vendor_password"));
                list.add(bean);  
            }  
            connection.close();  
        }catch(Exception e)
        {
        	logger.error(e);
        	e.printStackTrace();
        }  
		logger.info("In viewAllVendors method query executed");

        return list;  
    }  
	
	
	/*
	 * delete vendor
	 * 
	 * */
	
	public int deleteVendor(VendorBean bean){  
        int status=0;  
        try{  
        	DBConnectionPool pool = DBConnectionPool.getInstance();
    		Connection connection = pool.getConnection();
    		String query="delete from vendor_details_tbl where vendor_id=?";
            PreparedStatement pstmt=connection.prepareStatement(query);  
            pstmt.setInt(1,bean.getVendor_id());  
            status=pstmt.executeUpdate();  
              
            connection.close();  
        }catch(Exception e)
        {
        	logger.error(e);

        	e.printStackTrace();
        }  
		logger.info("In deleteVendor method query executed");

        return status;  
    }  
	
	/*
	 * updateMachineDetails
	 * 
	 * */
	
	 public VendorBean updateVendorDetails(VendorBean bean) throws SQLException{  
	        
	        
		 DBConnectionPool pool = DBConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			String query="update vendor_details_tbl set vendor_fname=?,vendor_lname=?,vendor_firm_name=?,"
	    				+ "vendor_address=?,vendor_mobile_number=?,vendor_email=?,vendor_city=?,"
	    				+ "vendor_extra_details=?,vendor_contact_number=?,vendor_password=? where vendor_id=?";
	            PreparedStatement pstmt=connection.prepareStatement(query);
	            pstmt.setString(1, bean.getVendor_fname());
	            pstmt.setString(2, bean.getVendor_lname());
	            pstmt.setString(3, bean.getVendor_firm_name());
	            pstmt.setString(4, bean.getVendor_address());
	    		pstmt.setString(5, bean.getVendor_mobile_number());
	    		pstmt.setString(6, bean.getVendor_email());
	    		pstmt.setString(7, bean.getVendor_city());
	    		pstmt.setString(8, bean.getVendor_extra_details());
	    		pstmt.setString(9, bean.getVendor_contact_number());
	    		pstmt.setString(10, bean.getVendor_password());
	    		pstmt.setInt(11, bean.getVendor_id());
	              
	            pstmt.executeUpdate();    
	            connection.close(); 
	    		logger.info("In updateVendorDetails method query executed");

	        return bean;  
	    }  
	 
	 public VendorBean forgotPassword(VendorBean bean) throws SQLException
	 {
		
		 DBConnectionPool pool = DBConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			String query="select * from vendor_details_tbl where vendor_mobile_number=? and"
		 		+ " vendor_email=? and vendor_username=?";
		 PreparedStatement pstmt=connection.prepareStatement(query);
		 pstmt.setString(1, bean.getVendor_mobile_number());
		 pstmt.setString(2, bean.getVendor_email());
		 pstmt.setString(3, bean.getVendor_username());
		 
		 ResultSet rs=pstmt.executeQuery();
		 while(rs.next())
		 {
			bean =new VendorBean();
			bean.setVendor_id(rs.getInt("vendor_id"));
			bean.setVendor_fname(rs.getString("vendor_fname"));
			bean.setVendor_lname(rs.getString("vendor_lname"));
			bean.setVendor_firm_name(rs.getString("vendor_firm_name"));
			bean.setVendor_address(rs.getString("vendor_address"));
			bean.setVendor_mobile_number(rs.getString("vendor_mobile_number"));
			bean.setVendor_email(rs.getString("vendor_email"));
			bean.setVendor_city(rs.getString("vendor_city"));
			bean.setVendor_extra_details(rs.getString("vendor_extra_details"));
			bean.setVendor_contact_number(rs.getString("vendor_contact_number"));
			bean.setVendor_username(rs.getString("vendor_username"));
			bean.setVendor_password(rs.getString("vendor_password"));
		 }
		 connection.close();
			logger.info("In forgotPassword method query executed");

		return bean;
		 
	 }
	 
	 public VendorBean changePassword(VendorBean bean) throws SQLException 
		{
			DBConnectionPool pool = DBConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			String query="update vendor_details_tbl set vendor_password=? where vendor_id=?";
			PreparedStatement pstmt=connection.prepareStatement(query);
			pstmt.setString(1, bean.getVendor_password());
			pstmt.setInt(2, bean.getVendor_id());
	        
			 pstmt.executeUpdate();    
	         connection.close();  
			return bean;
		}
}
