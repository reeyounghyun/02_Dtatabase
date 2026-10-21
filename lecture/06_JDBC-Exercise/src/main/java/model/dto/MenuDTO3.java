package model.dto;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO3 {

    private int code;
    private String name;
    private int price;
    private MenuCategory category;
    private String orderableStatus;
}

