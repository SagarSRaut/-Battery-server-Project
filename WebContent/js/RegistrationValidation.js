function validateRegitration(form) {

	//alert("Welcome User Registration Validation");

	if (form.firstname.value == "") {
		alert("Error: firstname cannot be blank!");
		form.firstname.focus();
		return false;
	}
	re = /[0-9]/;
	if (re.test(form.firstname.value)) {
		alert("Error: firstname should not contain numbers!");
		form.firstname.focus();
		return false;
	}
	re = /[A-Za-z]/;
	if (!re.test(form.firstname.value)) {
		alert("Error: firstname should not contain other character!");
		form.firstname.focus();
		return false;
	}

	if (form.lastname.value == "") {
		alert("Error: lastname cannot be blank!");
		form.lastname.focus();
		return false;
	}
	re = /[0-9]/;
	if (re.test(form.lastname.value)) {
		alert("Error: lastname should not contain numbers!");
		form.lastname.focus();
		return false;
	}
	re = /[A-Za-z]/;
	if (!re.test(form.lastname.value)) {
		alert("Error: lastname should not contain other character!");
		form.lastname.focus();
		return false;
	}
	var e = document.getElementById("type");
	var type = e.options[e.selectedIndex].value;
	if (type == 0) {
		alert("Please select a User type");
		return false;
	}

	if (form.email.value == "") {
		alert("Error: Email Id cannot be blank!");
		form.email.focus();
		return false;
	}
	re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if (!re.test(form.email.value)) {
		alert("Error: Invalid Email Id!");
		form.email.focus();
		return false;
	}
	if (form.mobileno.value == "") {
		alert("Error: Contact Number cannot be blank!");
		form.mobileno.focus();
		return false;
	}
	re = /[0-9]/;
	if (!re.test(form.mobileno.value)) {
		alert("Error: Contact Number contain digit!");
		form.mobileno.focus();
		return false;
	}

	re = /^[0-9]{10,12}$/;
	if (!re.test(form.mobileno.value)) {
		alert("Error: Enter 10 or 12 digit Contact Number!");
		form.mobileno.focus();
		return false;
	}
	
	if (form.address.value == "") {
		alert("Error: Address cannot be blank!");
		form.address.focus();
		return false;
	}

	
	if (form.username.value == "") {
		alert("Error: Username cannot be blank!");
		form.username.focus();
		return false;
	}
	if (form.password.value == "") {
		alert("Error: Password cannot be blank!");
		form.accountNo.focus();
		return false;
	}
	
	re = /[0-9]/;
	if (re.test(form.username.value)) {
		alert("Error: Username should not contain numbers!");
		form.username.focus();
		return false;
	}
	re = /[A-Za-z]/;
	if (!re.test(form.username.value)) {
		alert("Error: Username should not contain other character!");
		form.username.focus();
		return false;
	}

	if (form.password.value != "") {

		if (form.password.value.length < 6) {
			alert("Error: Password must contain at least six characters!");
			form.password.focus();
			return false;
		}
		if (form.password.value == form.username.value) {
			alert("Error: Password must be different from Username!");
			form.password.focus();
			return false;
		}
		re = /[0-9]/;
		if (!re.test(form.password.value)) {
			alert("Error: password must contain at least one number (0-9)!");
			form.password.focus();
			return false;
		}
		re = /[a-z]/;
		if (!re.test(form.password.value)) {
			alert("Error: password must contain at least one lowercase letter (a-z)!");
			form.passWord.focus();
			return false;
		}
		re = /[A-Z]/;
		if (!re.test(form.password.value)) {
			alert("Error: password must contain at least one uppercase letter (A-Z)!");
			form.password.focus();
			return false;
		}
	} else {
		alert("Error: Please check that you've entered and confirmed your password!");
		form.password.focus();
		return false;
	}

	return true;
}
/*

function validateStudentRegitration(form) {

//	alert("Welcome User Registration Validation");

	if (form.firstname.value == "") {
		alert("Error: firstname cannot be blank!");
		form.firstname.focus();
		return false;
	}
	re = /[0-9]/;
	if (re.test(form.firstname.value)) {
		alert("Error: firstname should not contain numbers!");
		form.firstname.focus();
		return false;
	}
	re = /[A-Za-z]/;
	if (!re.test(form.firstname.value)) {
		alert("Error: firstname should not contain other character!");
		form.firstname.focus();
		return false;
	}

	if (form.lastname.value == "") {
		alert("Error: lastname cannot be blank!");
		form.lastname.focus();
		return false;
	}
	re = /[0-9]/;
	if (re.test(form.lastname.value)) {
		alert("Error: lastname should not contain numbers!");
		form.lastname.focus();
		return false;
	}
	re = /[A-Za-z]/;
	if (!re.test(form.lastname.value)) {
		alert("Error: lastname should not contain other character!");
		form.lastname.focus();
		return false;
	}
	var e = document.getElementById("type");
	var type = e.options[e.selectedIndex].value;
	if (type == 0) {
		alert("Please select a User type");
		return false;
	}

	if (form.email.value == "") {
		alert("Error: Email Id cannot be blank!");
		form.email.focus();
		return false;
	}
	re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if (!re.test(form.email.value)) {
		alert("Error: Invalid Email Id!");
		form.email.focus();
		return false;
	}
	if (form.mobileno.value == "") {
		alert("Error: Contact Number cannot be blank!");
		form.mobileno.focus();
		return false;
	}
	re = /[0-9]/;
	if (!re.test(form.mobileno.value)) {
		alert("Error: Contact Number contain digit!");
		form.mobileno.focus();
		return false;
	}

	re = /^[0-9]{10,12}$/;
	if (!re.test(form.mobileno.value)) {
		alert("Error: Enter 10 or 12 digit Contact Number!");
		form.mobileno.focus();
		return false;
	}
	
	if (form.address.value == "") {
		alert("Error: Address cannot be blank!");
		form.address.focus();
		return false;
	}
	

	
	if (form.username.value == "") {
		alert("Error: Username cannot be blank!");
		form.username.focus();
		return false;
	}
	if (form.password.value == "") {
		alert("Error: Password cannot be blank!");
		form.accountNo.focus();
		return false;
	}
	
	re = /[0-9]/;
	if (re.test(form.username.value)) {
		alert("Error: Username should not contain numbers!");
		form.username.focus();
		return false;
	}
	re = /[A-Za-z]/;
	if (!re.test(form.username.value)) {
		alert("Error: Username should not contain other character!");
		form.username.focus();
		return false;
	}

	if (form.password.value != "") {

		if (form.password.value.length < 6) {
			alert("Error: Password must contain at least six characters!");
			form.password.focus();
			return false;
		}
		if (form.password.value == form.username.value) {
			alert("Error: Password must be different from Username!");
			form.password.focus();
			return false;
		}
		re = /[0-9]/;
		if (!re.test(form.password.value)) {
			alert("Error: password must contain at least one number (0-9)!");
			form.password.focus();
			return false;
		}
		re = /[a-z]/;
		if (!re.test(form.password.value)) {
			alert("Error: password must contain at least one lowercase letter (a-z)!");
			form.passWord.focus();
			return false;
		}
		re = /[A-Z]/;
		if (!re.test(form.password.value)) {
			alert("Error: password must contain at least one uppercase letter (A-Z)!");
			form.password.focus();
			return false;
		}
	} else {
		alert("Error: Please check that you've entered and confirmed your password!");
		form.password.focus();
		return false;
	}

	return true;
}
*/



