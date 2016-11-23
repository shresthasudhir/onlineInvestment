<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Signup</h1>
<form:form modelAttribute="newUser" method="post">
	<table>
		<tr>
			<td>Username :</td>
			<td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>Confirm Password :</td>
			<td><input type="password" name="confirm"></td>
		</tr>
	</table>
	<input type="submit" value="Submit" />
</form:form>