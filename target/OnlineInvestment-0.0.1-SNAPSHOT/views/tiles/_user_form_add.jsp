<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Users</h1>
<h2>Add User</h2>
<form:form modelAttribute="newUser" method="post">
	<table>
		<tr>
			<td>Username :</td>
			<td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="text" name="password"></td>
		</tr>
		<tr>
			<td>Enabled :</td>
			<td><input type="checkbox" name="enabled" checked /></td>
		</tr>
		<tr>
			<td>User Type :</td>
			<td>
				<select name="userType">
					<option value="ROLE_ADMIN">Administrator</option>
					<option value="ROLE_USER" selected>Regular User</option>
				</select>
			</td>
		</tr>		
	</table>
	<input type="submit" value="Add" />
</form:form>
<h2>User List</h2>

<table>
	<c:forEach var="user" items="${users}">
		<tr>
			<td>${user.username}</td>
			<td>
				<c:forEach var="role" items="${user.roles}">
					<c:if test="${role.authority=='ROLE_USER'}">regular user</c:if> 
					<c:if test="${role.authority=='ROLE_ADMIN'}">administrator</c:if>				
				</c:forEach>
			</td>
			
			<td>
				<c:if test="${user.enabled}">enabled</c:if> 
				<c:if test="${!user.enabled}">disabled</c:if>
			</td>
			<td>
				<a href="<spring:url value="/user/edit/${user.id}"/>">edit</a> | <a href="<spring:url value="/user/delete/${user.id}"/>">delete</a>
			</td>
		</tr>
	</c:forEach>

</table>