<%

String user_type=(String)session.getAttribute("USER_TYPE");
if(user_type == null)
{
	response.sendRedirect("login.jsp");
	return;
}

%>

<style>
.Table-Normal {
    position: relative;
    //display: block;
    margin: 10px auto;
    padding: 0;
    width: 100%;
    height: auto;
    border-collapse: collapse;
    text-align: center;
}
</style>
<div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">
<table class="Table-Normal">
<tr>
<td><span class="img-logo"style="padding-right:3px; padding-top: 3px;">
<img  align="left" src="img/logo.png"></img>

</span></td>
<td><p style="text-align: left;">Battery Server</p> </td></tr></table>

</div>
 <!--  <div class="logo tagline-upper text-heading text-shadow text-white mt-5 d-none d-lg-block">
 <img class="img-logo" src="img/logo.png"></img>
 <span class="tagline-upper text-center text-heading text-shadow text-white 

mt-5 d-none d-lg-block">Battery Server</span>
 	</div>

 -->	