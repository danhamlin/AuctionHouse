<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User's Feedback</title>
</head>
<body>
Feedback left for user's sales.

<table>
	<tr>
		<th>Auction</th>
		<th>Buyer</th>
		<th>Feedback</th>
		<th>Rating</th>
	</tr>
	<c:forEach items="${feedbackSales}" var="fbs">
	<tr>
		<td>${fbs.auction.title}</td>
		<td>${fbs.auction.bids[0].user.username}</td>
		<td>${fbs.feedback}</td>
		<td>${fbs.rating}</td>
	</tr>
	</c:forEach>
</table>
Feedback left for user's purchases.
<table>
	<tr>
		<th>Auction</th>
		<th>Buyer</th>
		<th>Feedback</th>
		<th>Rating</th>
	</tr>
	<c:forEach items="${feedbackBids}" var="fbb">
	<tr>
		<td>${fbb.auction.title}</td>
		<td>${fbb.auction.bids[0].user.username}</td>
		<td>${fbb.feedback}</td>
		<td>${fbb.rating}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>