<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<title>Sản phẩm</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
</head>
<body>
	<!-- Heading -->
	<div class="bg-primary">
		<div class="container py-4">
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
	<div class="container" style="min-height: 760px; min-width: auto;">
		<h1 style="text-align: center;">Sản phẩm</h1>
		<a class="btn" href="#">Back</a>
		<div class="col-8 offset-2 bg-light">
			<form method="post" action="<spring:url value="/admin/sanpham/add" />">
				<div class="row mt-2">
					<div class="col-6">
						<label>Tên</label> <input type="text" name="name" class="form-control list-inline-item" />
					</div>
					<div class="col-6">
						<label>Giá</label> <input type="text" name="price" class="form-control" />
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-6">
						<label>Số lượng</label> <input type="text" name="soluong" class="form-control" />
					</div>
					<div class="col-6">
						<label>Hình ảnh</label> <input type="file" name="img" class="form-control" />
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-6">
						<label>Mô tả</label> <input type="text" name="mota" class="form-control" />
					</div>
					<div class="col-6">
						<label>Danh mục</label> <select name="danhmuc" class="form-select">
							<c:forEach items="${danhmuc}" var="dm">
								<option value="${dm.id}">${dm.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<button class="btn btn-primary" type="submit">Add</button>
				<!-- 				<div class="row mt-2"> -->
				<!-- 					<div class="col-6"> -->
				<!-- 						<button class="btn btn-primary" type="submit">Add</button> -->
				<!-- 					</div> -->
				<!-- 					<div class="col-6"> -->
				<%-- 						<c:if test="${ not empty errMess }"> --%>
				<%-- 							<div class="alert alert-danger">${ errMess }</div> --%>
				<%-- 						</c:if> --%>
				<!-- 					</div> -->
				<!-- 				</div> -->
			</form>
		</div>
		<table class="table table-hover">
			<h1 style="text-align: center;">Danh sách sản phẩm</h1>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Hình ảnh</th>
					<th scope="col">Tên</th>
					<th scope="col">Giá</th>
					<th scope="col">Số lượng</th>
					<!-- 					<th scope="col">Mô tả</th> -->
					<th scope="col">Danh mục</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="sp" varStatus="index">
				<tbody>
					<tr>
						<th scope="row">${index.index+1}</th>
						<td><img src="<c:url value="/resources/images/${sp.img}" />" HEIGHT="70px" WIDTH="80px"></td>
						<td>${sp.name}</td>
						<td>${sp.price}₫</td>
						<td>${sp.soluong}</td>
						<%-- 						<td>${sp.mota}</td> --%>
						<td><c:forEach items="${danhmuc}" var="dm">
							${sp.iddm==dm.id?dm.name:""}
							</c:forEach></td>
						<td><a href=" <spring:url value="/admin/sanpham/edit?id=${dm.id}" /> "
							class="btn btn-outline-secondary"> <span class="glyphicon-info-sign glyphicon" /></span> Edit
						</a> <a href=" <spring:url value="/admin/sanpham/delete?id=${dm.id}" /> "
							class="btn btn-outline-danger"> <span class="glyphicon-info-sign glyphicon" /></span> Delete
						</a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>