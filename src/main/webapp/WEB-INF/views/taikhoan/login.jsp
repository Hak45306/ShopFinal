<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <!DOCTYPE html> -->
<html lang="en">
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<title>Login page</title>
</head>
<body>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">
							<div class="mb-md-5 mt-md-4 pb-5">
								<h2 class="fw-bold mb-2 text-uppercase">Login</h2>
								<p class="text-white-50 mb-5">Please enter your login and password!</p>
								<c:url var="loginUrl" value="/login" />
								<form action="${loginUrl}" method="post" class="form-horizontal">
									<c:if test="${param.error != null}">
										<div class="alert alert-danger">
											<p>Invalid username and password.</p>
										</div>
									</c:if>
									<c:if test="${param.logout != null}">
										<div class="alert alert-success">
											<p>You have been logged out successfully.</p>
										</div>
									</c:if>
									<c:if test="${param.accessDenied !=null}">
										<div class="alert alert-danger">
											<p>Access Denied: You are not authorised!</p>
										</div>
									</c:if>
									<div class="form-outline form-white mb-4">
										<input type="text" id="typeUsernameX" name="username" class="form-control form-control-lg"
											placeholder="Enter Username" required /> <label class="form-label" for="typeUsernameX">Username</label>
									</div>
									<div class="form-outline form-white mb-4">
										<input type="password" id="typePasswordX" name="password"
											class="form-control form-control-lg" placeholder="Enter Password" required /> <label
											class="form-label" for="typePasswordX">Password</label>
									</div>
									<!-- 									<p class="small mb-5 pb-lg-2"> -->
									<!-- 										<a class="text-white-50" href="#!">Forgot password?</a> -->
									<!-- 									</p> -->
									<button class="btn btn-outline-light btn-lg px-5" type="submit" value="Login">Login</button>
								</form>
							</div>
							<div>
								<p class="mb-0">
									Don't have an account? <a href="<c:url value="/viewRegister" />"
										class="text-white-50 fw-bold">Sign Up</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>