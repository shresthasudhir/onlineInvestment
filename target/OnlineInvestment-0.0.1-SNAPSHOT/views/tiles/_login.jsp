<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="jumbotron">
		<h1>SIDC-Coop Online Membership</h1>
		<p>Welcome to SIDC-Coop Online Membership system.</p>
	</div>
</div>
<h1>Login Form</h1>
<form action="<spring:url value="/postLogin"/>" method="post">
	<table>
		<tr>
			<td>Username :</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="password" name="password" /></td>
		</tr>
	</table>

	<input type="submit" value="Submit" /><br /> <a
		href="<spring:url value="/user/new"/>">Signup</a>
</form>