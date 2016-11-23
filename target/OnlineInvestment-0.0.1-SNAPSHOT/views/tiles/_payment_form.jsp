<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1>Payment Form</h1>

<h2>Type of Payments</h2>
<form action="<spring:url value="/membership/payment"/>" method="post">
  <input type="radio" name="paymentType" value="Paypal"> Paypal<br/>
  <input type="radio" name="paymentType" value="BankTransfer"> Bank Transfer<br/>
  <input type="radio" name="paymentType" value="Remittance"> Remittance Center<br/>
  <input type="submit" value="Submit"/>
</form>