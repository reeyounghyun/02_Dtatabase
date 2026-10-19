package model.dto;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class MenuDTO {

    private int code;
    private String name;
    private int price;
    private int categoryName;
    private String orderableStatus;

}
