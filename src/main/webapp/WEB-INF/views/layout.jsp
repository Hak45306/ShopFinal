<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
</head>
<header class="p-2 bg-dark text-white">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<!-- 				<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none"> -->
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
				class="bi bi-shop-window" viewBox="0 0 16 16">
  <path
					d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zm2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5z" />
                    </svg>
			<!-- 				</a> -->
			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 text-white">Home</a></li>
				<li><a href="#" class="nav-link px-2 text-white">Features</a></li>
				<li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
				<li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
				<li><a href="#" class="nav-link px-2 text-white">About</a></li>
				<li>
					<div class="dropdown py-1 px-2 nav-link d-flex align-items-center">
						<a class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
							src="<c:url value="/resources/images/user.png"/>" alt="mdo" width="24" height="24"
							class="rounded-circle">${username}
						</a>
						<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
							<li><a class="dropdown-item" href="<c:url value="/viewProfile"/>">Profile</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="<c:url value="/logout" />">Sign out</a></li>
						</ul>
					</div>
				</li>
			</ul>
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<div class="d-flex float-end">
					<div class="me-1 rounded py-1 px-3 nav-link d-flex align-items-center">
						<div class="input-group float-center">
							<div class="form-outline">
								<!-- 													<label class="form-label" for="form1">Search</label>  -->
								<input type="search" class="form-control" placeholder="Search..." />
								<!-- 														<input type="search" id="form1" class="form-control" /> -->
							</div>
							<button type="button" class="btn btn-dark border shadow-0  py-1 py-1 px-3">
								<svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 512 512">
								<style>
svg {
	fill: #ffffff
}
</style>
								<path
										d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" /></svg>
							</button>
						</div>
					</div>
					<a href="<c:url value="/giohang/" />"
						class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"> <svg
							xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
							class="bi bi-cart" viewBox="0 0 16 16">
								<path
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
</svg>
						<p class="d-none d-md-block mb-0">My cart</p>
					</a> <a href="<c:url value="/login" />"
						class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"><svg
							xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
							class="bi bi-person" viewBox="0 0 16 16">
													<path
								d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" /></svg>
						<p class="d-none d-md-block mb-0">Sign in</p> </a>
					<!-- 					<div class="dropdown me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"> -->
					<!-- 						<a class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1" -->
					<!-- 							data-bs-toggle="dropdown" aria-expanded="false"> <img -->
					<%-- 							src="<c:url value="/resources/images/user.png"/>" alt="mdo" width="32" height="32" --%>
					<%-- 							class="rounded-circle">${username} --%>
					<!-- 						</a> -->
					<!-- 						<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style=""> -->
					<%-- 							<li><a class="dropdown-item" href="<c:url value="/viewProfile"/>">Profile</a></li> --%>
					<!-- 							<li><hr class="dropdown-divider"></li> -->
					<%-- 							<li><a class="dropdown-item" href="<c:url value="/logout" />">Sign out</a></li> --%>
					<!-- 						</ul> -->
					<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
</header>
<body>
	<div style="min-height: 760px; min-width: auto;">
		<div class="bg-light">
			<jsp:include page="${view}" />
		</div>
	</div>
	<%-- 	<jsp:include page="${view}"/> --%>
</body>
<!-- Footer -->
<footer class="bg-dark text-white text-center text-lg-start text-muted bg-primary">
	<!-- Section: Links  -->
	<section class="">
		<div class="container text-center text-md-start pt-4 pb-4">
			<!-- Grid row -->
			<div class="row mt-3">
				<!-- Grid column -->
				<div class="col-12 col-lg-3 col-sm-12 mb-2">
					<!-- Content -->
					<a href="https://mdbootstrap.com/" target="_blank" class="text-white h2"> Webstore </a>
					<p class="mt-1 text-white">© 2023 Copyright: Webstore.com</p>
				</div>
				<!-- Grid column -->
				<!-- Grid column -->
				<div class="col-6 col-sm-4 col-lg-2">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Store</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="#">About us</a></li>
						<li><a class="text-white-50" href="#">Find store</a></li>
						<li><a class="text-white-50" href="#">Categories</a></li>
						<li><a class="text-white-50" href="#">Blogs</a></li>
					</ul>
				</div>
				<!-- Grid column -->
				<!-- Grid column -->
				<div class="col-6 col-sm-4 col-lg-2">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Information</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="#">Help center</a></li>
						<li><a class="text-white-50" href="#">Money refund</a></li>
						<li><a class="text-white-50" href="#">Shipping info</a></li>
						<li><a class="text-white-50" href="#">Refunds</a></li>
					</ul>
				</div>
				<!-- Grid column -->
				<!-- Grid column -->
				<div class="col-6 col-sm-4 col-lg-2">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Support</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="#">Help center</a></li>
						<li><a class="text-white-50" href="#">Documents</a></li>
						<li><a class="text-white-50" href="#">Account restore</a></li>
						<li><a class="text-white-50" href="#">My orders</a></li>
					</ul>
				</div>
				<!-- Grid column -->
				<!-- Grid column -->
				<div class="col-12 col-sm-12 col-lg-3">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Newsletter</h6>
					<p class="text-white">Stay in touch with latest updates about our products and offers</p>
					<div class="input-group mb-3">
						<input type="email" class="form-control border" placeholder="Email" aria-label="Email"
							aria-describedby="button-addon2" />
						<button class="btn btn-light border shadow-0" type="button" id="button-addon2"
							data-mdb-ripple-color="dark">Join</button>
					</div>
				</div>
				<!-- Grid column -->
			</div>
			<!-- Grid row -->
		</div>
	</section>
	<!-- Section: Links  -->
	<div class="">
		<div class="container">
			<div class="d-flex justify-content-between py-4 border-top">
				<!--- payment --->
				<div>
					<i class="fab fa-lg fa-cc-visa text-white"></i> <i class="fab fa-lg fa-cc-amex text-white"></i>
					<i class="fab fa-lg fa-cc-mastercard text-white"></i> <i
						class="fab fa-lg fa-cc-paypal text-white"></i>
				</div>
				<!--- payment --->
				<!--- language selector --->
				<!-- 				<div class="dropdown dropup"> -->
				<!-- 					<a class="dropdown-toggle text-white" href="#" id="Dropdown" role="button" -->
				<!-- 						data-mdb-toggle="dropdown" aria-expanded="false"> <i -->
				<!-- 						class="flag-united-kingdom flag m-0 me-1"></i>English -->
				<!-- 					</a> -->
				<!-- 					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="Dropdown"> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-united-kingdom flag"></i>English -->
				<!-- 								<i class="fa fa-check text-success ms-2"></i></a></li> -->
				<!-- 						<li><hr class="dropdown-divider" /></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-poland flag"></i>Polski</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-china flag"></i>中文</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-japan flag"></i>日本語</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-germany flag"></i>Deutsch</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-france flag"></i>Français</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-spain flag"></i>Español</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-russia flag"></i>Русский</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#"><i class="flag-portugal flag"></i>Português</a></li> -->
				<!-- 					</ul> -->
				<!-- 				</div> -->
				<!--- language selector --->
			</div>
		</div>
	</div>
</footer>
<!-- Footer -->
</html>