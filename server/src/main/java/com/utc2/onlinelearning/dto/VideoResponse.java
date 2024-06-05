package com.utc2.onlinelearning.dto;

import com.utc2.onlinelearning.models.Lesson;
import lombok.Getter;

import javax.validation.constraints.NotNull;

@Getter
public class VideoResponse {
    @NotNull
    private final Long enrollId;
    @NotNull
    private final Lesson lesson;

    public VideoResponse(Long enrollId, Lesson lesson) {
        this.enrollId = enrollId;
        this.lesson = lesson;
    }
}
