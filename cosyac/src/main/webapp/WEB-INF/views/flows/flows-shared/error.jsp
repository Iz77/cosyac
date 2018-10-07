<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Website using Spring MVC and hibernate">
<meta name="author" content="Rusumba Ntwali Isidore">

<title>Cosy Air Conditioners - FlowException</title>

<script>
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- Bootswatch theme -->
<link href="${css}/bootswatch-lux-theme.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">Home</a>
				</div>
			</div>
		</nav>


		<div class="content">

			<div class="container">

				<div class="row">

					<div class="col-xs-12">


						<div class="jumbotron">

							<h1>Please contact your administrator!</h1>
							<hr />

							<blockquote style="word-wrap: break-word">

								${flowExecutionException}</blockquote>

							<blockquote style="word-wrap: break-word">

								${rootCauseException}</blockquote>

						</div>


					</div>

				</div>

			</div>

		</div>


		<%@include file="../../shared/footer.jsp"%>

	</div>


</body>


</html>