<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>User's Feedback</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="control-panel">
<h3 id="feedAsSeller">Feedback As A Seller</h3>
<table>
	<tr>
		<th width="25%">Auction</th>
		<th width="25%">Buyer</th>
		<th width="25%">Feedback</th>
		<th width="25%">Rating</th>
	</tr>
	<c:forEach items="${feedbackSales}" var="fbs">
	<tr>
		<td class="feedSellTitle">${fbs.auction.title}</td>
		<td class="feedSellUser">${fbs.auction.bids[0].user.username}</td>
		<td class="feedSellFeed">${fbs.feedback}</td>
		<td class="feedSellRate">${fbs.rating}</td>
	</tr>
	</c:forEach>
</table>
<br />
<h3 id="feedAsBuyer">Feedback As A Buyer</h3>
<table>
	<tr>
		<th width="25%">Auction</th>
		<th width="25%">Seller</th>
		<th width="25%">Feedback</th>
		<th width="25%">Rating</th>
	</tr>
	<c:forEach items="${feedbackBids}" var="fbb">
	<tr>
		<td class="feedSellTitle">${fbb.auction.title}</td>
		<td class="feedBuyUser">${fbb.auction.user.username}</td>
		<td class="feedBuyFeed">${fbb.feedback}</td>
		<td class="feedBuyRate">${fbb.rating}</td>
	</tr>
	</c:forEach>
</table>
</div>
<script type="text/javascript">
$(function () {
    rainbows.init({
        selector: '#control-panel h3',
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