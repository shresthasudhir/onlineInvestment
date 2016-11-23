<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="col-xs-3">
  		<img src="http://mumstudents.org/~985239/resource/images/applicantinfo.png" alt="Applicant Info"/>
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/agreement.png" alt="Agreement" class="img-thumbnail"/>
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/documentupload.png" alt="Requirements"/>  
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/payment.png" alt="Payment"/>  
  	</div>

</div>

<h1>Agreement Form</h1>

<div>
	<img src="data:image/png;base64,${imageBase64} height = "100px" width = "100px""/><br/>
	<h2>GENERAL AGREEMENT</h2>
	<br/>
	<p>I agree to become a member of Sorosoro Ibaba, Development Cooperative(SIDC)
	and ready to attend a Pre-Membership Education Seminar to know the goals and
	aspirations of the said Organization.
	</p>
	<p>
		I will abide by the rules and regulations indicated herein.
	</p>
	<br/>
	
	<form action="<spring:url value="/membership/agreement"/>" method="post">
		<input type="checkbox" name="agreement" value="${activeMember.agreement}" <c:if test="${activeMember.agreement=='signed'}">checked</c:if>/>I Agree<br>		
		<input type="submit" value="Submit"/>
	</form>

</div>