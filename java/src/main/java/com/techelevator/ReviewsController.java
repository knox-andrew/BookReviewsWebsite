package com.techelevator;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Review;
import com.techelevator.model.ReviewDao;

@Controller
public class ReviewsController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	
	@RequestMapping(path= {"/home", "/"})
	public String displayGreeting(ModelMap modelMap) {	
		modelMap.put("bookList", reviewDao.getAllBooks());
		return "home";
	}
	
	@RequestMapping("/allReviewsPage")
	public String showAllReviews(
			ModelMap modelMap) {
		modelMap.put("bookList", reviewDao.getAllBooks());
		modelMap.put("reviewList", reviewDao.getAllReviews());
		
		return "allReviewsPage";
	}
	
	
	@RequestMapping("/bookDetails")
	public String showBookDetails(
			@RequestParam Long bookId, 
			ModelMap modelMap) {
		
		modelMap.put("book", reviewDao.getBookById(bookId));
		modelMap.put("reviewList", reviewDao.getReviewsForBookId(bookId));
		return "bookDetails";
	}
	
	@RequestMapping("/postReviewInput")
	public String showPostReviewInput(@RequestParam Long bookId, ModelMap modelMap) {
		modelMap.put("book", reviewDao.getBookById(bookId));
		return "postReviewInput";
	}
	
	@PostMapping("/postReviewInput")
	public String processPostReview(
			@RequestParam Long bookId,
			@RequestParam String username,
			@RequestParam int rating,
			@RequestParam String subject,
			@RequestParam String message) {
		
		
		Review newReview = new Review();
		newReview.setBookId(bookId);
		newReview.setUsername(username);
		newReview.setRating(rating);
		newReview.setTitle(subject);
		newReview.setText(message);
		newReview.setDateSubmitted(LocalDateTime.now());
		
		reviewDao.save(newReview);
		
		return "redirect:/allReviewsPage";
	}
}
