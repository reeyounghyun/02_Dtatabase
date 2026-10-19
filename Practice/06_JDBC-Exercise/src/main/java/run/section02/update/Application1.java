package run.section02.update;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.Scanner;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

public class Application1 {
    public static void main(String[] args) {
        /*
         * 1. 메뉴 변경하기
         * 변경할 메뉴 번호를 입력받고
         *
         * 해당 메뉴의 변경사항을 입력받는다.
         * (메뉴이름, 메뉴가격)
         * 메뉴를 변경한다.
         *
         * 2. 변경할 메뉴 번호를 입력하면 현재 메뉴 정보가 보이고 메뉴의 변경사항을 입력받는다.
         * */

        Scanner sc = new Scanner(System.in);

        // DB와 연결
        Connection con = getConnection();


        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Properties prop = new Properties();

        try {
            // XML에서 SQL 읽기
            prop.loadFromXML(
                    new FileInputStream("src/main/java/mapper/menu_query.xml")
            );

            // 변경할 메뉴 정보를 알기위해 조회
            String query = prop.getProperty("findMenuByCode");  // 메뉴 조회
            System.out.print("변경할 메뉴 번호: ");
            int menuCode = Integer.parseInt(sc.nextLine());

            pstmt = con.prepareStatement(query);   // 45: SQL 준비
            pstmt.setInt(1, menuCode);  // 46: 빈칸 채우기
            rset = pstmt.executeQuery();  // 47: 실행


            if (rset.next()) {
                // 값 꺼내오기
                System.out.println("메뉴 번호: " + rset.getInt("menu_code")); // 결과에서 menu_code 컬럼을 숫자로 꺼내기
                System.out.println("메뉴 이름: " + rset.getString("menu_name")); // 결과에서 menu_name 컬럼을 글자로 꺼내기
                System.out.println("메뉴 가격: " + rset.getInt("menu_price"));
            } else {
                System.out.println("해당 메뉴가 없습니다.");
                return;
            }

            close(rset);
            close(pstmt);

            // 메뉴 수정하기
            // 변경할 내용 입력받기
            System.out.print("변경할 메뉴 이름: ");
            String menuName = sc.nextLine();

            System.out.print("변경할 메뉴 가격: ");
            int menuPrice = sc.nextInt();


            query = prop.getProperty("changeMenu");  // 메뉴 변경

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, menuName);
            pstmt.setInt(2, menuPrice);
            pstmt.setInt(3, menuCode);


            int result = pstmt.executeUpdate();

            System.out.println("변경된 행 수: " + result);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
            close(con);
        }
    }
}
