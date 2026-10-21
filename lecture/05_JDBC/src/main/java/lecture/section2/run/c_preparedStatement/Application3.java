package lecture.section2.run.c_preparedStatement;

import lecture.section2.model.MenuDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import static lecture.section2.common.JDBCTemplate.getConnection;

public class Application3 {
    public static void main(String[] args) {

        /*
         * 문제??
         * 사용자에게 문자열을 입력받고, 해당 문자열이 포함된 메뉴 목록을 출력하는 프로그램
         * LIKE 이용
         * */
        // 1. 사용자에게 문자열을 입력받아
        // 해당 문자열이 포함된 메뉴 목록 조회 (LIKE)
        Scanner sc = new Scanner(System.in);

        System.out.println("검색할 메뉴 이름을 입력하세요:");

        // [추가] 안내 문구만 출력하는 것이 아니라 실제 입력받기
        String keyword = sc.nextLine();

        //  메뉴 이름에 입력한 문자열이 포함되는지 검색
        String query =
                "select * from tbl_menu " +
                        "where menu_name like concat('%', ?, '%')";

        // 조회한 여러 메뉴를 모아 둘 리스트
        List<MenuDTO> menuList = new ArrayList<>();

        // DB에 연결하고 SQL 실행 도구를 준비한 뒤, 사용이 끝나면 자동으로 닫아 주는 코드
        try (
                Connection con = getConnection(); // 커넥션 만들기
                PreparedStatement pstmt = con.prepareStatement(query); // PreparedStatement 객체만들기

        ) {
            // 숫자 3 대신 입력한 문자열을 첫 번째 ?에 전달
            pstmt.setString(1, keyword);

            // 조회 결과도 사용이 끝나면 자동으로 닫기
            try (ResultSet rset = pstmt.executeQuery()) {
                while (rset.next()) {

                    // 이름만 바로 출력하던 코드를
                    // 메뉴 객체를 만들어 리스트에 추가하는 코드로 변경
                    menuList.add(new MenuDTO(
                            rset.getInt("menu_code"),
                            rset.getString("menu_name"),
                            rset.getInt("menu_price"),
                            rset.getInt("category_code"),
                            rset.getString("orderable_status")
                    ));
                }
            }
        } catch (SQLException e) {  // DB 관련 예외 처리
            e.printStackTrace();
        }

        // [추가] 리스트에 모인 메뉴들을 하나씩 출력
        if (menuList.isEmpty()) {
            System.out.println("검색된 메뉴가 없습니다.");
        } else {
            for (MenuDTO menu : menuList) {
                System.out.println("menu = " + menu);
            }
        }
    }
}
