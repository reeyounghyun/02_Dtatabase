package lecture.section2.run.a_statement;

import com.mysql.cj.protocol.Resultset;
import lecture.section2.common.JDBCTemplate;
import lecture.section2.model.MenuDTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Application2 {
    public static void main(String[] args) {

        MenuDTO menuDTO = null;
//        MenuDTO menuDTO2 = new MenuDTO(1,"bear",1000, 1, "Y");
//        menuDTO2.getName();
//        menuDTO2.getOrderableStatus();
//        menuDTO2.setName("안녕");
//        System.out.println("menuDTO2 = " + menuDTO2);
        Connection con = JDBCTemplate.getConnection(); // 1. 커넥션 생성

        // Statement : 완성된 SQL 문자열을 실행
        Statement stmt = null;  // 2. Statment 생성 (쿼리실행용)

        // ResultSet : SQL의 결과를 행단위로 읽음
        ResultSet rset = null; // 3. ResultSet 생성 (결과받을용)


        Scanner sc = new Scanner(System.in);
        System.out.print("조회할 메뉴 코드를 입력하세요 : "); // 5
        String menuCode = sc.nextLine();

        try {
            stmt = con.createStatement();


            // select * from tbl_menu where menu_code = 5
            String sql =
                    "select * from tbl_menu where menu_code = '" +
                            menuCode + "'"; // 4. 쿼리작성

            // 5. 쿼리 실행 (Statement) 결과는 ResultSet으로 받음
            rset = stmt.executeQuery(sql); // sql을 실행시킨 결과물을 ResultSet에 담기

            // 6. 실행결과를 꺼내서 가공
            while (rset.next()){

                menuDTO = new MenuDTO(
                        rset.getInt("menu_code"), // 메뉴코드
                        rset.getString("menu_name"), // 메뉴이름
                        rset.getInt("menu_price"), // 메뉴가격
                        rset.getInt("category_code"), // 카테고리코드
                        rset.getString("orderable_status") // 주문 가능 상태
                );
            }
            System.out.println(menuDTO);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}