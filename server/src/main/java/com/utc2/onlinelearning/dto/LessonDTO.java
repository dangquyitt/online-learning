package com.utc2.onlinelearning.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LessonDTO {
    private String id;
    private String lessonName;
    private Integer position;
    private Boolean isWatched;
    private Integer videoTime;
}
