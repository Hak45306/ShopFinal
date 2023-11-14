<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<title>Giỏ hàng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
</head>
<body>
	<!-- Heading -->
	<div class="bg-primary">
		<div class="container py-2">
			<!-- Breadcrumb -->
			<nav class="d-flex">
				<h6 class="mb-0">
					<a href="" class="text-white-50">Home</a> <span class="text-white-50 mx-2"> > </span> <a
						href="" class="text-white"><u>Shopping cart</u></a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->
	<section class="bg-light my-5">
		<div class="container">
			<div class="row">
				<!-- cart -->
				<div class="col-lg-9">
					<div class="card border shadow-0">
						<div class="m-4">
							<h4 class="card-title mb-4">Your shopping cart</h4>
							<c:forEach items="${listgh}" var="gh" varStatus="index">
								<div class="row gy-3 mb-4">
									<div class="col-lg-5">
										<div class="me-lg-5">
											<div class="d-flex">
												<c:forEach items="${listsp}" var="sp">
													<c:forEach items="${gh.idpro==sp.id?sp.img:null}" var="item">
														<img src="<c:url value="/resources/images/${item}"/>" class="border rounded me-4"
															style="width: 100px; height: 100px;" />
													</c:forEach>
													<%-- 													<c:url value="${gh.idpro==sp.id?sp.img:null}" /> --%>
												</c:forEach>
												<%-- 													<img src="<c:url value="/resources/images/${sp.img}"/>" --%>
												<!-- 															class="border rounded me-3" style="width: 100px; height: 100px;" /> -->
												<div class="">
													<a class="nav-link">Tên: <c:forEach items="${listsp}" var="sp">${gh.idpro==sp.id?sp.name:""}</c:forEach></a>
													<a class="nav-link">Số lượng: <input style="width: 80px;" class="form-control me-4"
														value="${gh.soluong}"></a>
													<text class="h6">Giá tiền: <c:forEach items="${listsp}" var="sp">${gh.idpro==sp.id?sp.price:""}</c:forEach>₫</text>
													<!-- 													<p class="text-muted">Yellow, Jeans</p> -->
												</div>
											</div>
										</div>
									</div>
									<div
										class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
										<div class="float-md-end">
											</br> <a href="<c:url value="/giohang/delete?id=${gh.id}"/>"
												class="btn btn-light border text-danger icon-hover-danger"> Remove</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="border-top pt-4 mx-4 mb-4">
							<p>
								<svg xmlns="http://www.w3.org/2000/svg" height="20" viewBox="0 0 640 512">
									<style>
svg {
	fill: #808080
}
</style>
									<path
										d="M48 0C21.5 0 0 21.5 0 48V368c0 26.5 21.5 48 48 48H64c0 53 43 96 96 96s96-43 96-96H384c0 53 43 96 96 96s96-43 96-96h32c17.7 0 32-14.3 32-32s-14.3-32-32-32V288 256 237.3c0-17-6.7-33.3-18.7-45.3L512 114.7c-12-12-28.3-18.7-45.3-18.7H416V48c0-26.5-21.5-48-48-48H48zM416 160h50.7L544 237.3V256H416V160zM112 416a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm368-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" /></svg>
								Delivery within 1-2 weeks
							</p>
						</div>
					</div>
				</div>
				<!-- cart -->
				<!-- summary -->
				<div class="col-lg-3">
					<!-- 					<div class="card mb-3 border shadow-0"> -->
					<!-- 						<div class="card-body"> -->
					<!-- 							<form> -->
					<!-- 								<div class="form-group"> -->
					<!-- 									<label class="form-label">Have coupon?</label> -->
					<!-- 									<div class="input-group"> -->
					<!-- 										<input type="text" class="form-control border" name="" placeholder="Coupon code" /> -->
					<!-- 										<button class="btn btn-light border">Apply</button> -->
					<!-- 									</div> -->
					<!-- 								</div> -->
					<!-- 							</form> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<div class="card shadow-0 border">
						<div class="card-body">
							<c:forEach items="${listgh}" var="gh" varStatus="index">
								<div class="d-flex justify-content-between">
									<p class="mb-2">
										Price:
										<c:forEach items="${listsp}" var="sp">
									${gh.idpro==sp.id?sp.price:""}</c:forEach>
										₫
									</p>
									<p class="mb-2">
										Quantity:
										<c:forEach items="${listsp}" var="sp">
									${gh.idpro==sp.id?gh.soluong:""}</c:forEach>
									</p>
								</div>
							</c:forEach>
							<!-- 							<div class="d-flex justify-content-between"> -->
							<!-- 								<p class="mb-2">Discount:</p> -->
							<!-- 								<p class="mb-2 text-success">-$60.00</p> -->
							<!-- 							</div> -->
							<!-- 							<div class="d-flex justify-content-between"> -->
							<!-- 								<p class="mb-2">TAX:</p> -->
							<!-- 								<p class="mb-2">$14.00</p> -->
							<!-- 							</div> -->
							<hr />
							<%-- 							<c:forEach items="${listgh}" var="gh" varStatus="index"> --%>
							<div class="d-flex justify-content-between">
								<p class="mb-2">Total price:</p>
								<p class="mb-2 fw-bold">
									<%-- 										<c:forEach items="${listsp}" var="sp"> --%>
									<%-- 									${gh.idpro==sp.id?sp.price*gh.soluong:""} --%>
									<%-- 									</c:forEach> --%>
									₫
								</p>
							</div>
							<div class="mt-3">
								<a href="<c:url value="/shop/hoadon/add"/>" class="btn btn-success w-100 shadow-0 mb-2">
									Make Purchase </a> <a href="<c:url value="/shop/"/>" class="btn btn-light w-100 border mt-2">
									Back to shop </a>
							</div>
							<%-- 							</c:forEach> --%>
						</div>
					</div>
				</div>
				<!-- summary -->
			</div>
		</div>
	</section>
</body>
</html>