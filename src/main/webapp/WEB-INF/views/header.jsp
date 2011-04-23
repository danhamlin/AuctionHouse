<div id="head-gradient"></div>
<div id="wrapper">
<div id="header">
	<div id="header-img">
		<a href="/AuctionHouse"><img src="<c:url value="/resources/images/Banner2.png" />" width=800 height=80 /></a>
	</div>
	<div id="header-login">
		<!--  <sec:authorize ifAnyGranted="ROLE_USER">
		<p>Welcome 
		<sec:authentication property="name" />!</p>
			<p><a href="/AuctionHouse/control/panel">My Account</a></p>
			<p><a href="/AuctionHouse/j_spring_security_logout">Logout</a></p>
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_GUEST">
		<p>Welcome Guest!</p>
			<p><a href="/AuctionHouse/login.jsp">Log In</a></p>
			<p><a href="/AuctionHouse/user/add">Register</a></p>
		</sec:authorize> -->
	</div>
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
				<li><a href="<c:url value="/user/update" />">Edit Details</a></li>
			</ul>
		</li>
		</li>
		<li>
			<a href="<c:url value="/j_spring_security_logout" />">Logout</a>
		</li>
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_GUEST">
		<li>
			<a href="<c:url value="/login.jsp" />">Log In</a>
		</li>
		<li>
			<a href="<c:url value="/user/add" />">Register</a>
		</li>
		</sec:authorize>
	</ul>
	</div>
	<div class="clear"></div>
