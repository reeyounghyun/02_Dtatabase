package lecture.section2.run.c_preparedStatement;

import lecture.section2.model.MenuDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static lecture.section2.common.JDBCTemplate.getConnection;

public class Application1 {
    public static void main(String[] args) {
        // ? : 위치홀더 /    ① SQL에 빈자리 만들기
        String query = "select * from tbl_menu where menu_code = ?";
        try (
                Connection con = getConnection(); // 1. 커넥션 만들기
                PreparedStatement pstmt = con.prepareStatement(query); // 2. PreparedStatement 객    체만들기
                //ResultSet rset = null; // 3. 결과값을 준비
        ) {


            int menuCod = 1; // 검색할 메뉴코드
            pstmt.setInt(1, menuCod); // pstmt 완성함.


            // ③ ?에 사용할 값 전달하기
           ResultSet rset = pstmt.executeQuery();  // 쿼리 실행하고 결과 출력하기

            if (rset.next()) {

                MenuDTO menuDTO = new MenuDTO(
                        rset.getInt("menu_code"),
                        rset.getString("menu_name"),
                        rset.getInt("menu_price"),
                        rset.getInt("category_code"),
                        rset.getString("orderable_status")
                );

                System.out.println(menuDTO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
