package model.dto;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MenuCategory {

    private int categoryCode;
    private String categoryName;
    private int refCategoryCode;

}

