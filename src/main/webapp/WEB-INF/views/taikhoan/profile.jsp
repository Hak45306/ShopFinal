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
<title>Register page</title>
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
								<form action="/shopJsp/profile" method="post"  class="form-horizontal">
									<div class="form-outline form-white mb-2">
										<input type="email" id="typeEmailX" name="email" class="form-control form-control-lg" value="${profile.email}"/>
										<label class="form-label" for="typeEmailX">Email</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="text" id="typeUsernameX" name="username" class="form-control form-control-lg" value="${profile.user}"/>
										<label class="form-label" for="typeUsernameX">Username</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="password" id="typePasswordX" name="password"
											class="form-control form-control-lg" value="${profile.pass}"/> <label class="form-label" for="typePasswordX">Password</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="tel" id="typePhonenumberX" name="phonenumber"
											class="form-control form-control-lg" value="${profile.tel}"/> <label class="form-label" for="typePhonenumberX">Phone
											number</label>
									</div>
									<div class="form-outline form-white mb-2">
										<input type="text" id="typeAddressX" name="address" class="form-control form-control-lg" value="${profile.address}"/>
										<label class="form-label" for="typeAddressX">Address</label>
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
</body>
</html>