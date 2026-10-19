package run.section01.insert;

import model.dto.MenuDTO;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

public class Application2 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("메뉴의 이름을 입력해주세요 : ");
        String menuName = sc.nextLine();

        System.out.print("메뉴 가격을 입력하세요 : ");
        int menuPrice = sc.nextInt();

        System.out.print("카테고리 코드를 입력하세요 : ");
        int categoryCode = sc.nextInt();

        System.out.print("판매 여부를 결정해주세요(Y/N) : ");
        sc.nextLine();
        String orderableStatus = sc.nextLine().toUpperCase();

        MenuDTO newMenu = new MenuDTO();
        newMenu.setName(menuName);
        newMenu.setPrice(menuPrice);
        newMenu.setCategoryName(categoryCode);
        newMenu.setOrderableStatus(orderableStatus);

        // MenuDTO 형태로 전달 받음
        Connection con = getConnection();
        PreparedStatement pstmt = null;

        Properties prop = new Properties();

        // 결과
        int result;

        try{
            // Query문 작성된 XML읽기
            prop.loadFromXML(new FileInputStream("src/main/java/mapper/menu_query.xml"));
            System.out.println("prop = " + prop);

            // 키값으로 쿼리꺼내기
            String query = prop.getProperty("insertMenu");

            //prepareStatement 객체 생성
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, newMenu.getName());
            pstmt.setInt(2, newMenu.getPrice());
            pstmt.setInt(3, newMenu.getCategoryName());
            pstmt.setString(4, newMenu.getOrderableStatus());

            /*
            * executeQuery() : select 문에 사용 결과를 resultset으로 반환
            * executeUpdate () :  INSERT, UPDATE,DELETE 문에 사용 -> 쿼리에 영향받은 행의 수를 반환
            * */
           // pstmt.executeQuery();
           result = pstmt.executeUpdate();

        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
            close(con);
        }
        System.out.println("result = " + result);
    }
}
