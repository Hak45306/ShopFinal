<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<title>Profile page</title>
</head>
<body>
	<div class="container">
		<div class="row flex-lg-nowrap py-2">
			<div class="col-12 col-lg-auto mb-3">
				<div class="card p-3">
					<h4 style="text-align: center;">Danh sách hóa đơn</h4>
					<div class="e-navlist e-navlist--active-bg">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th class="align-top">#</th>
									<th class="max-width">Name</th>
									<th class="sortable">Price</th>
									<th class="sortable">Số lượng</th>
									<th class="sortable">Tình trạng</th>
									<th class="sortable">Danh mục</th>
									<th>Actions</th>
								</tr>
							</thead>
							<c:forEach items="${listhd}" var="hd" varStatus="status">
								<tbody class="phantrang">
									<tr>
										<td class="align-middle">${status.index+1}</td>
										<td class="text-nowrap align-middle"><span><c:forEach items="${listhdct}" var="hdct" varStatus="status">${hd.id==hdct.idhd?hdct.dongia:""}</c:forEach></span></td>
										<td class="text-nowrap align-middle"><span></span></td>
										<td class="text-center align-middle"></td>
										<td class="text-center align-middle"></td>
										<td class="text-center align-middle"></td>
										<td class="text-center align-middle">
											<div class="btn-group align-top">
												<a href=" <spring:url value="" /> " class="btn btn-sm btn-outline-secondary badge">Edit</a>
												<a href=" <spring:url value="" /> " class="btn btn-sm btn-outline-danger badge"> <svg
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
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col mb-3">
						<div class="card">
							<div class="card-body">
								<div class="e-profile">
									<div class="tab-content pt-3">
										<div class="tab-pane active">
											<form action="/shopFinaljsp/profile?id=${profile.id}" method="post" class="form">
												<div class="row">
													<div class="col-12 col-sm-12 mb-3">
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Username</label> <input class="form-control" type="text" name="username"
																		placeholder="username..." value="${profile.user}">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Email</label> <input class="form-control" type="text"
																		placeholder="user@example.com..." value="${profile.email}">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Address</label> <input class="form-control" type="text"
																		placeholder="address..." value="${profile.address}">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Tel</label> <input class="form-control" type="text" placeholder="tel..."
																		value="${profile.tel}">
																</div>
															</div>
														</div>
														<!-- 														<div class="row"> -->
														<!-- 															<div class="col mb-3"> -->
														<!-- 																<div class="form-group"> -->
														<!-- 																	<label>About</label> -->
														<!-- 																	<textarea class="form-control" rows="5" placeholder="My Bio"></textarea> -->
														<!-- 																</div> -->
														<!-- 															</div> -->
														<!-- 														</div> -->
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-12 mb-3">
														<div class="mb-2">
															<b>Change Password</b>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Current Password</label> <input class="form-control" type="password"
																		placeholder="••••••">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>New Password</label> <input class="form-control" type="password"
																		placeholder="••••••">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Confirm <span class="d-none d-xl-inline">Password</span></label> <input
																		class="form-control" type="password" placeholder="••••••">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col d-flex justify-content-start">
														<button class="btn btn-primary" type="submit">Save Changes</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-3 mb-3">
						<div class="card mb-3">
							<div class="card-body">
								<div class="px-xl-auto">
									<button class="btn btn-block btn-secondary">
										<i class="fa fa-sign-out"></i> <span>Logout</span>
									</button>
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