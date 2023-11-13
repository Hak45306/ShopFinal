<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.List" %>
<%@ page import="com.packt.webstore.domain.danhmuc" %>
<!DOCTYPE html>
<html>
<head>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<title>Danh mục</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
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
		var totalRows = ${list.size()}; 
		var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
		var iTotalPages = Math.ceil(totalRows / pageSize);

		var obj = $('#pagination').twbsPagination({
			totalPages : iTotalPages,
			visiblePages : btnPage,
			onPageClick : function(event, page) {
				showPage(page);
			}
		});
	});
</script>
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
		<h1 STYLE="text-align: center;">Danh mục</h1>
		<a class="btn btn-secondary" href="<spring:url value="/admin/danhmuc/" />">Back</a>
		<div class="col-8 offset-2 bg-light">
			<form method="post" action="<spring:url value="/admin/danhmuc/add" />" modelAttribute="danhmuc">
				<div class="row mt-1">
					<div class="col-6" style="text-align: center;">
						<label>Tên danh mục</label> 
						<input type="text" name="name"class="form-control" value=""/>
					</div>
					<div class="col-6">
					</br>
						<button class="btn btn-primary" type="submit">Add</button>
					</div>
				</div>
				<!-- 				<div class="row mt-2"> -->
				<!-- 					<button class="btn btn-primary" type="submit">Add</button> -->
				<!-- 				</div> -->
			</form>
		</div>
		<table class="table table-hover">
			<h1 style="text-align: center;">Danh sách danh mục</h1>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Tên</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="dm" varStatus="index">
				<tbody>
					<tr class="phantrang">
						<th scope="row">${index.index+1}</th>
						<td>${dm.name}</td>
						<td><a href=" <spring:url value="/admin/danhmuc/edit?id=${dm.id}" /> "
							class="btn btn-outline-secondary"> <span class="glyphicon-info-sign glyphicon" /></span> Edit
						</a> <a href=" <spring:url value="/admin/danhmuc/delete?id=${dm.id}" /> "
							class="btn btn-outline-danger"> <span class="glyphicon-info-sign glyphicon" /></span> Delete
						</a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<ul class="pagination justify-content-center" id="pagination">
						<p>ANh</p>
						<%-- 						<c:forEach var="index" begin="0" end="${ data.totalPages - 1 }"> --%>
						<!-- 							<li class="page-item mx-1"><a -->
						<%-- 								class="page-link ${ index==page?'bg-black text-white':'' }" href="/home?page=${ index }">${ index + 1 }</a></li> --%>
						<%-- 						</c:forEach> --%>
					</ul>
	</div>
</body>
</html>