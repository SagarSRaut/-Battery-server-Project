function validateForgetPassword(form) {

	//alert("Welcome Vendor Registration Validation");
	
	

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
	re = /[A-Za-z]/;
	if (!re.test(form.vendor_username.value)) {
		alert("Error: Username should not contain other character!");
		form.vendor_username.focus();
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
	
	
	return true;
}


