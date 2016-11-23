<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="col-xs-3">
  		<img src="http://mumstudents.org/~985239/resource/images/applicantinfo.png" alt="Applicant Info" class="img-thumbnail"/>
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/agreement.png" alt="Agreement"/>  
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/documentupload.png" alt="Requirements"/>  
  	</div>
  	<div class="col-xs-3">
		<img src="http://mumstudents.org/~985239/resource/images/payment.png" alt="Payment"/>  
  	</div>

</div>

<h1>Membership Form</h1>
<form:form modelAttribute="newApplicant" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>Firstname :</td>
			<td><form:input path="firstName" type="text" /></td>
			<td><form:errors path="firstName"></form:errors></td>
		</tr>
		<tr>
			<td>Middle Name</td>
			<td><form:input path="middleName"/></td>
                        <td><form:errors path="middleName"></form:errors></td>
		</tr>
		<tr>
			<td>Lastname :</td>
			<td><form:input path="lastName" type="text" /></td>
			<td><form:errors path="lastName"></form:errors></td>
		</tr>
		<tr>
			<td>Gender :</td>
			<td><form:radiobutton path="gender" value="Male" />Male <form:radiobutton
					path="gender" value="Female" />Female</td>
			<td><form:errors path="gender"></form:errors></td>
		</tr>

		<tr>
			<td>Country :</td>
			<td><form:input path="address.country" type="text" /></td>
			<td><form:errors path="address.country"></form:errors></td>
		</tr>
		<tr>
			<td>State :</td>
			<td><form:input path="address.state" type="text" /></td>
			<td><form:errors path="address.state"></form:errors></td>
		</tr> 
		<tr>
			<td>City :</td>
			<td><form:input path="address.city" type="text" /></td>
			<td><form:errors path="address.city"></form:errors></td>
		</tr>
		<tr>
			<td>Street :</td>
			<td><form:input path="address.street" type="text" /></td>
			<td><form:errors path="address.street"></form:errors></td>
		</tr>
		<tr>
			<td>ZipCode :</td>
			<td><form:input path="address.zip" type="text" /></td>
			<td><form:errors path="address.zip"></form:errors></td>
		</tr>

		<tr>
			<td>Contact :</td>
			<td><form:input path="contact" type="text" /></td>
			<td><form:errors path="contact"></form:errors></td>
		</tr>
		
		<tr><td> User Photo : </td><td> <form:input path="userImage" name="userImage" type="file" /> </td><td>
				<form:errors path="userImage"></form:errors>
			</td></tr>

		<tr>
			<td></td>
			<td>
				<input type="submit" value="Submit" />
			</td>
		</tr>

	</table>
</form:form>