<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/resources/styles.css" />" type="text/css" />
<title>Login</title>
</head>
<body>
<div id="head-gradient"></div>
<div id="login-form-container">
<a href = "/AuctionHouse"><img src="<c:url value="/resources/images/AuctionBanner2.png" />" width=315 height=85 /></a>
<c:if test="${not empty param.error}">
	<div class="error"><strong>ERROR</strong>: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
</c:if>
<form id="login-form" name="f" action="<c:url value='j_spring_security_check'/>" method="POST">
<p>
	<label id="username">Username<br />
	<input type="text" name="j_username" value="" size="20" tabindex="20" /></label>
</p>
<p>
	<label id="password">Password<br />
	<input type="password" name="j_password" value="" size="20" tabindex="21"/></label>
</p>
<p>
	<label id="remember-me-label"><input id="remember-me" type="checkbox" name="_spring_security_remember_me"/>Remember Me</label>
	<input id="submit" type="submit" name="submit" value="Log In" />
</p>
</form>
<div class="clear"></div>
<a href="<c:url value="/user/add" />">Register</a>
</div>
<!-- wrapper -->

</body>
</html>
