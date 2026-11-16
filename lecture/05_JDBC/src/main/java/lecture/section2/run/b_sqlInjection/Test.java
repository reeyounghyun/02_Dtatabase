//package lecture.section2.run.b_sqlInjection;
//
//import lecture.section2.common.JDBCTemplate;
//
//import java.sql.Connection;
//import java.sql.SQLException;
//
//
//public class Test {
//    public static void main(String[] args) {
//        Connection con = JDBCTemplate.getConnection();
//        try (con) {
//
//            System.out.println("con 상태 : " + con.isClosed());
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//        try {
//            System.out.println("con 상태 : " + con.isClosed());
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//}
