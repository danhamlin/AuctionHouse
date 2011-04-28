<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="<c:url value="/resources/styles.css" />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/jquery.js" />"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#amount").keydown(function(event) {
        // Allow only backspace, delete, period and enter
        if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 190 || event.keyCode == 13) {
                // let it happen, don't do anything
        }
        else {
                // Ensure that it is a number and stop the keypress
                if (event.keyCode < 13 || event.keyCode < 48 || event.keyCode > 57  || event.keyCode > 96 || event.keyCode > 105 || event.keyCode > 191) {
                        event.preventDefault(); 
                }       
        }
    });
});
</script>
<title>Auction House | ${auction.title}</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="mainPage-auctions">
<div id="auctionImage">
<c:choose>
	<c:when test="${not empty auction.picture[0]}">
		<a id="click">
			<label id="aImage"><img src="<c:url value="/image?id=${auction.idAuction}" />" /></label>
			<span id="zoomImg">
				<img src="<c:url value="/image?id=${auction.idAuction}" />" />
			</span>
		</a>
	</c:when>
	<c:otherwise>
		<p><label id="aImage"><img src="<c:url value="/resources/images/noimage.png" />" /></label></p>
	</c:otherwise>
</c:choose>
</div><!-- auctionImage -->
<div id="auctionDetails">
		<p>Title: <label id="aTitle">${auction.title}</label></p>
		<div class="clear"></div>
		<p>Category: <label id="aCategory">${auction.category.name}</label></p>
		<div class="clear"></div>
		<p>Description: <label id="aDescription">${auction.description}</label></p>
		<div class="clear"></div>
		<p>Listed by: <label id="aUsername"><a href="/AuctionHouse/user/feedback/${auction.user.username}">${auction.user.username}</a></label></p>
		<c:if test="${auction.sold}">
		<p>Winner: <span id="aWinner">${auction.bids[0].user.username}</span></p>
		<div class="clear"></div>
		</c:if>
		<p>High Bid: <label id="aBid">
		<c:if test="${auction.bids[0].user.username == null}">No bids yet</c:if>
		<c:if test="${auction.bids[0].user.username != null}">$</c:if>${auction.bids[0].amount}</label></p>
		<div class="clear"></div>
		<c:if test="${not auction.finished and currentUser != auction.user.username and currentUser != auction.bids[0].user.username}">		
			<sec:authorize ifNotGranted="ROLE_USER">
			<p id="login-msg">Please <a href="<c:url value="/login.jsp"/>">login</a> to place a new bid</p>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_USER">
			<p>
				<form:form method="post" modelAttribute="bid">
				<form:errors path="*" cssClass="bidError"/>
					<p><label id="amount">Amount: $
				<form:input path="amount" />
					</label></p>
					<p><input id="submit" type="submit" name="submit" value="Place Bid" /></p>
				</form:form>
			</p>
			</sec:authorize>
		</c:if>
		<c:if test="${currentUser == auction.user.username and not auction.finished}">
			<p>
			<c:if test="${auction.bids[0].user.username != null}">
				<a id="sellItem" href="/AuctionHouse/auction/${auction.idAuction}/close?sold=true">Sell Item</a>
			</c:if>
				<a id="delistItem" href="/AuctionHouse/auction/${auction.idAuction}/close?sold=false">Delist Item</a>
			</p>
		</c:if>
		<c:if test="${currentUser == auction.bids[0].user.username and not auction.sold and not auction.finished}">
			<p id="currentHighNote">You are currently the highest bidder on this item.</p>
		</c:if>
		<c:if test="${auction.finished and not auction.sold}">
			<p id="auctionFinished">Auction was canceled.</p>
		</c:if>
		<c:if test="${buyerFB != null or sellerFB != null}">
		<div id="feedback-border">
		<!-- Add link to leave feedback here and also feedback already left -->
			<c:if test="${buyerFB != null}">
			<!-- display buyer feedback -->
			<p>Rating for buyer: <label id="rateForBuyer">${buyerFB.rating}/5</label></p>
			<div class="clear"></div>
			<p>Feedback for buyer: <label id="feedForBuyer">${buyerFB.feedback}</label></p>
			<div class="clear"></div>
			<br />
			<br />
			<br />
			</c:if>
			<c:if test="${sellerFB != null}">
			<!-- display seller feedback -->
			<p>Rating for seller: <label id="rateForSeller">${sellerFB.rating}/5</label></p>
			<div class="clear"></div>
			<p>Feedback for seller: <label id="feedForSeller">${sellerFB.feedback}</label></p>
			<div class="clear"></div>
			
			</c:if>
		</div>
		</c:if>
		<c:if test="${auction.sold}">
			<c:if test="${buyerFB == null and currentUser == auction.user.username }">
			<!-- display link for seller to leave feedback for buyer -->
			<p id="leave-feedback">Click <a href="${auction.idAuction}/feedback/add">here</a> to leave feedback for buyer.</p>
			</c:if>
			<c:if test="${sellerFB == null and currentUser == auction.bids[0].user.username}">
			<!-- display link for buyer to leave feedback for seller -->
			<p id="leave-feedback">Click <a href="${auction.idAuction}/feedback/add">here</a> to leave feedback for seller.</p>
			</c:if>
		</c:if>
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
			<td>$${bid.amount}</td>
			<td>${bid.time}</td>
		</tr>
	</c:forEach>
</table>
</div><!-- bid history -->
</div><!-- auctionDetails -->
</div><!--  mainPage=auctions -->
<div class="clear"></div>
<%@ include file="../footer.jsp" %>
</body>
</html>