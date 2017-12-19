package tools;

import Entities.ManaItem;
import Entities.Reb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by CWZZ on 2016/12/20.
 */
public class RebDao {
    public String getNowTime() {
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = df.format(date);
        return time;
    }



    public List<Reb> getRebList(int userID) {
        Connection connection = DataBaseUtil.getConnection();
        List<Reb> rebList = new ArrayList<Reb>();
        String sql = "SELECT * FROM reb_info WHERE userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            //对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Reb reb = new Reb();
                reb.setRebID(rs.getInt("rebID"));
                reb.setContent(rs.getString("content"));
                reb.setCreateTime(rs.getString("createTime"));
                reb.setLastModTime(rs.getString("lastModTime"));
                rebList.add(reb);
            }

            //释放资源
            rs.close();
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return rebList;
    }

    public boolean addReb(int userID, String content) {
        Connection connection = DataBaseUtil.getConnection();
        boolean flag = false;
        try {
            String sql = "insert into reb_info(userID,content,createTime,lastModTime) values(?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setString(2, content);
            String time = getNowTime();
            ps.setString(3, time);
            ps.setString(4, time);
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

    public boolean delReb(int rebID){
        Connection connection = DataBaseUtil.getConnection();
        boolean flag = false;
        try {
            String sql = "DELETE FROM reb_info WHERE rebID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rebID);
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

    public boolean modReb(int rebID,String content){
        Connection connection = DataBaseUtil.getConnection();
        boolean flag = false;
        try {
            String sql = "UPDATE reb_info SET content = ?,lastModTime = ? WHERE rebID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, content);
            String time = getNowTime();
            ps.setString(2, time);
            ps.setInt(3,rebID);
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

    public Reb getOneReb(int rebID){
        Connection connection = DataBaseUtil.getConnection();
        Reb reb = new Reb();
        String sql = "SELECT * FROM reb_info WHERE rebID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            //对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, rebID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                reb.setRebID(rs.getInt("rebID"));
                reb.setContent(rs.getString("content"));
                reb.setCreateTime(rs.getString("createTime"));
                reb.setLastModTime(rs.getString("lastModTime"));
            }

            //释放资源
            rs.close();
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return reb;
    }
}
