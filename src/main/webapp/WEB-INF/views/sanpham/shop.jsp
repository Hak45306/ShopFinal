<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.List"%>
<%@ page import="com.packt.webstore.domain.sanpham"%>
<!DOCTYPE html>
<html>
<head>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<title>Shop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
</head>
<script type="text/javascript">
	$(function() {
		var pageSize = 4;
		showPage = function(page) {
			$(".phantrang").hide();
			$(".phantrang").each(function(n) {
				if (n >= pageSize * (page - 1) && n < pageSize * page)
					$(this).show();
			});
		}
		showPage(1);
		var totalRows = ${list.size()};//
		var btnPage = 3; // Số nút bấm hiển thị di chuyển trang
		var iTotalPages = Math.ceil(totalRows / pageSize);

		var obj = $('#pagination').twbsPagination({
			totalPages : iTotalPages,
			visiblePages : btnPage,
			first : "‹‹",
			prev : "‹",
			next : "›",
			last : "››",
			onPageClick : function(event, page) {
				showPage(page);
			}
		});
	});
</script>
<body>
	<!-- Heading -->
	<!-- 	<div class="bg-primary"> -->
	<!-- 		<div class="container py-4"> -->
	<!-- Breadcrumb -->
	<!-- 			<nav class="d-flex"> -->
	<!-- 				<h6 class="mb-0"> -->
	<!-- 					<a href="" class="text-white-50">Home</a> <span class="text-white-50 mx-2"> > </span> <a -->
	<!-- 						href="" class="text-white"><u>Shopping cart</u></a> -->
	<!-- 				</h6> -->
	<!-- 			</nav> -->
	<!-- Breadcrumb -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- Heading -->
	<div class="container mt-1" style="min-height: 760px; min-width: auto;">
		<section>
			<div class="my-2">
				<div class="row mt-3">
					<h1 STYLE="text-align: center;">Danh sách sản phẩm</h1>
					<c:forEach items="${list}" var="sp" varStatus="index">
						<div class="phantrang col-lg-3 col-md-6 col-sm-6">
							<div class="card px-4 border shadow-0 mb-4 mb-lg-0">
								<div class="mask px-2" style="height: 20px;"></div>
								<a href="<c:url value="/resources/images/${sp.img}" />" class="card-img-top rounded-2"
									STYLE="text-align: center;" target="_blank"> <img
									src="<spring:url value="/resources/images/${sp.img}" />" HEIGHT="100px" WIDTH="100px">
								</a>
								<div class="card-body d-flex flex-column pt-3 border-top">
									<%-- 									<a class="nav-link">Idsp: ${sp.id} </a>  --%>
									<a class="nav-link">Tên: ${sp.name}</a>
									<div class="price-wrap mb-2">
										<strong class="">Giá: ${sp.price}₫ </strong>
										<!-- 										<del class="">$24.99</del> -->
										<a class="nav-link">Số lượng: ${sp.soluong}</a> <a class="nav-link">Danh mục: <c:forEach
												items="${danhmuc}" var="dm"> 
														${sp.iddm==dm.id?dm.name:""} 
														</c:forEach></a>
									</div>
									<div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
										<a href="<c:url value="/shop/detail?id=${sp.id}" />" class="btn btn-outline-success w-100">Detail</a>
										<a href="<c:url value="/giohang/addlink?idpro=${sp.id}"/>"
											class="btn btn-outline-primary w-100">Add to cart</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<%-- Pagination --%>
				<div class="row mt-5">
					<ul class="pagination justify-content-center" id="pagination">
						<p>ANh</p>
					</ul>
				</div>
			</div>
		</section>
	</div>
	<!-- cart + summary -->
	<!-- 	<section> -->
	<!-- 		<div class="container my-5"> -->
	<!-- 			<header class="mb-4"> -->
	<!-- 				<h3>Recommended items</h3> -->
	<!-- 			</header> -->
	<!-- 			<div class="row"> -->
	<!-- 				<div class="col-lg-3 col-md-6 col-sm-6"> -->
	<!-- 					<div class="card px-4 border shadow-0 mb-4 mb-lg-0"> -->
	<!-- 						<div class="mask px-2" style="height: 50px;"> -->
	<!-- 							<div class="d-flex justify-content-between"> -->
	<!-- 								<h6> -->
	<!-- 									<span class="badge bg-danger pt-1 mt-3 ms-2">New</span> -->
	<!-- 								</h6> -->
	<!-- 								<a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 						<a href="#" class=""> <img -->
	<!-- 							src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/7.webp" -->
	<!-- 							class="card-img-top rounded-2" /> -->
	<!-- 						</a> -->
	<!-- 						<div class="card-body d-flex flex-column pt-3 border-top"> -->
	<!-- 							<a href="#" class="nav-link">Gaming Headset with Mic</a> -->
	<!-- 							<div class="price-wrap mb-2"> -->
	<!-- 								<strong class="">$18.95</strong> -->
	<!-- 								<del class="">$24.99</del> -->
	<!-- 							</div> -->
	<!-- 							<div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto"> -->
	<!-- 								<a href="#" class="btn btn-outline-primary w-100">Add to cart</a> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="col-lg-3 col-md-6 col-sm-6"> -->
	<!-- 					<div class="card px-4 border shadow-0 mb-4 mb-lg-0"> -->
	<!-- 						<div class="mask px-2" style="height: 50px;"> -->
	<!-- 							<a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a> -->
	<!-- 						</div> -->
	<!-- 						<a href="#" class=""> <img -->
	<!-- 							src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/5.webp" -->
	<!-- 							class="card-img-top rounded-2" /> -->
	<!-- 						</a> -->
	<!-- 						<div class="card-body d-flex flex-column pt-3 border-top"> -->
	<!-- 							<a href="#" class="nav-link">Apple Watch Series 1 Sport </a> -->
	<!-- 							<div class="price-wrap mb-2"> -->
	<!-- 								<strong class="">$120.00</strong> -->
	<!-- 							</div> -->
	<!-- 							<div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto"> -->
	<!-- 								<a href="#" class="btn btn-outline-primary w-100">Add to cart</a> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="col-lg-3 col-md-6 col-sm-6"> -->
	<!-- 					<div class="card px-4 border shadow-0"> -->
	<!-- 						<div class="mask px-2" style="height: 50px;"> -->
	<!-- 							<a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a> -->
	<!-- 						</div> -->
	<!-- 						<a href="#" class=""> <img -->
	<!-- 							src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/9.webp" -->
	<!-- 							class="card-img-top rounded-2" /> -->
	<!-- 						</a> -->
	<!-- 						<div class="card-body d-flex flex-column pt-3 border-top"> -->
	<!-- 							<a href="#" class="nav-link">Men's Denim Jeans Shorts</a> -->
	<!-- 							<div class="price-wrap mb-2"> -->
	<!-- 								<strong class="">$80.50</strong> -->
	<!-- 							</div> -->
	<!-- 							<div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto"> -->
	<!-- 								<a href="#" class="btn btn-outline-primary w-100">Add to cart</a> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="col-lg-3 col-md-6 col-sm-6"> -->
	<!-- 					<div class="card px-4 border shadow-0"> -->
	<!-- 						<div class="mask px-2" style="height: 50px;"> -->
	<!-- 							<a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a> -->
	<!-- 						</div> -->
	<!-- 						<a href="#" class=""> <img -->
	<!-- 							src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp" -->
	<!-- 							class="card-img-top rounded-2" /> -->
	<!-- 						</a> -->
	<!-- 						<div class="card-body d-flex flex-column pt-3 border-top"> -->
	<!-- 							<a href="#" class="nav-link">Mens T-shirt Cotton Base Layer Slim fit </a> -->
	<!-- 							<div class="price-wrap mb-2"> -->
	<!-- 								<strong class="">$13.90</strong> -->
	<!-- 							</div> -->
	<!-- 							<div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto"> -->
	<!-- 								<a href="#" class="btn btn-outline-primary w-100">Add to cart</a> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</section> -->
	<!-- Recommended -->
</body>
</html>