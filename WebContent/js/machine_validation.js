function validateMachineRegitration(form) {

	//alert("Welcome User Registration Validation");
	
	if (form.machine_vendor_id.value == "") {
		alert("Error: Machine Vendor Id cannot be blank!");
		form.machine_vendor_id.focus();
		return false;
	}

	
		re = /[0-9]/;
	if (!re.test(form.machine_vendor_id.value)) {
		alert("Error: Machine Vendor Id contain digit!");
		form.machine_vendor_id.focus();
		return false;
	}

	
	
	if (form.machine_name.value == "") {
		alert("Error: machine name cannot be blank!");
		form.machine_name.focus();
		return false;
	}
	
	
	if (form.machine_specification.value == "") {
		alert("Error:Machine Specification cannot be blank!");
		form.machine_specification.focus();
		return false;
	}
	
	if (form.machine_serial_no.value == "") {
		alert("Error: Machine Serial  Number cannot be blank!");
		form.machine_serial_no.focus();
		return false;
	}
	re = /[0-9]/;
	if (!re.test(form.machine_serial_no.value)) {
		alert("Error: Machine serial Number contain digit!");
		form.machine_serial_no.focus();
		return false;
	}

	re = /^[0-9]{10,12}$/;
	if (!re.test(form.machine_serial_no.value)) {
		alert("Error: Enter 10 digit Machine serial Number!");
		form.machine_serial_noo.focus();
		return false;
	}
	
	if (form.machine_password.value == "") {
		alert("Error: Password cannot be blank!");
		form.machine_password.focus();
		return false;
	}
	if (form.machine_password.value != "")
	 {
			if (form.machine_password.value.length < 6)
			 {
				alert("Error: Password must contain at least six characters!");
				form.machine_password.focus();
				return false;
			}
		
			re = /[0-9]/;
			 if (!re.test(form.machine_password.value)) 
			{
				alert("Error: password must contain at least one number (0-9)!");
				form.machine_password.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(form.machine_password.value))
			 {
				alert("Error: password must contain at least one lowercase letter (a-z)!");
				form.machine_password.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(form.machine_password.value)) 
			{
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				form.machine_password.focus();
				return false;
				
				
			}
			
			
	}
	 else 
	{
			alert("Error: Please check that you've entered and confirmed your password!");
			form.vendor_password.focus();
			return false;
	}
	
	

	
	/*if (form.machine_other_1.value == "") {
		alert("Error: Machine Other 1 cannot be blank!");
		form.machine_other_1.focus();
		return false;
	}
	if (form.machine_other_2.value == "") {
		alert("Error: Machine Other 2 cannot be blank!");
		form.machine_other_2.focus();
		return false;
	}
	*/
	
	

	return true;
}


