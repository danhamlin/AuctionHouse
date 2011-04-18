<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../resources/styles.css" type="text/css" />
<title>Add New User...</title>
</head>
<body>
<div id="register-form-container">
<img src="/AuctionHouse/resources/images/AuctionBanner2.png" width=325 height=85 />
<form:form method="post" modelAttribute="upi">
<p>
		<label id="username">Username<br />
		<form:errors path="user.username" cssClass="regError" />
		<form:input path="user.username" />
		</label>
</p>
<p>
		<label id="password">Password<br />
		<form:errors path="user.password" cssClass="regError" />
		<form:password path="user.password"/>
		</label>
</p>
<p>
		<label id="password">Confirm Password<br />
		<form:errors path="confirmPassword" cssClass="regError" />
		<form:password path="confirmPassword"/>
		</label>
</p>
<p>
		<label id="firstName">First Name<br />
		<form:errors path="personalInfo.firstName" cssClass="regError" />
		<form:input path="personalInfo.firstName" />
		</label>
</p>
<p>
		<label id="middleName">Middle Name<br />
		<form:errors path="personalInfo.middleName" cssClass="regError" />
		<form:input path="personalInfo.middleName" />
		</label>
</p>
<p>
		<label id="lastName">Last Name<br />
		<form:errors path="personalInfo.lastName" cssClass="regError" />
		<form:input path="personalInfo.lastName" />
		</label>
</p>
<p>
		<label id="address1">Address Line 1<br />
		<form:errors path="personalInfo.address1" cssClass="regError" />
		<form:input path="personalInfo.address1" />
		</label>
</p>
<p>
		<label id="address2">Address Line 2<br />
		<form:errors path="personalInfo.address2" cssClass="regError" />
		<form:input path="personalInfo.address2" />
		</label>
</p>
<p>
		<label id="city">City<br />
		<form:errors path="personalInfo.city" cssClass="regError" />
		<form:input path="personalInfo.city" />
		</label>
</p>
<p>		
		<label id="state">State<br />
		<form:errors path="personalInfo.state" cssClass="regError" />
		<form:input path="personalInfo.state" />
		</label>
</p>
<p>		
		<label id="country">Country<br />
		<form:errors path="personalInfo.country" cssClass="regError" />
		<form:input path="personalInfo.country" />
		</label>
</p>
<p>
		<label id="zipcode">Zipcode<br />
		<form:errors path="personalInfo.zipcode" cssClass="regError" />
		<form:input path="personalInfo.zipcode" />
		</label>
</p>
<p>
		<label id="phoneNumber">Phone Number<br />
		<form:errors path="personalInfo.phoneNumber" cssClass="regError" />
		<form:input path="personalInfo.phoneNumber" />
		</label>
</p>
<p>
		<label id="email">Email Address<br />
		<form:errors path="personalInfo.emailAddress" cssClass="regError" />
		<form:input path="personalInfo.emailAddress" />
		</label>
</p>
		<div class="clear"></div>
		<input id="submit" type="submit" name="submit" value="Register" />
</form:form>
</div>
</body>
</html>