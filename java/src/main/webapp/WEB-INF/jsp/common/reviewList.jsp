<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/img/star.png" var="starImgSrc" />
<c:forEach var="review" items="${reviewList}">

	<c:if test="${review.bookId == param.bookId}">
		<ul class="list-group">
			<li class="list-group-item">
				<h4>
					${review.title}
					<c:forEach begin="1" end="${review.rating}">
						<img src="${starImgSrc}">
					</c:forEach>

				</h4>
				<p>by ${review.username} on
					${review.dateSubmitted.toLocalDate()}</p>
				<p>${review.text}</p>
			</li>
		</ul>
	</c:if>
</c:forEach>
