function validateVendorRegitration(form) {

	//alert("Welcome Vendor Registration Validation");
	
	

	if (form.vendor_fname.value == "") {
		alert("Error: vendor firstname cannot be blank!");
		form.vendor_fname.focus();
		return false;
	}
	re = /[0-9]/;
	if (re.test(form.vendor_fname.value)) {
		alert("Error: vendor firstname should not contain numbers!");
		form.vendor_fname.focus();
		return false;
	}
	re = /[@#$%^&+=]/;
	if (re.test(form.vendor_fname.value)) {
		alert("Error: vendor firstname should not contain other character!");
		form.vendor_fname.focus();
		return false;
	}
	
	 	if (form.vendor_lname.value == "") {
		alert("Error: vendor lastname cannot be blank!");
		form.vendor_lname.focus();
		return false;
	}
	re = /[0-9]/;
	if (re.test(form.vendor_lname.value)) {
		alert("Error: vendor lastname should not contain numbers!");
		form.vendor_lname.focus();
		return false;
	}
	re = /[@#$%^&+=]/;
	if (re.test(form.vendor_lname.value)) {
		alert("Error: vendor lastname should not contain other character!");
		form.vendor_lname.focus();
		return false;
	}
	
	
	
		
	if (form.vendor_firm_name.value == "") {
		alert("Error: vendor firm name cannot be blank!");
		form.vendor_firm_name.focus();
		return false;
	}
	
	
	if (form.vendor_mobile_number.value == "") {
		alert("Error: Mobile Number cannot be blank!");
		form.vendor_mobile_number.focus();
		return false;
	}
	re = /[0-9]/;
	if (!re.test(form.vendor_mobile_number.value)) {
		alert("Error: Mobile Number contain digit!");
		form.vendor_mobile_number.focus();
		return false;
	}

	re = /^[0-9]{10,12}$/;
	if (!re.test(form.vendor_mobile_number.value)) {
		alert("Error: Enter 10 or 12 digit Mobile Number!");
		form.vendor_mobile_number.focus();
		return false;
	}
	
	
	if (form.vendor_contact_number.value == "") {
		alert("Error: Contact Number cannot be blank!");
		form.vendor_mobile_number.focus();
		return false;
	}
	re = /[0-9]/;
	if (!re.test(form.vendor_contact_number.value)) {
		alert("Error: Contact Number contain digit!");
		form.vendor_contact_number.focus();
		return false;
	}

	re = /^[0-9]{10,12}$/;
	if (!re.test(form.vendor_contact_number.value)) {
		alert("Error: Enter 11 digit Contact Number!");
		form.vendor_mobile_number.focus();
		return false;
	}
	
	if (form.vendor_email.value == "") {
		alert("Error: Email Id cannot be blank!");
		form.vendor_email.focus();
		return false;
	}
	re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	

	if (!re.test(form.vendor_email.value)) {
		alert("Error: Invalid Email Id!");
		form.vendor_email.focus();
		return false;
	}
	
	if (form.vendor_address.value == "") {
		alert("Error: Vendor Address cannot be blank!");
		form.vendor_address.focus();
		return false;
	}
	
	if (form.vendor_city.value == "") {
		alert("Error: Vendor City cannot be blank!");
		form.vendor_city.focus();
		return false;
	}
	
		
		re = /[0-9]/;
		if (re.test(form.vendor_city.value)) {
			alert("Error: vendor City should not contain numbers!");
			form.vendor_city.focus();
			return false;
		}
		
	
		re = /[@#$%^&+=]/;
		if (re.test(form.vendor_city.value)) {
			alert("Error: vendor City should not contain other character!");
			form.vendor_city.focus();
			return false;
		}
		
		
	
	if (form.vendor_extra_details.value == "") {
		alert("Error: Vendor Extra Details cannot be blank!");
		form.vendor_extra_details.focus();
		return false;
	}
	
	if (form.vendor_username.value == "") {
		alert("Error: Username cannot be blank!");
		form.vendor_username.focus();
		return false;
	}
	
	re = /[0-9]/;
	if (re.test(form.vendor_username.value)) {
		alert("Error: Username should not contain numbers!");
		form.vendor_username.focus();
		return false;
	}
	re = /[@#$%^&+=]/;
	if (re.test(form.vendor_username.value)) {
		alert("Error: vendor username should not contain other character!");
		form.vendor_username.focus();
		return false;
	}
	
	re = /[\s]/;
	if (re.test(form.vendor_username.value)) {
		alert("Error: vendor username should not contain whitespace!");
		form.vendor_username.focus();
		return false;
	}

	if (form.vendor_password.value == "") {
		alert("Error: Password cannot be blank!");
		form.vendor_password.focus();
		return false;
	}
	if (form.vendor_password.value != "")
	 {
			if (form.vendor_password.value.length < 6)
			 {
				alert("Error: Password must contain at least six characters!");
				form.vendor_password.focus();
				return false;
			}
			 if (form.vendor_password.value == form.vendor_username.value)
			 {
				alert("Error: Password must be different from Username!");
				form.vendor_password.focus();
				return false;
			}
			re = /[0-9]/;
			 if (!re.test(form.vendor_password.value)) 
			{
				alert("Error: password must contain at least one number (0-9)!");
				form.vendor_password.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(form.vendor_password.value))
			 {
				alert("Error: password must contain at least one lowercase letter (a-z)!");
				form.vendor_password.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(form.vendor_password.value)) 
			{
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				form.vendor_password.focus();
				return false;
				
				
			}
			if (form.vendor_password.value != form.vendor_confirm_password.value) 
			{
				alert("Error: password must match with confirm password!");
				form.vendor_confirm_password.focus();
				return false;
				
				
			}
			
	}
	 else 
	{
			alert("Error: Please check that you've entered and confirmed your password!");
			form.vendor_password.focus();
			return false;
	}
	
	return true;
}


