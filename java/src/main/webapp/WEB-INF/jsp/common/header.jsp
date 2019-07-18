<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Book Review Service</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-2">
		<a class="navbar-brand" href="<c:url value="/home"/>">Books!</a>
		<ul class="navbar-nav mr-auto">
			<li class="navbar-item">
				<a class="nav-link" href="<c:url value="/allReviewsPage"/>">See All Book Reviews</a>
			</li>
		</ul>
	</nav>
	<div class="container">
