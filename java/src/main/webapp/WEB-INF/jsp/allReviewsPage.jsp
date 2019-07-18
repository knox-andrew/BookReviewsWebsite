<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="container mb-4">
	<c:forEach var="book" items="${bookList}">
		<div class="container mb-4 p-2 rounded alert alert-info">
			<div class="row">
				<div class="col-4">
					<c:url var="bookUrl" value="/bookDetails">
						<c:param name="bookId">${book.bookId}</c:param>
					</c:url>
					<a href="${bookUrl}">
						<img src="<c:url value="/img/${book.imgName}"/>" class="img-fluid"/>
					</a>
				</div>
				<div class="col-8">
					<c:import url="common/reviewList.jsp">
						<c:param name="bookId" value="${book.bookId}"/>
					</c:import>
				</div>
			</div>
		</div>
		<!--
		<div class="container" style="width: 25rem">
			<img src="<c:url value="/img/${book.imgName}"/>"/>
		</div>
		<div class="container d-flex flex-column">
			<c:import url="common/reviewList.jsp">
				<c:param name="bookId" value="${book.bookId}"/>
			</c:import>
		</div>
		-->
			
	</c:forEach>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
