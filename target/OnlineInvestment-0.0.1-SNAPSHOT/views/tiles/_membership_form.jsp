<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1>Membership Form</h1>
<form:form modelAttribute="newApplicant" method="post">
	<table>
		<tr>
			<td>Last Name</td>
			<td><form:input path="lastName"/></td>
		</tr>
		<tr>
			<td>First Name</td>
			<td><form:input path="firstName"/></td>
		</tr>
		<tr>
			<td>Middle Name</td>
			<td><form:input path="middleName"/></td>
		</tr>
	</table>
	<input type="submit" value="Submit"/>
</form:form>