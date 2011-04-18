<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/resources/styles.css" />" type="text/css" />
<title>Auction view</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="mainPage-auctions">
<div id="auctionImage">
<c:choose>
	<c:when test="${not empty auction.picture[0]}">
	<p><label id="aImage"><img src="<c:url value="/image?id=${auction.idAuction}" />" /></label></p>
	</c:when>
	<c:otherwise>
		<p><label id="aImage"><img src="<c:url value="/resources/images/noimage.png" />" /></label></p>
	</c:otherwise>
</c:choose>
</div><!-- auctionImage -->

<div id="auctionDetails">
<p>Title: <label id="aTitle">${auction.title}</label></p>
		<p>Category: <label id="aCategory">${auction.category.name}</label></p>
		<div id="desc-line"><p>Description: <label id="aDescription">${auction.description}</label></p></div>
		<p>User: <label id="aUsername">${auction.user.username}</label></p>
		<p>Bid: <label id="aBid">${auction.bids[0].amount}</label></p>
		<sec:authorize ifNotGranted="ROLE_USER">
		<p id="login-msg">Please <a href="<c:url value="/login.jsp"/>">login</a> to place a new bid</p>
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_USER">
		<p>
			<form:form method="post" modelAttribute="bid">
			<form:errors path="*" cssClass="bidError"/>
				<p><label id="amount">Amount:
			<form:input path="amount" />
				</label></p>
				<p><input id="submit" type="submit" name="submit" value="Place Bid" /></p>
			</form:form>
		</p>
		</sec:authorize>
		<div class="clear"></div>
		<hr />
<div id="bid-history">
<p>Bid History</p>
<table border="1">
	<tr>
		<th>User</th>
		<th>Amount</th>
		<th>Time</th>
	</tr>
	<c:forEach items="${auction.bids}" var="bid">
		<tr>
			<td>${bid.user.username}</td>
			<td>${bid.amount}</td>
			<td>${bid.time}</td>
		</tr>
	</c:forEach>
</table>
</div>
</div><!-- auctionDetails -->
</div><!--  mainPage=auctions -->
<div class="clear"></div>
<%@ include file="../footer.jsp" %>
</body>
</html>