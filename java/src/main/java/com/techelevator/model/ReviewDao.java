package com.techelevator.model;

import java.util.List;

public interface ReviewDao {
	public List<Book> getAllBooks();
	public Book getBookById(Long bookId);
	public List<Review> getAllReviews();
	public List<Review> getReviewsForBookId(Long bookId);
	
	public void save(Review post);
}
