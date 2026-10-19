package lecture.section2.run.a_statement;

import lecture.section2.common.JDBCTemplate;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Application1 {
    public static void main(String[] args) {
        Connection Con = JDBCTemplate.getConnection();

        // 완성된 SQL 문자열을 실행
//        Statement stmt = null;

        // SQL의 결과를 행단위로 읽음
//        ResultSet rset = null;

        try {
            Statement stmt = Con.createStatement();

            String sql ="select menu_code,menu_name from tbl_menu"; // sql 문자열
            ResultSet rset = stmt.executeQuery(sql);  // sql을 실행시킨 결과물을 담기

            // 다음 값이 있는지 확인 rset.next()
            while (rset.next()) {
                System.out.println(rset.getInt("menu_code")); // 정수형 데이터
                System.out.println(rset.getString("menu_name")); // 문자형 데이터
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
