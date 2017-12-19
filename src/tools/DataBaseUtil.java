package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by CWZZ on 2016/11/25.
 */
public class DataBaseUtil {

    /**
     * 获取数据库连接
     *
     * @return Connection 对象
     */
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bwl";
            connection = DriverManager.getConnection(url, "root", "719800");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return connection;
    }

    /**
     * 关闭数据库
     * @param connection
     */
    public static void closeConnection(Connection connection) {
        //判断connection是否为空
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }


}
