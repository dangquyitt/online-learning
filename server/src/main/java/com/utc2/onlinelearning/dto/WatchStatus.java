package com.utc2.onlinelearning.dto;

import lombok.Getter;

import javax.validation.constraints.NotNull;

/**
 * This is for updating watchStatus on currentLessonId, and requesting next lesson
 */
@Getter
public class WatchStatus {
    @NotNull
    private Long enrollId;
    @NotNull
    private String currentLessonId;
    @NotNull
    private Integer courseId;

    public WatchStatus() {
    }
}
