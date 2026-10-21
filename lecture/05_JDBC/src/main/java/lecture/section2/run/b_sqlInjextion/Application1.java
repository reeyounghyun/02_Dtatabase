package lecture.section2.run.b_sqlInjextion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static lecture.section2.common.JDBCTemplate.close;
import static lecture.section2.common.JDBCTemplate.getConnection;

public class Application1 {
    private static String menuName = "한우딸기국밥";
    private static String orderableStatus = "Y";


    public static void main(String[] args) {
        /*
         * 1. 커넥스 생성
         *
         * 2. Statement 생성
         * 3. ResultSet 생성
         * 4. 쿼리 작성(menu name과 주문가능여부를 확인하는 쿼리)
         * 5. Strtemnt를 이용해서 쿼리 실행
         * 6. ResultSet을 이용해서 결과 읽기
         * */

        // 1. 커넥스 생성
        Connection con = getConnection();

        // 2. Statement 생성
        Statement stmt = null;

        // 3. ResultSet 생성
        ResultSet rest = null;

        // 4. 쿼리 작성(menu name과 주문가능여부를 확인하는 쿼리)
        String query =
                "select * from tbl_menu where menu_name = '"
                        + menuName
                        + "' and orderable_status = '" + orderableStatus + "'";

        // query 출력 (중간점검)
        System.out.println(query);

        // 5. Strtemnt를 이용해서 쿼리 실행
        try {
            stmt = con.createStatement();  // Connection으로
            rest = stmt.executeQuery(query);

            // 6. ResultSet에서 결과를 꺼내기 (가공)
            if (rest.next()) {
                System.out.println(rest.getString("menu_name") + " 메뉴는 주문 가능합니다.");
            } else {
                System.out.println(" 주문 가능한 메뉴가 아닙니다.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // 닫는 순서 중요함.
            close(rest);
            close(stmt);
            close(con);
        }

    }
}
