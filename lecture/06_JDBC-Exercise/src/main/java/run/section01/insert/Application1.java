package run.section01.insert;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static java.lang.System.getProperty;

public class Application1 {
    public static void main(String[] args) {

        Connection cont = getConnection();
        System.out.println("cont =" + cont);

        Connection con = getConnection();
        PreparedStatement pstmt = null;

        Properties prop = new Properties();

        // 결과
        int result;

        try{
            // Query문 작성된 XML읽기
            prop.loadFromXML(new FileInputStream("src/main/java/mapper/menu-query.xml"));
            System.out.println("prop = " + prop);

            // 키값으로 쿼리꺼내기
            String query = prop.getProperty("insertMenu");

            //prepareStatement 객체 생성
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, "봉골레청국장");
            pstmt.setInt(2, 50000);
            pstmt.setInt(3, 1);
            pstmt.setString(4, "Y");

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
