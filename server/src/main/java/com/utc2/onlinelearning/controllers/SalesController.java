package com.utc2.onlinelearning.controllers;

import com.utc2.onlinelearning.dto.OrderItemDTO;
import com.utc2.onlinelearning.dto.SalesDTO;
import com.utc2.onlinelearning.repository.OrderItemRepository;
import com.utc2.onlinelearning.repository.SalesRepository;
import com.utc2.onlinelearning.service.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;

@RestController
@RequestMapping(path = "/sales", produces = MediaType.APPLICATION_JSON_VALUE)
public class SalesController {

    @Autowired
    private SalesRepository salesRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @GetMapping(path = "/mine")
    public Slice<SalesDTO> getAllMyOwnedItems(@NotNull HttpSession session, @RequestParam(defaultValue = "0") Integer page) {
        Integer userId = MyUserDetailsService.getSessionUserId(session);
        Pageable pageable = PageRequest.of(page, 10, Sort.Direction.DESC, "createdAt");
        return salesRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable);
    }

    @GetMapping(path = "/mine/{transactionId}")
    public Slice<OrderItemDTO> getItemsbyTransactionId(@PathVariable String transactionId,
                                                       @RequestParam(defaultValue = "0") Integer page) {
        return orderItemRepository.findByTransactionIdEquals(transactionId, PageRequest.of(page, 10));
    }

}
