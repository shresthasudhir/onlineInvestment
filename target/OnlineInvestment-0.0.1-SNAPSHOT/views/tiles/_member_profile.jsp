<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1>Profile</h1>
<h2>Member Info</h2>
<form action="<spring:url value="/home"/>" method="get">
	<p>Birth Certificate</p>
	<p>Marriage Certificate</p>

	<input type="submit" value="Home" />
</form>
