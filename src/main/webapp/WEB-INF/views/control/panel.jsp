<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../resources/styles.css" type="text/css" />
<title>Control Panel</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="control-panel">
<h3>My Current Bids</h3> 
<table border="1">
		<tr>
			<th width="10%">Title</th>
			<th width="10%">Category</th>
			<th width="10%">Seller</th>
			<th width="60%">Description</th>
			<th width="10%">Image</th>
		</tr>
		<c:forEach items="${bids}" var="bid">
			<tr>
				<td class="bidTitle"><a href="<c:url value="/auction/${bid.idAuction}" />" >${bid.title}</a></td>
				<td class="bidCategory">${bid.category.name}</td>
				<td class="bidSeller">${bid.user.username}</td>
				<td class="bidDescription">${bid.description}</td>
				<td class="bidImage"><img src="<c:url value="/image?id=${bid.idAuction}" />" /></td>
			</tr>
		</c:forEach>
	</table>
<hr />
<h3>My Current Sales</h3>
<table border="1">
		<tr>
			<th width="10%">Title</th>
			<th width="10%">Category</th>
			<th width="70%">Description</th>
			<th width="10%">Image</th>
		</tr>
		<c:forEach items="${auctions}" var="auction">
			<tr>
				<td class="saleTitle"><a href="<c:url value="/auction/${auction.idAuction}" />" >${auction.title}</a></td>
				<td class="saleCategory">${auction.category.name}</td>
				<td class="saleDescription">${auction.description}</td>
				<td class="saleImage"><img src="<c:url value="/image?id=${auction.idAuction}" />" /></td>
			</tr>
		</c:forEach>
	</table>
<p> Won/Lost Bids </p>
<!--
past 
bid
info
-->

<p> Edit Account Details </p>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>