<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url value="/img/forDummies.png" var="forDummiesImgSrc" />
<div class="container">
	<div class="jumbotron">
		<h1 class="display-5">Hello reader!</h1>
  		<p class="lead">Please select from the books below, from there you can read reviews or even post a review of your own.</p>
		
	</div>
	<div class="d-flex justify-content-around flex-wrap">
		<c:forEach var="book" items="${bookList}">
			<div class="card ml-2 mr-2" style="width: 20rem">
				<c:url var="bookUrl" value="/bookDetails">
					<c:param name="bookId">${book.bookId}</c:param>
				</c:url>
				
				<a href="${bookUrl}">
					<img class="card-img-top img-thumbnail" style= "width: 100%" src="<c:url value="/img/${book.imgName}"/>"/>
				</a>
				<div class="card-body">
					<h5 class="card-title">${book.title}</h5>
					<h6 class="card-subtitle mb-2 text-muted">by ${book.author}</h6>
				</div>
			</div>
		
		</c:forEach>
	</div>
</div>
<!--  
<div class="container text-center mb-5">
	<img src="${forDummiesImgSrc}" class="img-fluid"/>
</div>

<div class="container mb-2">
	<h3 class="text-center">Most Recent Reviews</h3>
	
	<c:import url="common/reviewList.jsp">
		<c:param name="limit" value="4"/>
	</c:import>
</div>

<div class="container text-center mb-4">
	<h3><a href="<c:url value="/reviewsPage"/>">More</a></h3>
</div>
-->

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
		