package run.section03.delete;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

public class Application1 {
    public static void main(String[] args) {
        /*
         * 전체 메뉴를 보여주고,
         * 삭제할 메뉴의 번호를 입력받는다.
         * 삭제한다.
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

            close(rset); //조회 결과 표 (ResultSet)
            close(pstmt); //준비해 둔 SQL 실행 도구 (PreparedStatement)


            // 메뉴 삭제하기
            // 변경할 내용 입력받기
            // 삭제 시엔 이름·가격 입력 대신 확인을 받음
            System.out.print("정말 삭제하시겠습니까? (Y/N): ");
            String answer = sc.nextLine();

            if (!answer.equalsIgnoreCase("Y")) {
                System.out.println("삭제를 취소했습니다.");
                return;
            }


            query = prop.getProperty("deleteMenu");  // 메뉴 삭제

            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, menuCode);
            int result = pstmt.executeUpdate();

            if (result > 0) {
                System.out.println("메뉴가 삭제되었습니다.");
            } else {
                System.out.println("메뉴 삭제에 실패했습니다.");
            }

        } catch (IOException e) {            // XML 파일 읽기 실패
            e.printStackTrace();
        } catch (SQLException e) {           // SQL 실행 실패
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
            close(con);
        }

        }
}

