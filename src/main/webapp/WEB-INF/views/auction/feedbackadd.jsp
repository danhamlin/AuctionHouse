<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/resources/styles.css" />" type="text/css" />
<title>Add Feedback Form...</title>
</head>
<body>
<%@ include file="../header.jsp" %>
Leave feedback for 
<c:choose>
<c:when test="${currentUser == auction.user.username}">Buyer</c:when>
<c:otherwise>Seller</c:otherwise>
</c:choose>
<form:form method="post" modelAttribute="fb">
<p>
	<label id="feedback">Feedback<br />
	<form:errors path="feedback" cssClass="regError" />
	<form:input path="feedback" maxlength="255" />
	</label>
</p>
<p>
	<label id="rating">Rating<br />
	<form:errors path="rating" cssClass="regError" />
	<form:input path="rating" maxlength="1" />
	</label>
</p>
	<div class="clear"></div>
	<input id="submit" type="submit" name="submit" value="Post Feedback" />
</form:form>
<%@ include file="../footer.jsp" %>
</body>
</html>