<div class="container">

	<div class="row">

		<!-- To display sidebar -->
		<div class="my-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>

		<!-- To display products -->
		<div class="ml-auto">
			<div class="row">

				<!-- Added breadcrumb -->
				<div class="col-xl-12">
					<c:if test="${userClickAllProducts == true}">
						<script>
							window.categoryId = '';
						</script>
						<nav class="breadcrumb">
							<a class="breadcrumb-item" href="${contextRoot}/home">Home</a> 
							<span class="breadcrumb-item active">All Products</span>
						</nav>
					</c:if>

					<c:if test="${userClickCategoryProducts == true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<nav class="breadcrumb">
							<a class="breadcrumb-item" href="${contextRoot}/home">Home</a> 
							<a class="breadcrumb-item active">Category</a> 
							<span class="breadcrumb-item active">${category.name}</span>
						</nav>
					</c:if>
				</div>
				
				<div class ="row">
				<div class="row">
			
				<div class="my-3">
				
					
					<table id="productListTable" class="table table-striped table-borderd">
					
					
						<thead>
						
							<tr>
								<th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>Qty. Available</th>
								<th></th>
							
							</tr>
						
						</thead>
					

						<tfoot>
						
							<tr>
								<th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>Qty. Available</th>
								<th></th>
							
							</tr>
						
						</tfoot>
					</table>
				
				</div>
			
			</div>

			</div>

		</div>

	</div>

</div>
