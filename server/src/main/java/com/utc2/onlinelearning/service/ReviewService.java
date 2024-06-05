package com.utc2.onlinelearning.service;

import com.utc2.onlinelearning.dto.ReviewRequest;
import com.utc2.onlinelearning.models.Course;
import com.utc2.onlinelearning.models.Review;
import com.utc2.onlinelearning.models.User;
import com.utc2.onlinelearning.repository.CourseRepository;
import com.utc2.onlinelearning.repository.ReviewRepository;
import com.utc2.onlinelearning.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Service
public class ReviewService {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    /**
     * Insert new review.
     * Then, calculate and update AVG rating for course.
     * All in single DB transaction
     *
     * @param request from frontend
     * @param userId  userId
     */
    @Transactional
    public void addCourseRating(ReviewRequest request, Integer userId) {
        User user = userRepository.findById(userId).orElseThrow();
        Course course = courseRepository.findById(request.getCourseId()).orElseThrow();
        Review myReview = new Review(request.getRating(), request.getContent(), user, course);
        reviewRepository.save(myReview);

        //calculate and update average rating for course.
        double avgRating = reviewRepository.getAverageByCourseId(course.getId());
        course.setRating(BigDecimal.valueOf(avgRating).setScale(2, RoundingMode.DOWN));
        courseRepository.save(course);
    }

    /**
     * EDIT existing review, and modify AVG course rating
     */
    @Transactional
    public void updateCourseRating(Integer reviewId, ReviewRequest request) {
        Review myReview = reviewRepository.findById(reviewId).orElseThrow();
        Course course = courseRepository.findById(request.getCourseId()).orElseThrow();
        myReview.setRating(request.getRating());
        myReview.setContent(request.getContent());
        reviewRepository.save(myReview);

        //calculate and update average rating for course.
        double avgRating = reviewRepository.getAverageByCourseId(course.getId());
        course.setRating(BigDecimal.valueOf(avgRating).setScale(2, RoundingMode.DOWN));
        courseRepository.save(course);
    }
}
