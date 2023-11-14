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
<title>Sản phẩm</title>
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
		var totalRows = ${list.size()}; //
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
				<div class="row mt-2">
					</br>
					<button class="btn btn-primary" type="submit">Add</button>
				</div>
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
		<div class="py-3">
			<div class="row flex-lg-nowrap">
				<div class="col">
					<div class="row flex-lg-nowrap">
						<div class="col mb-3">
							<div class="e-panel card">
								<div class="card-body">
									<h1 style="text-align: center;">Danh sách sản phẩm</h1>
									<div class="e-table">
										<div class="table-responsive table-lg mt-3">
											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th class="align-top">#</th>
														<th>Photo</th>
														<th class="max-width">Name</th>
														<th class="sortable">Price</th>
														<th class="sortable">Số lượng</th>
														<!-- 													<th class="sortable">Mô tả</th> -->
														<th class="sortable">Danh mục</th>
														<!-- 													<th></th> -->
														<th>Actions</th>
													</tr>
												</thead>
												<c:forEach items="${list}" var="sp" varStatus="statu">
													<tbody class="phantrang">
														<tr>
															<td class="align-middle">${statu.index+1}</td>
															<td class="align-middle text-center"><img
																src="<c:url value="/resources/images/${sp.img}" />" HEIGHT="60px" WIDTH="60px">
															</td>
															<td class="text-nowrap align-middle">${sp.name }</td>
															<td class="text-nowrap align-middle"><span>${sp.price}₫</span></td>
															<td class="text-nowrap align-middle"><span>${sp.soluong}</span></td>
															<%-- 													<td class="text-nowrap align-middle"><span>${sp.mota}</span></td> --%>
															<td class="text-center align-middle"><c:forEach items="${danhmuc}" var="dm">
							${sp.iddm==dm.id?dm.name:""}
							</c:forEach></td>
															<td class="text-center align-middle">
																<div class="btn-group align-top">
																	<a href=" <spring:url value="/admin/sanpham/edit?id=${sp.id}" /> "
																		class="btn btn-sm btn-outline-secondary badge" type="button" data-toggle="modal"
																		data-target="#user-form-modal">Edit</a> <a
																		href=" <spring:url value="/admin/sanpham/delete?id=${sp.id}" /> "
																		class="btn btn-sm btn-outline-danger badge" type="button"> <svg
																			xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor"
																			class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path
																				d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
</svg>
																	</a>
																</div>
															</td>
														</tr>
													</tbody>
												</c:forEach>
											</table>
										</div>
										<div class="d-flex justify-content-center">
											<ul class="pagination mt-3 mb-0" id="pagination">
												<!-- 											<li class="disabled page-item"><a href="#" class="page-link">‹</a></li> -->
												<!-- 											<li class="active page-item"><a href="#" class="page-link">1</a></li> -->
												<!-- 											<li class="page-item"><a href="#" class="page-link">2</a></li> -->
												<!-- 											<li class="page-item"><a href="#" class="page-link">3</a></li> -->
												<!-- 											<li class="page-item"><a href="#" class="page-link">4</a></li> -->
												<!-- 											<li class="page-item"><a href="#" class="page-link">5</a></li> -->
												<!-- 											<li class="page-item"><a href="#" class="page-link">›</a></li> -->
												<!-- 											<li class="page-item"><a href="#" class="page-link">»</a></li> -->
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>