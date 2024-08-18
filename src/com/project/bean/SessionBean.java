package com.project.bean;

import java.util.Date;

public class SessionBean {

	int session_id;
	String operation_mode;
	int input_voltage;
	int input_current;
	int input_duration;
	String start_date_time;
	String end_date_time;
	String status;
	int actual_duration;
	int total_kwh;
	int machine_id;

	public int getSession_id() {
		return session_id;
	}

	public void setSession_id(int session_id) {
		this.session_id = session_id;
	}

	public String getOperation_mode() {
		return operation_mode;
	}

	public void setOperation_mode(String operation_mode) {
		this.operation_mode = operation_mode;
	}

	public int getInput_voltage() {
		return input_voltage;
	}

	public void setInput_voltage(int input_voltage) {
		this.input_voltage = input_voltage;
	}

	public int getInput_current() {
		return input_current;
	}

	public void setInput_current(int input_current) {
		this.input_current = input_current;
	}

	public int getInput_duration() {
		return input_duration;
	}

	public void setInput_duration(int input_duration) {
		this.input_duration = input_duration;
	}

	public String getStart_date_time() {
		return start_date_time;
	}

	public void setStart_date_time(String start_date_time) {
		this.start_date_time = start_date_time;
	}

	public String getEnd_date_time() {
		return end_date_time;
	}

	public void setEnd_date_time(String end_date_time) {
		this.end_date_time = end_date_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getActual_duration() {
		return actual_duration;
	}

	public void setActual_duration(int actual_duration) {
		this.actual_duration = actual_duration;
	}

	public int getTotal_kwh() {
		return total_kwh;
	}

	public void setTotal_kwh(int total_kwh) {
		this.total_kwh = total_kwh;
	}

	public int getMachine_id() {
		return machine_id;
	}

	public void setMachine_id(int machine_id) {
		this.machine_id = machine_id;
	}

	@Override
	public String toString() {
		return "SessionBean [session_id=" + session_id + ", operation_mode="
				+ operation_mode + ", input_voltage=" + input_voltage
				+ ", input_current=" + input_current + ", input_duration="
				+ input_duration + ", start_date_time=" + start_date_time
				+ ", end_date_time=" + end_date_time + ", status=" + status
				+ ", actual_duration=" + actual_duration + ", total_kwh="
				+ total_kwh + ", machine_id=" + machine_id + "]";
	}
	

}
