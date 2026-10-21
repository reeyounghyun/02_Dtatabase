package run.section04.selsct;

import model.dto.MenuCategory;
import model.dto.MenuDTO3;

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
         * 메뉴를 조회하는데, 메뉴 번호를 입력받고
         * 해당 메뉴 이름, 가격, 카테고리 이름, 주문가능 여부를 출력한다.
         *
         * model DTO를 추가 생성
         * (MenuDTO2 와 CategoryDTO 생성 필요)
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
            String query = prop.getProperty("findMenuWithCategory");  // 메뉴 조회
            System.out.print("조회할 메뉴 번호: ");
            int menuCode = Integer.parseInt(sc.nextLine());

            pstmt = con.prepareStatement(query);   // 45: SQL 준비
            pstmt.setInt(1, menuCode);  // 46: 빈칸 채우기
            rset = pstmt.executeQuery();  // 47: 실행


            if (rset.next()) {
                // 값 꺼내오기
                System.out.println("메뉴 번호: " + rset.getInt("menu_code")); // 결과에서 menu_code 컬럼을 숫자로 꺼내기
                System.out.println("메뉴 이름: " + rset.getString("menu_name")); // 결과에서 menu_name 컬럼을 글자로 꺼내기
                System.out.println("메뉴 가격: " + rset.getInt("menu_price"));
                System.out.println("카테고리: " + rset.getString("category_name"));
            } else {
                System.out.println("해당 메뉴가 없습니다.");
                return;
            }

            // 조회 결과에 행이 있으면 (= 해당 메뉴가 존재하면)
            if (rset.next()) {

                // 1. 카테고리 정보를 담을 그릇(DTO) 만들기
                MenuCategory category = new MenuCategory();
                category.setCategoryName(rset.getString("category_name"));  // 결과에서 category_name 컬럼을 글자로 꺼내 카테고리 이름에 담기

                // 2. 메뉴 정보를 담을 그릇(DTO) 만들기
                MenuDTO3 menu = new MenuDTO3();
                menu.setName(rset.getString("menu_name"));                   // 결과에서 menu_name 컬럼을 글자로 꺼내 메뉴 이름에 담기
                menu.setPrice(rset.getInt("menu_price"));                    // 결과에서 menu_price 컬럼을 숫자로 꺼내 메뉴 가격에 담기
                menu.setCategory(category);                                  // 위에서 만든 카테고리 DTO를 메뉴 DTO 안에 통째로 넣기
                menu.setOrderableStatus(rset.getString("orderable_status")); // 결과에서 orderable_status 컬럼을 글자로 꺼내 주문 가능 여부에 담기

                // 3. 메뉴 정보 출력 (Lombok @ToString이 만든 형식으로 출력됨)
                System.out.println(menu);

            } else {  // 조회 결과에 행이 없으면 (= 없는 메뉴 번호)
                System.out.println("해당 메뉴가 없습니다.");
            }

        } catch (IOException e) {   // ← try 끝 + catch 시작
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

