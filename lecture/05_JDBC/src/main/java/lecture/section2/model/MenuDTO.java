package lecture.section2.model;

import lombok.*;

// tbl_menu의 현행의 계층간 전달하기 위한 데이터 객체
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MenuDTO {
    private int code;
    private String name;
    private int price;
    private int categoryCode;
    private String orderableStatus;



}
