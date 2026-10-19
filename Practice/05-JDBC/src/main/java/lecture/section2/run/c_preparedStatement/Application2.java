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

public class Application2 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);


        // Q. 최대 최소 메뉴 가격 범위에서 판매여부에 따라 조회
        System.out.println("최소 가격을 입력해주세요.");
        int minPrice = Integer.parseInt(sc.nextLine());
        System.out.println("최대 가격을 입력해주세요.");
        int maxPrice = Integer.parseInt(sc.nextLine());
        System.out.println("판매여부를 입력해주세요.");
        String orderableStatus = sc.nextLine();

        // ? : 위치홀더 /  ① SQL에 빈자리 만들기
        String query = "select * from tbl_menu where menu_Price between ? and ? and  orderable_status = ?";

        // 결과를 저장할 DTO List
        List<MenuDTO> menuList = new ArrayList<>();


        try (
                Connection con = getConnection(); // 1. 커넥션 만들기
                PreparedStatement pstmt = con.prepareStatement(query); // 2. PreparedStatement 객체만들기
        ) {

            // SQL에 ? 값을 순서대로 추가
            // ? 위치홀더의 인덱스는 1부터 시작한다.
            pstmt.setInt(1, minPrice); // pstmt 완성함.
            pstmt.setInt(2, maxPrice); // pstmt 완성함.
            pstmt.setString(3, orderableStatus); // pstmt 완성함.
            //빈자리에 들어갈 데이터   ====    ? and = (minPrice) / ?and  = (maxPrice)   orderable_status = ?";


            //ResultSet rset = pstmt.executeQuery(); // 3. 결과값을 준비
            // ③ ?에 사용할 값 전달하기
            // 쿼리 실행하고 결과 출력하기
            try (ResultSet rset = pstmt.executeQuery()) {
                while (rset.next()) {
                    menuList.add(new MenuDTO(
                            rset.getInt("menu_code"),
                            rset.getString("menu_name"),
                            rset.getInt("menu_price"),
                            rset.getInt("category_code"),
                            rset.getString("orderable_status")
                    ));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (menuList.isEmpty()) {
            System.out.println("조건에 맞는 메뉴가 없습니다.");
        } else {
            for (MenuDTO menu : menuList) {
                System.out.println(menu);
            }
        }
    }
}
