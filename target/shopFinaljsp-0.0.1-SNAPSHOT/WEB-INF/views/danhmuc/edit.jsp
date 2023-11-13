<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<title>Edit danh mục</title>
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
		<h1 STYLE="text-align: center;">Edit danh mục</h1>
		<a class="btn btn-secondary" href="<spring:url value="/admin/danhmuc/" />">Back</a>
		<div class="col-8 offset-2 bg-light">
			<form method="post" action="<spring:url value="/admin/danhmuc/update?id=${danhmuc.id}" />">
				<div class="row mt-2">
					<label style="text-align: center;">Tên danh mục</label> <input type="text" name="name"
						class="form-control" value="${danhmuc.name}" />
				</div>
				<div class="row mt-3">
					<button class="btn btn-primary" type="submit">Update</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>