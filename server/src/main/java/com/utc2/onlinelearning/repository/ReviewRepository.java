package com.utc2.onlinelearning.repository;

import com.utc2.onlinelearning.dto.ReviewDTO;
import com.utc2.onlinelearning.models.Review;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ReviewRepository extends PagingAndSortingRepository<Review, Integer> {

    @Query("SELECT r FROM Review r WHERE r.user.id = ?1 AND r.course.id = ?2")
    Optional<Review> findByUserIdAndCourseId(Integer userId, Integer courseId);

    @Query("SELECT new com.utc2.onlinelearning.dto.ReviewDTO(r.id, r.content, r.rating, r.updatedAt, u.fullname) " +
            "FROM Review r INNER JOIN User u on r.user.id = u.id WHERE r.course.id = ?1")
    Slice<ReviewDTO> findByCourseId(Integer courseId, Pageable pageable);

    @Query(value = "SELECT AVG(r.rating) from Review r where r.course.id = ?1")
    double getAverageByCourseId(Integer courseId);

}