package tools;

import Entities.Manager;
import Entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by CWZZ on 2016/11/25.
 */
public class UserDao {
    public boolean userIsExist(String username) {
        Connection connection = DataBaseUtil.getConnection();
        String sql = "select * from user_info where username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                //如果无效则证明此用户名可用
                return true;
            }
            //释放此ResultSet对象的数据库和jdbc资源
            rs.close();
            //释放此PreparedStatement对象的数据库和jdbc资源
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            //关闭数据库连接
            DataBaseUtil.closeConnection(connection);
        }
        return false;
    }

    public void saveUser(User user) {
        Connection connection = DataBaseUtil.getConnection();
        String sql = "insert into user_info(username,password,sex,email) values(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            //对SQL语句的占位符参数进行动态赋值
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getSex());
            ps.setString(4, user.getEmail());
            //执行更新操作
            ps.executeUpdate();
            //释放资源
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
    }

    public User login(String username, String password) {
        User user = null;
        Connection connection = DataBaseUtil.getConnection();
        if (connection == null) {
            System.out.println("连接为空！\n");
        }
        String sql = "select * from user_info where username = ? and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getInt("userID"));
                user.setSex(rs.getString("sex"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
            rs.close();
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return user;
    }

    public boolean rePwd(int userID,String repassword){
        Connection connection = DataBaseUtil.getConnection();
        boolean flag = false;
        try {
            String sql = "UPDATE user_info SET password = ? WHERE userID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, repassword);
            ps.setInt(2, userID);
            ps.executeUpdate();
            flag = true;
            //释放资源
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return flag;
    }

    public boolean reSex(int userID,String resex){
        Connection connection = DataBaseUtil.getConnection();
        boolean flag = false;
        try {
            String sql = "UPDATE user_info SET sex = ? WHERE userID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, resex);
            ps.setInt(2, userID);
            ps.executeUpdate();
            flag = true;
            //释放资源
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return flag;
    }


}
