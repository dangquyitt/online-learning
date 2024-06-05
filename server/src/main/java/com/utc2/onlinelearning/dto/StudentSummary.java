package com.utc2.onlinelearning.dto;

import com.utc2.onlinelearning.models.SummaryTitle;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.io.Serializable;

@Getter
@AllArgsConstructor
public class StudentSummary implements Serializable {
    private static final long serialVersionUID = -6556685957514582951L;
    private SummaryTitle title;
    private Long value;
    private String subtitle;
}
