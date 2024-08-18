function validateLogin(form) {

	// alert(form.username);

	if (form.username.value == "") {
		alert("Error: Please Enter Username !");
		return false;
	}

	// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	if (form.password.value == "") {
		alert("Error: Please Enter Password !");
		return false;
	}

	return true;
}
