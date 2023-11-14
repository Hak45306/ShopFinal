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
	<section class="vh-100 gradient-custom">
		<div class="container py-3 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">
							<div class="mb-md-5 mt-md-4 pb-5">
								<h2 class="fw-bold mb-2 text-uppercase">Profile</h2>
								<p class="text-white-50 mb-5">Please enter your new information!</p>
								<form action="/shopFinaljsp/profile?id=${profile.id}" method="post" class="form-horizontal">
									<div class="form-outline form-white mb-2">
										<input type="email" id="typeEmailX" name="email" class="form-control form-control-lg"
											value="${profile.email}" /> <label class="form-label" for="typeEmailX">Email</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="text" id="typeUsernameX" name="username" class="form-control form-control-lg"
											value="${profile.user}" /> <label class="form-label" for="typeUsernameX">Username</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="password" id="typePasswordX" name="password"
											class="form-control form-control-lg" value="${profile.pass}" /> <label
											class="form-label" for="typePasswordX">Password</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="tel" id="typePhonenumberX" name="phonenumber"
											class="form-control form-control-lg" value="${profile.tel}" /> <label class="form-label"
											for="typePhonenumberX">Phone number</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="text" id="typeAddressX" name="address" class="form-control form-control-lg"
											value="${profile.address}" /> <label class="form-label" for="typeAddressX">Address</label>
									</div>
									<button class="btn btn-outline-light btn-lg px-5" type="submit">Update</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ????????????????????????????????????????????? -->
	<!-- 		<div class="container"> -->
	<!-- 		<div class="row flex-lg-nowrap py-2"> -->
	<!-- 			<div class="col-12 col-lg-auto mb-3" style="width: 200px;"> -->
	<!-- 				    <div class="card p-3"> -->
	<!-- 				      <div class="e-navlist e-navlist--active-bg"> -->
	<!-- 				        <ul class="nav"> -->
	<!-- 				          <li class="nav-item"><a class="nav-link px-2 active" href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li> -->
	<!-- 				          <li class="nav-item"><a class="nav-link px-2" href="https://www.bootdey.com/snippets/view/bs4-crud-users" target="__blank"><i class="fa fa-fw fa-th mr-1"></i><span>CRUD</span></a></li> -->
	<!-- 				          <li class="nav-item"><a class="nav-link px-2" href="https://www.bootdey.com/snippets/view/bs4-edit-profile-page" target="__blank"><i class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li> -->
	<!-- 				        </ul> -->
	<!-- 				      </div> -->
	<!-- 				    </div> -->
	<!-- 			</div> -->
	<!-- 			<div class="col"> -->
	<!-- 				<div class="row"> -->
	<!-- 					<div class="col mb-3"> -->
	<!-- 						<div class="card"> -->
	<!-- 							<div class="card-body"> -->
	<!-- 								<div class="e-profile"> -->
	<!-- 									              <div class="row"> -->
	<!-- 									                <div class="col-12 col-sm-auto mb-3"> -->
	<!-- 									                  <div class="mx-auto" style="width: 140px;"> -->
	<!-- 									                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);"> -->
	<!-- 									                      <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span> -->
	<!-- 									                    </div> -->
	<!-- 									                  </div> -->
	<!-- 									                </div> -->
	<!-- 									                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3"> -->
	<!-- 									                  <div class="text-center text-sm-left mb-2 mb-sm-0"> -->
	<!-- 									                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">John Smith</h4> -->
	<!-- 									                    <p class="mb-0">@johnny.s</p> -->
	<!-- 									                    <div class="text-muted"><small>Last seen 2 hours ago</small></div> -->
	<!-- 									                    <div class="mt-2"> -->
	<!-- 									                      <button class="btn btn-primary" type="button"> -->
	<!-- 									                        <i class="fa fa-fw fa-camera"></i> -->
	<!-- 									                        <span>Change Photo</span> -->
	<!-- 									                      </button> -->
	<!-- 									                    </div> -->
	<!-- 									                  </div> -->
	<!-- 									                  <div class="text-center text-sm-right"> -->
	<!-- 									                    <span class="badge badge-secondary">administrator</span> -->
	<!-- 									                    <div class="text-muted"><small>Joined 09 Dec 2017</small></div> -->
	<!-- 									                  </div> -->
	<!-- 									                </div> -->
	<!-- 									              </div> -->
	<!-- 									<div class="tab-content pt-3"> -->
	<!-- 										<div class="tab-pane active"> -->
	<%-- 											<form class="form" novalidate=""> --%>
	<!-- 												<div class="row"> -->
	<!-- 													<div class="col-12 col-sm-12 mb-3"> -->
	<!-- 														<div class="row"> -->
	<!-- 															<div class="col"> -->
	<!-- 																<div class="form-group"> -->
	<!-- 																	<label>Username</label> <input class="form-control" type="text" name="username" -->
	<!-- 																		placeholder="johnny.s" value="johnny.s"> -->
	<!-- 																</div> -->
	<!-- 															</div> -->
	<!-- 														</div> -->
	<!-- 														<div class="row"> -->
	<!-- 															<div class="col"> -->
	<!-- 																<div class="form-group"> -->
	<!-- 																	<label>Email</label> <input class="form-control" type="text" -->
	<!-- 																		placeholder="user@example.com"> -->
	<!-- 																</div> -->
	<!-- 															</div> -->
	<!-- 														</div> -->
	<!-- 														<div class="row"> -->
	<!-- 															<div class="col mb-3"> -->
	<!-- 																<div class="form-group"> -->
	<!-- 																	<label>About</label> -->
	<!-- 																	<textarea class="form-control" rows="5" placeholder="My Bio"></textarea> -->
	<!-- 																</div> -->
	<!-- 															</div> -->
	<!-- 														</div> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<div class="row"> -->
	<!-- 													<div class="col-12 col-sm-12 mb-3"> -->
	<!-- 														<div class="mb-2"> -->
	<!-- 															<b>Change Password</b> -->
	<!-- 														</div> -->
	<!-- 														<div class="row"> -->
	<!-- 															<div class="col"> -->
	<!-- 																<div class="form-group"> -->
	<!-- 																	<label>Current Password</label> <input class="form-control" type="password" -->
	<!-- 																		placeholder="••••••"> -->
	<!-- 																</div> -->
	<!-- 															</div> -->
	<!-- 														</div> -->
	<!-- 														<div class="row"> -->
	<!-- 															<div class="col"> -->
	<!-- 																<div class="form-group"> -->
	<!-- 																	<label>New Password</label> <input class="form-control" type="password" -->
	<!-- 																		placeholder="••••••"> -->
	<!-- 																</div> -->
	<!-- 															</div> -->
	<!-- 														</div> -->
	<!-- 														<div class="row"> -->
	<!-- 															<div class="col"> -->
	<!-- 																<div class="form-group"> -->
	<!-- 																	<label>Confirm <span class="d-none d-xl-inline">Password</span></label> <input -->
	<!-- 																		class="form-control" type="password" placeholder="••••••"> -->
	<!-- 																</div> -->
	<!-- 															</div> -->
	<!-- 														</div> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<div class="row"> -->
	<!-- 													<div class="col d-flex justify-content-start"> -->
	<!-- 														<button class="btn btn-primary" type="submit">Save Changes</button> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<%-- 											</form> --%>
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 					<div class="col-12 col-md-3 mb-3"> -->
	<!-- 						<div class="card mb-3"> -->
	<!-- 							<div class="card-body"> -->
	<!-- 								<div class="px-xl-3"> -->
	<!-- 									<button class="btn btn-block btn-secondary"> -->
	<!-- 										<i class="fa fa-sign-out"></i> <span>Logout</span> -->
	<!-- 									</button> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
</body>
</html>