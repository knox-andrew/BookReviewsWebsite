<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="container">
	<h2>
		Reviewing:
		<small class="text-muted"><strong>${book.title}</strong></small>
	</h2>

</div>
<div class="container row">
	<div class="col-4">
		<div class="card ml-2 mr-2">
			<c:url var="bookUrl" value="/bookDetails">
				<c:param name="bookId">${book.bookId}</c:param>
			</c:url>
			
			<a href="${bookUrl}">
				<img class="card-img-top" style="width: 100%" src="<c:url value="/img/${book.imgName}"/>"/>
			</a>
			<div class="card-body">
				<h5 class="card-title">${book.title}</h5>
				<h6 class="card-subtitle mb-2 text-muted">by ${book.author}</h6>
			</div>
		</div>
	</div>
	
	<div class="col-sm-8">
		<c:url var="postUrl" value="/postReviewInput">
			<c:param name="bookId">${book.bookId}</c:param>
		</c:url>
		<form class="form-horizontal" action="${postUrl}" method="POST">
			<div class="container row form-group">
				<div class="col-sm-1">
					<label for="username">Name</label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" type="text" name="username" placeholder="Enter name"/>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-1">
					<label for="rating">Rating</label>
				</div>
				
				<div class="col-sm-1">
					<select name="rating">
						<option value=1>1</option>
						<option value=2>2</option>
						<option value=3>3</option>
						<option value=4>4</option>
						<option value=5>5</option>
					</select>
				</div>
			</div>
			
			<div class="container row form-group">
				<div class="col-sm-1">
					<label for="subject">Subject</label>
				</div>
				
				<div class="col-sm-8">
					<input class="form-control" type="text" name="subject" placeholder="Enter subject"/>
				</div>
		
			</div>
			
			<div class="container row form-group">
			
				<div class="col-sm-1">
					<label for="message">Review</label>
				</div>
				
				<div class="col-sm-8">
					<textarea name="message" placeholder="Enter Review" class="form-control" rows="3"></textarea>
				</div>
			</div>
			<div class="container row text-center">
				<div class="col-sm-8">
					<button class="btn btn-primary" type="submit">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />
