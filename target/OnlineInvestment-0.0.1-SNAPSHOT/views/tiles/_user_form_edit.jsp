<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Users</h1>
<h2>Edit User</h2>
<form:form modelAttribute="user" method="post">
	<table>
		<tr>
			<td>Username :</td>
			<td><input type="text" name="username" value="${user.username}"></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="password" name="password" value="${user.password}"></td>
		</tr>
		<tr>
			<td>Enabled :</td>
			<td>
				<c:if test="${user.enabled}"><input type="checkbox" name="enabled" checked /></c:if> 
				<c:if test="${!user.enabled}"><input type="checkbox" name="enabled"/></c:if>						
			</td>
		</tr>
		<tr>
			<td>User Type :</td>
			<td>
				<select name="userType">
					<option value="ROLE_ADMIN" <c:if test="${user.userType=='ROLE_ADMIN'}">selected</c:if>>Administrator</option>
					<option value="ROLE_USER" <c:if test="${user.userType=='ROLE_USER'}">selected</c:if>>Regular User</option>
				</select>
			</td>
		</tr>			
	</table>
	<input type="submit" value="Save" />
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