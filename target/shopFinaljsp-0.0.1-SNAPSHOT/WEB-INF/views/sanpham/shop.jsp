<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
</head>
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
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card px-4 border shadow-0 mb-4 mb-lg-0">
								<div class="mask px-2" style="height: 20px;"></div>
								<a href="<c:url value="/resources/images/${sp.img}" />" class="card-img-top rounded-2"
									STYLE="text-align: center;" target="_blank"> <img
									src="<spring:url value="/resources/images/${sp.img}" />" HEIGHT="100px" WIDTH="100px">
								</a>
								<div class="card-body d-flex flex-column pt-3 border-top">
									<a class="nav-link">Tên: <INPUT name="tensp" VALUE=" ${sp.name}" DISABLED="disabled"></a>
									<div class="price-wrap mb-2">
										<strong class="">Giá: <INPUT name="dongia" VALUE=" ${sp.price}">₫
										</strong>
										<!-- 	<del class="">$24.99</del> -->
										<a class="nav-link">Số lượng: ${sp.soluong}</a> <a class="nav-link">Danh mục: <c:forEach
												items="${danhmuc}" var="dm">
							${sp.iddm==dm.id?dm.name:""}
							</c:forEach></a>
									</div>
									<div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
										<a href="<c:url value="/shop/detail?id=${sp.id}" />" class="btn btn-outline-success w-100">Detail</a>
										<a href="<c:url value="/giohang/add" />" class="btn btn-outline-primary w-100">Add to
											cart</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<%-- Pagination --%>
				<div class="row mt-5">
					<ul class="pagination justify-content-center">
						<p>ANh</p>
						<%-- 						<c:forEach var="index" begin="0" end="${ data.totalPages - 1 }"> --%>
						<!-- 							<li class="page-item mx-1"><a -->
						<%-- 								class="page-link ${ index==page?'bg-black text-white':'' }" href="/home?page=${ index }">${ index + 1 }</a></li> --%>
						<%-- 						</c:forEach> --%>
					</ul>
				</div>
			</div>
		</section>
	</div>
</body>
</html>