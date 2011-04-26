<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Auction House</title>
<link rel="stylesheet" href="<c:url value="/resources/styles.css" />" type="text/css" />
</head>
<body>
	<%@ include file="header.jsp" %>
		<div id="mainPage-auctions">
			<c:forEach items="${auctions}" var="auction">
			<div class="auctionList">
					<div id="auctionImage">
					<c:choose>
						<c:when test="${not empty auction.picture[0]}">
						<div id="aImage"><a href="<c:url value="/auction/${auction.idAuction}" />"><img src="<c:url value="/image?id=${auction.idAuction}" />" /></a></div>
						</c:when>
						<c:otherwise>
							<p><label id="aImage"><img src="<c:url value="/resources/images/noimage.png" />" /></label></p>
						</c:otherwise>
					</c:choose>
					</div><!-- auctionImage -->
					
					<div id="auctionDetails">
					<p>Title: <label id="aTitle"><a href="<c:url value="/auction/${auction.idAuction}" />">${auction.title}</a>
					</label></p>
					<p>Category: <label id="aCategory">${auction.category.name}</label></p>
					<c:choose>
						<c:when test="${auction.bids[0].amount == null}">
						<p>Bid: <label id="aBid">No Bids Yet</label></p>
						</c:when>
						<c:otherwise>
						<p>Bid: <label id="aBid">$${auction.bids[0].amount}</label></p>
						</c:otherwise>
					</c:choose>
					</div><!-- auctionDetails -->
					
					<div class="clear"></div>
				</div><!-- auction list -->
					<hr />
			</c:forEach>
		</div><!--  mainPage-auction -->
<%@ include file="footer.jsp" %>
</body>
</html>
