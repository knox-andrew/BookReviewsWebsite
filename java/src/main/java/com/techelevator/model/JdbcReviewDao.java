package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcReviewDao implements ReviewDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcReviewDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Book> getAllBooks() {
		List<Book> bookList = new ArrayList<>();
		
		String sqlSelectAllBooks = "SELECT * FROM book";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBooks);
		
		while(results.next()) {
			bookList.add(mapRowToBook(results));
		}
		
		return bookList;
	}
	
	@Override
	public Book getBookById(Long bookId) {
		Book book = null;
		
		String sqlGetBookById = "SELECT * FROM book WHERE book_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBookById, bookId);
		
		if(results.next()) {
			book = mapRowToBook(results);
		}
		
		return book;
	}
	
	@Override
	public List<Review> getAllReviews() {
		List<Review> allReviews = new ArrayList<>();
		String sqlSelectAllReviews = "SELECT * FROM review ORDER BY review_date DESC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllReviews);
		while(results.next()) {
			allReviews.add(mapRowToReview(results));
		}
		return allReviews;
	}

	@Override
	public List<Review> getReviewsForBookId(Long bookId) {
		List<Review> reviews = new ArrayList<>();
		String sqlQuery = "SELECT * FROM review WHERE book_id = ? ORDER BY review_date DESC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, bookId);
		
		while(results.next()) {
			reviews.add(mapRowToReview(results));
		}
		
		return reviews;
	}

	@Override
	public void save(Review review) {
		Long id = getNextId();
		String sqlInsertReview = "INSERT INTO review(review_id, book_id, username, rating, review_title, review_text, review_date) VALUES (?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertReview, id, review.getBookId(), review.getUsername(), review.getRating(), review.getTitle(), review.getText(), review.getDateSubmitted());
		review.setId(id);
	}
	
	private Book mapRowToBook(SqlRowSet row) {
		Book book = new Book();
		book.setBookId(row.getLong("book_id"));
		book.setTitle(row.getString("title"));
		book.setAuthor(row.getString("author"));
		book.setDescription(row.getString("description"));
		book.setImgName(row.getString("img_name"));
		
		return book;
	}
	
	private Review mapRowToReview(SqlRowSet row) {
		Review review = new Review();
		review.setId(row.getLong("review_id"));
		review.setBookId(row.getLong("book_id"));
		review.setUsername(row.getString("username"));
		review.setRating(row.getInt("rating"));
		review.setTitle(row.getString("review_title"));
		review.setText(row.getString("review_text"));
		review.setDateSubmitted(row.getTimestamp("review_date").toLocalDateTime());

		return review;
	}

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_review_id')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}

}
