package lecture.section1.connection;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Application2 {
 /*Connection 객체를 외부 설정 파일을 이용해서 만들기
 - 보안적인 장점
   - 소스코드에 db 접속 정보가 공개되어 누구든 접속 할 수 있는 상황을 방지
 - 빌드적인 장점
   - 추후 DB 접속 정보가 변경되면 소스코드 변경필요없이 properties 파일을 수정 하면 된다
 */

    // Connection 만들기
    public static void main(String[] args) {
        // Connection : DB 접속을 위한 연결 객체 (Statement 생성하기 위해)
        Connection con = null;
        Properties prop = new Properties();

        try {
            // 외부 설정 파일 읽어오기
            prop.load(new FileReader(
                    "src/main/java/lecture/section2/comfig/db.properties"));

            // 출력
            System.out.println("prop = " + prop);

            // properties 에 있는 값들 꺼내기
            String driver = prop.getProperty("driver");
            String url = prop.getProperty("url");
            String user = prop.getProperty("user");
            String password = prop.getProperty("password");

            // 드라이버 등록
            Class.forName(driver);

            con = DriverManager.getConnection(
                    url,
                    user,
                    password
            );

            // 출력
            System.out.println("con = " + con);

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if(con != null) {
                // JDBC 커넥션 연결 해제
                try {
                    con.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
