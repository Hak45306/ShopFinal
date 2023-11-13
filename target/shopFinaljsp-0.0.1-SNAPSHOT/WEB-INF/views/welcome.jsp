<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body class="container">
	<div class="jumbotron mb-3">
		<h1>${greeting}</h1>
		<p>${tagline}</p>
	</div>
	<div class="mb-2">
		<a href="<c:url value="/shop/" />" class="text-decoration-none">Home</a>
	</div>
</body>
</html>