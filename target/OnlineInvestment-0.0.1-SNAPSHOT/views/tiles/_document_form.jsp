<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1>Required Documents</h1>
<h2>Please update the required documents:</h2>
<form action="<spring:url value="/membership/document"/>" method="post">
	<p>Birth Certificate</p>
	<p>Marriage Certificate</p>

	<input type="submit" value="Submit" />
</form>
