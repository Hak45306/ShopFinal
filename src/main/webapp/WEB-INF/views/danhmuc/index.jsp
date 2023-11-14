<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.List"%>
<%@ page import="com.packt.webstore.domain.danhmuc"%>
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
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
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
		var totalRows = ${list.size()};
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
		<h1 STYLE="text-align: center;">Danh mục</h1>
		<a class="btn btn-secondary" href="<spring:url value="/admin/danhmuc/" />">Back</a>
		<div class="col-8 offset-2 bg-light">
			<form method="post" action="<spring:url value="/admin/danhmuc/add" />" modelAttribute="danhmuc">
				<div class="row mt-1">
					<div class="col-6" style="text-align: center;">
						<label>Tên danh mục</label> <input type="text" name="name" class="form-control" value="" />
					</div>
					<div class="col-6">
						</br>
						<button class="btn btn-primary" type="submit">Add</button>
					</div>
				</div>
			</form>
		</div>
		<div class="py-3">
			<div class="row flex-lg-nowrap">
				<div class="col">
					<div class="row flex-lg-nowrap">
						<div class="col mb-3">
							<div class="e-panel card">
								<div class="card-body">
									<h1 style="text-align: center;">Danh sách danh mục</h1>
									<div class="e-table">
										<div class="table-responsive table-lg mt-3">
											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th class="align-top">#</th>
														<th class="max-width">Name</th>
														<th>Actions</th>
													</tr>
												</thead>
												<c:forEach items="${list}" var="dm" varStatus="statu">
													<tbody class="phantrang">
														<tr>
															<td class="align-middle">${statu.index+1}</td>
															<td class="text-nowrap align-middle">${dm.name }</td>
															<td class="text-center align-middle">
																<div class="btn-group align-top">
																	<a href=" <spring:url value="/admin/damhmuc/edit?id=${dm.id}" /> "
																		class="btn btn-sm btn-outline-secondary badge" type="button" data-toggle="modal"
																		data-target="#user-form-modal">Edit</a> <a
																		href=" <spring:url value="/admin/damhmuc/delete?id=${dm.id}" /> "
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