<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="container">
	<div class="row mb-5">
		<div class="col-5">
			<img src="<c:url value="/img/${book.imgName}"/>" class="img-fluid"/>
		</div>
		<div class="col-7 d-flex flex-column">
			<h4 class="mt-4">${book.title}</h4>
			<h6 class="mb-4">by ${book.author}</h6>
			<h6>${book.description}</h6>
			
			<c:url var="reviewBook" value="/postReviewInput">
				<c:param name="bookId">${book.bookId}</c:param>
			</c:url>
			<a href="${reviewBook}" class="btn btn-primary mt-auto" role="button">
				Add a review
			</a>
		</div>
	</div>
	<div class="d-flex justify-content-center alert alert-info">
		<h3>Reviews</h3>
	</div>
	<c:import url="common/reviewList.jsp">
		<c:param name="bookId" value="${book.bookId}"/>
	</c:import>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />