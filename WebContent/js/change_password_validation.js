function validateChangePassword(form) {
	
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


