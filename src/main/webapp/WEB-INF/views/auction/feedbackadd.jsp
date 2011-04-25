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
<script type="text/javascript" src="<c:url value="/resources/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/rainbows.js" />"></script>
<title>Auction House | Submit Feedback</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<c:choose>
<c:when test="${currentUser == auction.user.username}">
	<div id="fTitle">
	<h3 id="feedback-title">Leave feedback for '${auction.bids[0].user.username}'</h3>
	</div>
</c:when>
<c:otherwise>
	<div id="fTitle">
	<h3 id="feedback-title">Leave feedback for '${auction.user.username}'</h3>
	</div>
</c:otherwise>
</c:choose>

<form:form method="post" modelAttribute="fb">
<p>
	<label id="feedback">Feedback<br />
	<form:errors path="feedback" cssClass="regError" />
	<form:textarea path="feedback" rows="10" cols="80" maxlength="255" />
	</label>
</p>
<p>
	<label id="rating">Rating<br />
	<form:errors path="rating" cssClass="regError" />
	<form:input path="rating" maxlength="1" />
	</label>
</p>
	<input id="submit" type="submit" name="submit" value="Post Feedback" />
</form:form>
<script type="text/javascript">
$(function () {
    rainbows.init({
        selector: '#fTitle h3',
        highlight: true,
        shadow: true,
        from: '#606060',
        to: '#2d2d2d'
    });
});
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>