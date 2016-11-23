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
		<img src="http://mumstudents.org/~985239/resource/images/documentupload.png" alt="Requirements" />  
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/payment.png" alt="Payment" class="img-thumbnail"/>  
  	</div>

</div>
<h1>Payment Form</h1>

<h2>Type of Payments</h2>
<form action="<spring:url value="/membership/payment"/>" method="post">
  <input type="radio" name="paymentType" value="Paypal"> Paypal<br/>
  <input type="radio" name="paymentType" value="BankTransfer"> Bank Transfer<br/>
  <input type="radio" name="paymentType" value="Remittance"> Remittance Center<br/>
  <input type="submit" value="Submit"/>
</form>