<div id="head-gradient"></div>
<div id="wrapper">
<div id="header">
	<div id="header-img">
		<a href="/AuctionHouse"><img src="/AuctionHouse/resources/images/AuctionBanner2.png" width=300 height=85 /></a>
	</div>
	<div id="header-login">
		<sec:authorize ifAnyGranted="ROLE_USER">
		<p>Welcome 
		<sec:authentication property="name" />!</p>
			<p><a href="/AuctionHouse/control/panel">My Account</a></p>
			<p><a href="/AuctionHouse/j_spring_security_logout">Logout</a></p>
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_GUEST">
		<p>Welcome Guest!</p>
			<p><a href="/AuctionHouse/login.jsp">Log In</a></p>
			<p><a href="/AuctionHouse/user/add">Register</a></p>
		</sec:authorize>
	</div>
</div>
<div class="clear"></div>
		<hr />
	<div id="nav-bar">
		<ul id="nav">
		<li>
			<a href="/AuctionHouse" title="Return home">Home</a>
		</li>
		<li>
			<a href="#" title="Browse">Browse</a>
			<ul>
				<li><a href="/AuctionHouse/">All</a></li>
				<li><a href="/AuctionHouse/category/1">Books</a></li>
				<li><a href="/AuctionHouse/category/2">Collectables & Art</a></li>
				<li><a href="/AuctionHouse/category/3">Electronics & Technology</a></li>
				<li><a href="/AuctionHouse/category/4">Fashion</a></li>
				<li><a href="/AuctionHouse/category/5">Home, Outdoors,& Decor</a></li>
				<li><a href="/AuctionHouse/category/6">Automotive</a></li>
				<li><a href="/AuctionHouse/category/7">Movies, Music, & Games</a></li>
			</ul>
		</li>
		<li>
			<a href="/AuctionHouse/control/panel" title="My Account">My Account</a>
			<ul>
				<li><a href="/AuctionHouse/user/update">Edit Details</a></li>
				<li><a href="/AuctionHouse/control/panel#CurrentBids">Current Bids</a></li>
				<li><a href="/AuctionHouse/control/panel#WonBids">Won Bids</a></li>
				<li><a href="/AuctionHouse/control/panel#CurrentSales">Current Sales</a></li>
				<li><a href="/AuctionHouse/control/panel#PastSales">Past Sales</a></li>
			</ul>
		</li>
		<li>
			<a href="<c:url value="/contact.jsp" />" title="Get in touch with us">Contact Us</a>
		</li>
		<sec:authorize ifAnyGranted="ROLE_USER">
		<li>
			<a href="/AuctionHouse/auction/add">Add Auction</a>
		</li>
		</sec:authorize>
	</ul>
	</div>
	<hr />
	<div class="clear"></div>