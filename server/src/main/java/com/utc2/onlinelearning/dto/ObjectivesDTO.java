package com.utc2.onlinelearning.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;

@Getter
@RequiredArgsConstructor
public class ObjectivesDTO {
    @NotNull
    private Integer courseId;
    @NotEmpty
    private ArrayList<String> objectives;


}
