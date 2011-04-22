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
				<li><a href="/AuctionHouse/category/2">Collectibles & Art</a></li>
				<li><a href="/AuctionHouse/category/3">Electronics & Technology</a></li>
				<li><a href="/AuctionHouse/category/4">Fashion</a></li>
				<li><a href="/AuctionHouse/category/5">Home, Outdoors,& Decor</a></li>
				<li><a href="/AuctionHouse/category/6">Automotive</a></li>
				<li><a href="/AuctionHouse/category/7">Movies, Music, & Games</a></li>
			</ul>
		</li>
		<li>
			<a href="#" title="The services we offer">Services</a>
			<ul>
				<li><a href="#">Sell Item</a></li>
				<li><a href="#">My Account</a></li>
				<li><a href="#">Sevice three</a></li>
				<li><a href="#">Sevice four</a></li>
			</ul>
		</li>
		<li>
			<a href="#" title="Our product range">Product</a>
			<ul>
				<li><a href="#">Small product (one)</a></li>
				<li><a href="#">Small product (two)</a></li>
				<li><a href="#">Small product (three)</a></li>
				<li><a href="#">Small product (four)</a></li>
				<li><a href="#">Big product (five)</a></li>
				<li><a href="#">Big product (six)</a></li>
				<li><a href="#">Big product (seven)</a></li>
				<li><a href="#">Big product (eight)</a></li>
				<li><a href="#">Enourmous product (nine)</a></li>
				<li><a href="#">Enourmous product (ten)</a></li>
				<li><a href="#">Enourmous product (eleven)</a></li>
			</ul>
		</li>
		<li>
			<a href="#" title="Get in touch with us">Contact</a>
			<ul>
				<li><a href="#">Out-of-hours</a></li>
				<li><a href="#">Directions</a></li>
			</ul>
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