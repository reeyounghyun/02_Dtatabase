package lecture.section2.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

// DB 연결 생성과 JDBC 자원 반납을 처리하는 클래스
public class JDBCTemplate {

    // 반환
    public static Connection getConnection() {
        Connection con = null;
        Properties prop = new Properties();

        try {
            // 파일을 읽어오는것!
            // properties.load() : 읽어온 파일을 key value로 분리해서저장
            prop.load(new FileReader(
                    "src/main/java/lecture/section2/comfig/db.properties"));


            System.out.println("설정 파일을 읽어왔습니다...");

            String driver = prop.getProperty("driver");
            String url = prop.getProperty("url");
            String user = prop.getProperty("user");
            String password = prop.getProperty("password");

            Class.forName(driver); // Driver Loading : JDBC 드라이버를 준비

            // 커넥션 생성 : DB 접근 권한을 가지게됨.
            con = DriverManager.getConnection(
                    url,
                    prop
            );

            System.out.println("커넥션 생성이 완료되었습니다.");

        } catch (ClassNotFoundException | SQLException | IOException e) {
            e.printStackTrace();
        }

        return con;
    }

    // 커넥션 닫기
    public static void close(Connection con) {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Statement stmt) {
        try {
            if (stmt != null && !stmt.isClosed()) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(ResultSet rest) {
        try {
            if (rest != null && !rest.isClosed()) {
                rest.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
