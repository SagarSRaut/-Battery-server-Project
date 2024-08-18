package com.project.helper;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.project.bean.SessionBean;
import com.project.db.DBConnectionPool;

public class SessionHelper {
	
	public SessionBean addSession(SessionBean bean) {
		
		try {
			
		DBConnectionPool pool = DBConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		
		System.out.println("In add session method");
		String query = "insert into session_tbl(operation_mode,input_voltage,input_current,input_duration,"
		        + "start_date_time,end_date_time,status,actual_duration,total_kwh,machine_id) values(?,?,?,?,?,?,?,?,?,?)";
		
		final DateFormat dateFormat=new SimpleDateFormat("yyyy-mm-dd");
		
		
		Date currentDate=new Date();
		String start_date=dateFormat.format(currentDate);
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(currentDate);
		calendar.add(Calendar.DATE, 2);
		Date end_date=calendar.getTime();
		String end_date1=dateFormat.format(end_date);
		
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, bean.getOperation_mode());
		pstmt.setInt(2, bean.getInput_voltage());
		pstmt.setInt(3, bean.getInput_current());
		pstmt.setInt(4, bean.getInput_duration());
		pstmt.setString(5,start_date);
		pstmt.setString(6, end_date1);
		pstmt.setString(7, bean.getStatus());
		pstmt.setInt(8, bean.getActual_duration());
		pstmt.setInt(9, bean.getTotal_kwh());
		pstmt.setInt(10, bean.getMachine_id());
		

		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("data is inserted successfully..");

		
		return bean;
	}

	public static void main(String[] args) 
	{
		SessionHelper sessionHelper=new SessionHelper();
		SessionBean bean=new SessionBean();
		bean.setOperation_mode("discharging");
		bean.setInput_voltage(2);
		bean.setInput_current(4);
		bean.setInput_duration(2);
		bean.setStatus("stop");
		bean.setActual_duration(2);
		bean.setTotal_kwh(200);
		bean.setMachine_id(1);
		sessionHelper.addSession(bean);
	}

}
