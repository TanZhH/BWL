package tools;

import Entities.ManaItem;
import Entities.Manager;
import Entities.Reb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by CWZZ on 2016/12/21.
 */
public class ManaDao {
    public List<ManaItem> getManagerRebs(){
        Connection connection = DataBaseUtil.getConnection();
        List<ManaItem> ManaList = new ArrayList<ManaItem>();
        String sql = "SELECT * FROM reb_info";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            //对SQL语句的占位符参数进行动态赋值
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ManaItem manaItem = new ManaItem();
                Reb reb = new Reb();
                reb.setRebID(rs.getInt("rebID"));
                reb.setContent(rs.getString("content"));
                reb.setCreateTime(rs.getString("createTime"));
                reb.setLastModTime(rs.getString("lastModTime"));
                manaItem.setUserID(rs.getInt("userID"));
                manaItem.setReb(reb);
                ManaList.add(manaItem);
            }

            //释放资源
            rs.close();
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return ManaList;
    }

    public Manager manalogin(String manaNAME, String manaPWD){
        Manager manager = null;
        Connection connection = DataBaseUtil.getConnection();
        String sql = "select * from mana_info where manaNAME = ? and manaPWD = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, manaNAME);
            ps.setString(2, manaPWD);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                manager = new Manager();
                manager.setManaID(rs.getInt("manaID"));
                manager.setManaNAME(rs.getString("manaNAME"));
            }
            rs.close();
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return manager;
    }

    public String findPWD(String username){
        Connection connection = DataBaseUtil.getConnection();
        String password = null;
        String sql = "select password from user_info where username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                password = rs.getString("password");
            }
            rs.close();
            ps.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            DataBaseUtil.closeConnection(connection);
        }
        return password;
    }


}
