<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Chi tiết sản phẩm</h1>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="<c:url value="/resources/images/${sanpham.img}"/>" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-5">
				<h3>${sanpham.name}</h3>
				<p>${sanpham.mota}</p>
				<p>
					<strong>Item Code : </strong><span class="label label-warning">${sanpham.id}</span>
				</p>
				<!-- 				<p> -->
				<%-- 					<strong>manufacturer</strong> : ${sanpham.manufacturer} --%>
				<!-- 				</p> -->
				<p>
					<strong>category</strong> :
					<c:forEach items="${danhmuc}" var="dm">
							${sanpham.iddm==dm.id?dm.name:""}
							</c:forEach>
				</p>
				<p>
					<strong>Availble units in stock </strong> : ${sanpham.soluong}
				</p>
				<h4>${sanpham.price}₫</h4>
				<p>
					<a href="<spring:url value="/shop/" />" class="btn btn-secondary"> <span
						class="glyphicon-hand-left glyphicon"></span> Back
					</a> <a href="#" class="btn btn-warning btn-large"> <span
						class="glyphicon-shopping-cart glyphicon"></span> Order Now
					</a>
				</p>
			</div>
		</div>
	</section>
</body>
</html>