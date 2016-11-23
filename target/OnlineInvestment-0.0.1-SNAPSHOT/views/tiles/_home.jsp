<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<security:authorize access="hasRole('ROLE_USER')">
	<form action="<spring:url value="/membership/form"/>" method="get">
		<input type="submit" value="Apply Membership" />
	</form>	
	<form action="<spring:url value="/member/profile/1"/>" method="get">
		<input type="submit" value="Profile" />
	</form>
	
	<form action="<spring:url value="/member/capital/1"/>" method="get">
		<input type="submit" value="Capital" />
	</form>
</security:authorize>

<security:authorize access="hasRole('ROLE_ADMIN')">
	<form action="<spring:url value="/user/add"/>" method="get">
		<input type="submit" value="User" />
	</form>

	<form action="<spring:url value="/staff/add"/>" method="get">
		<input type="submit" value="Staff" />
	</form>
</security:authorize>

