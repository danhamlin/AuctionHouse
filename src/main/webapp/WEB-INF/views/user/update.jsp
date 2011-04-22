<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../resources/styles.css" type="text/css" />
<title>Update User Account Info...</title>
</head>
<body>
<div id="register-form-container">
<a href="/AuctionHouse"><img src="/AuctionHouse/resources/images/AuctionBanner2.png" width=325 height=85 /></a>
<p>* denotes required field.</p>
<form:form method="post" modelAttribute="upi">
<div id="reg-left-column">
<p>
		<label id="username">Username*<br />
		<form:errors path="user.username" cssClass="regError" />
		<form:input path="user.username" disabled="true" maxlength="45" />
		</label>
</p>
<p>
		<label id="password">Password*<br />
		<form:errors path="user.password" cssClass="regError" />
		<form:password path="user.password" maxlength="255" />
		</label>
</p>
<p>
		<label id="password">Confirm Password*<br />
		<form:errors path="confirmPassword" cssClass="regError" />
		<form:password path="confirmPassword" maxlength="255" />
		</label>
</p>
<p>
		<label id="firstName">First Name*<br />
		<form:errors path="personalInfo.firstName" cssClass="regError" />
		<form:input path="personalInfo.firstName" maxlength="90" />
		</label>
</p>
<p>
		<label id="middleName">Middle Name<br />
		<form:errors path="personalInfo.middleName" cssClass="regError" />
		<form:input path="personalInfo.middleName" maxlength="90" />
		</label>
</p>
<p>
		<label id="lastName">Last Name*<br />
		<form:errors path="personalInfo.lastName" cssClass="regError" />
		<form:input path="personalInfo.lastName" maxlength="90" />
		</label>
</p>
<p>
		<label id="email">Email Address*<br />
		<form:errors path="personalInfo.emailAddress" cssClass="regError" />
		<form:input path="personalInfo.emailAddress" maxlength="255" />
		</label>
</p>


</div>
<div id="reg-right-column">
<p>
		<label id="address1">Address Line 1*<br />
		<form:errors path="personalInfo.address1" cssClass="regError" />
		<form:input path="personalInfo.address1" maxlength="90" />
		</label>
</p>
<p>
		<label id="address2">Address Line 2<br />
		<form:errors path="personalInfo.address2" cssClass="regError" />
		<form:input path="personalInfo.address2" maxlength="90" />
		</label>
</p>
<p>
		<label id="city">City*<br />
		<form:errors path="personalInfo.city" cssClass="regError" />
		<form:input path="personalInfo.city" maxlength="90" />
		</label>
</p>
<p>		
		<label id="state">State*<br />
		<form:errors path="personalInfo.state" cssClass="regError" />
		<form:input path="personalInfo.state" maxlength="45" />
		</label>
</p>
<p>		
		<label id="country">Country*<br />
		<form:errors path="personalInfo.country" cssClass="regError" />
		<form:input path="personalInfo.country" maxlength="90" />
		</label>
</p>
<p>
		<label id="zipcode">Zipcode*<br />
		<form:errors path="personalInfo.zipcode" cssClass="regError" />
		<form:input path="personalInfo.zipcode" maxlength="10" />
		</label>
</p>
<p>
		<label id="phoneNumber">Phone Number*<br />
		<form:errors path="personalInfo.phoneNumber" cssClass="regError" />
		<form:input path="personalInfo.phoneNumber" maxlength="16" />
		</label>
</p>
</div>
		<div class="clear"></div>
		<input id="submit" type="submit" name="submit" value="Update" />
</form:form>
</div>
</body>
</html>