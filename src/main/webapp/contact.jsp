<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Auction House | Contact Us</title>
</head>
<body>
<div id="head-gradient"></div>
<div id="header" class="contact-us">
	<div id="header-img">
		<a href="/AuctionHouse"><img src="<c:url value="/resources/images/Banner2.png" />" width=800 height=80 /></a>
	</div>
	<div id="header-login">
	</div>
	<sec:authorize ifAnyGranted="ROLE_GUEST">
		<p>  New to Auction House?
			<a href="<c:url value="/user/add" />">Register</a>
			  or <a href="<c:url value="/login.jsp" />">Log In</a> to get started! </p>                
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_USER">
		<div id="welcome-msg">
		<p>Welcome 
		<sec:authentication property="name" />!</p>
		</div>
		</sec:authorize>
	</div>
	<div id="nav-bar">
		<ul id="nav">
		
		<li>
			<a href="/AuctionHouse" title="Return home">Home</a>
		</li>
		<li>
			<a href="#" title="Browse">Browse</a>
			<ul>
				<li><a href="<c:url value="/" />">All</a></li>
				<li><a href="<c:url value="/category/6" />">Automotive</a></li>
				<li><a href="<c:url value="/category/1" />">Books</a></li>
				<li><a href="<c:url value="/category/2" />">Collectibles & Art</a></li>
				<li><a href="<c:url value="/category/3" />">Electronics & Technology</a></li>
				<li><a href="<c:url value="/category/4" />">Fashion</a></li>
				<li><a href="<c:url value="/category/5" />">Home, Outdoors,& Decor</a></li>
				<li><a href="<c:url value="/category/7" />">Movies, Music, & Games</a></li>
			</ul>
		</li>
		<li>
			<a href="<c:url value="/contact.jsp" />" title="Get in touch with us">Contact Us</a>
		</li>
		<sec:authorize ifAnyGranted="ROLE_USER">
		<li>
			<a href="<c:url value="/auction/add" />">Add Auction</a>
		</li>
		<li>
		<li>
			<a href="<c:url value="/control/panel" />" title="My Account">My Account</a>
			<ul>
				<li><a href="<c:url value="/control/panel#CurrentBids" />">Current Bids</a></li>
				<li><a href="<c:url value="/control/panel#PastBids" />">Past Bids</a></li>
				<li><a href="<c:url value="/control/panel#CurrentSales" />">Current Sales</a></li>
				<li><a href="<c:url value="/control/panel#PastSales" />">Past Sales</a></li>
				<li> <a href="/AuctionHouse/user/feedback/<sec:authentication property="name" /> " >Feedback</a></li>
				<li><a href="<c:url value="/user/update" />">Edit Details</a></li>
			</ul>
		</li>
		<li>
			<a href="<c:url value="/j_spring_security_logout" />">Logout</a>
		</li>
		</sec:authorize>
		
	</ul>
	</div>
	<div class="clear"></div>
<body>
<div id="wrapper">
<div id="contact-wrapper">
	<h1>Contact Info</h1>
	<hr>
<div class="contact-person">	
	<h3>Dan Hamlin </h3>
	<p>Daniel.Hamlin@mnsu.edu</p>
</div>
<div class="contact-person">
	<h3>Sean Ooi </h3>
	<p>Sean.Ooi@mnsu.edu</p>
</div>
<div class="contact-person">
	<h3> Nick Galvin </h3>
	<p>Nicholas.Galvin@mnsu.edu</p>
</div>	
</div><!-- contact-wrapper -->
<div class="push"></div>
</div><!-- wrapper -->
<script type="text/javascript">
$(function () {
    rainbows.init({
        selector: '#contact-wrapper h3',
        highlight: true,
        shadow: true,
        from: '#002d98',
        to: '#00aeff'
    });
    
    rainbows.init({
        selector: '#contact-wrapper h1',
        highlight: true,
        shadow: true,
        from: '#606060',
        to: '#2d2d2d'
    });
});
</script>
<div id="footer">
<p>&copy; 2011 Auction House. All Rights Reserved</p>
</div>
</body>
</html>