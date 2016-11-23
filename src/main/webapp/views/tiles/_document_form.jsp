<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="col-xs-3">
  		<img src="http://mumstudents.org/~985239/resource/images/applicantinfo.png" alt="Applicant Info"/>
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/agreement.png" alt="Agreement"/>
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/documentupload.png" alt="Requirements" class="img-thumbnail"/>  
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/payment.png" alt="Payment"/>  
  	</div>

</div>
<h1>Required Documents</h1>
<h2>Please update the required documents:</h2>
<form action="<spring:url value="/membership/document"/>" method="post">
	<p>Birth Certificate</p>
	<p>Marriage Certificate</p>

	<input type="submit" value="Submit" />
</form>
