package com.utc2.onlinelearning.repository;

import com.utc2.onlinelearning.dto.SalesDTO;
import com.utc2.onlinelearning.models.Sales;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.Instant;

@Repository
public interface SalesRepository extends CrudRepository<Sales, String> {

    Slice<Sales> findByCreatedAtBetween(Instant createdAtStart, Instant createdAtEnd);

    @Query("SELECT new com.utc2.onlinelearning.dto.SalesDTO(s.transactionId,s.createdAt, s.paymentMethod, s.totalPaid, count(o)) " +
            "FROM Sales s JOIN OrderItem o ON s.transactionId = o.sale.transactionId WHERE s.user.id = ?1 GROUP BY s.transactionId")
    Slice<SalesDTO> findByUserIdOrderByCreatedAtDesc(Integer userId, Pageable pageable);


}
