package com.sam.dao;

import com.sam.model.User;
import com.sam.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author sam
 */
public class RegisterDao {
    public boolean register(User user) {
        Connection conn = null;
        PreparedStatement ps = null;
        Integer n = null;
        
        try{
            conn = DBUtil.getConn();
            String sql = "insert into user(uname,upass,uemail) values(?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUname());
            ps.setString(2, user.getUpass());
            ps.setString(3, user.getUemail());
            n = ps.executeUpdate();
            if(n > 0){
                return true;
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            try{
                ps.close();
                DBUtil.close(conn);
                
            }catch(SQLException e){
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
