package com.utc2.onlinelearning.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * NOT A TABLE.
 * This is the payload sent from Frontend at Checkout
 */
@Getter
@ToString
@EqualsAndHashCode
public class CheckoutRequest {
    @NotEmpty
    private String nonce;

    @NotNull
    @Min(1)
    private BigDecimal totalAmount;

    @NotEmpty
    private String paymentMethod;
    // "ApplePayCard" | "CreditCard" | "AndroidPayCard" | "PayPalAccount" | "VenmoAccount"

    public CheckoutRequest() {
    }

}
