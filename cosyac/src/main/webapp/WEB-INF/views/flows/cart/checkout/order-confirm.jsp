<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Cosy Air Conditioners - Membership</title>

<script>
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap DataTables -->
<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- Bootswatch theme -->
<link href="${css}/bootswatch-lux-theme.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">

			<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
				<div class="container">
					<a class="navbar-brand" href="${contextRoot}/home">Home</a>
				</div>
			</nav>
		


		<!-- Page Content -->

		<div class="content">
			<div class="container">
				<div class="alert alert-success">
					<h3 class="text-center">Your Order is Confirmed!!</h3>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="invoice-title">
							<h2>Invoice</h2>
							<h3 class="pull-right">Order # ${orderDetail.id}</h3>
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-6">
								<address>
									<strong>Billed To:</strong><br>
									${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
									${orderDetail.billing.addressLineOne}<br>
									${orderDetail.billing.addressLineTwo}<br>
									${orderDetail.billing.city} - ${orderDetail.billing.postalCode}<br>
									${orderDetail.billing.state} - ${orderDetail.billing.country}
								</address>
							</div>
							<div class="col-xs-6 text-right">
								<address>
									<strong>Shipped To:</strong><br>
									${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
									${orderDetail.shipping.addressLineOne}<br>
									${orderDetail.shipping.addressLineTwo}<br>
									${orderDetail.shipping.city} -
									${orderDetail.shipping.postalCode}<br>
									${orderDetail.shipping.state} - ${orderDetail.shipping.country}
								</address>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6">
								<address>
									<strong>Payment Method:</strong><br> Card Payment <br>
									${orderDetail.user.email}
								</address>
							</div>
							<div class="col-xs-6 text-right">
								<address>
									<strong>Order Date:</strong><br> ${orderDetail.orderDate}<br>
									<br>
								</address>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<strong>Order summary</strong>
								</h3>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-condensed">
										<thead>
											<tr>
												<td><strong>Item</strong></td>
												<td class="text-center"><strong>Price</strong></td>
												<td class="text-center"><strong>Quantity</strong></td>
												<td class="text-right"><strong>Totals</strong></td>
											</tr>
										</thead>
										<tbody>
											<!-- foreach ($order->lineItems as $line) or some such thing here -->
											<c:forEach items="${orderDetail.orderItems}" var="orderItem">
												<tr>
													<td>${orderItem.product.name}</td>
													<td class="text-center">&#36; ${orderItem.buyingPrice}</td>
													<td class="text-center">${orderItem.productCount}</td>
													<td class="text-right">&#36; ${orderItem.total}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="text-center">
					<a href="${contextRoot}/show/all/products"
						class="btn btn-lg btn-warning">Continue Shopping</a>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../../flows-shared/footer.jsp"%>