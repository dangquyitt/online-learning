package com.utc2.onlinelearning.repository;

import com.utc2.onlinelearning.dto.OrderItemDTO;
import com.utc2.onlinelearning.models.OrderItem;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends CrudRepository<OrderItem, Long> {

    @Query("SELECT new com.utc2.onlinelearning.dto.OrderItemDTO(o.id, c.title, c.price) from OrderItem o " +
            "INNER JOIN Course c on o.course.id = c.id where o.sale.transactionId = ?1")
    Slice<OrderItemDTO> findByTransactionIdEquals(String transactionId, Pageable pageable);


}
