package com.sam.dao;

import com.sam.model.User;
import com.sam.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sam
 */
public class UserDao {
    public Integer login(User user) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            conn = DBUtil.getConn();
            String sql = "select * from user where uname= ? and upass= ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUname());
            ps.setString(2, user.getUpass());
            rs = ps.executeQuery();
            if(rs.next()){
                return Integer.parseInt(rs.getString("uadmin"));
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            try{
                rs.close();
                ps.close();
                DBUtil.close(conn);
                
            }catch(SQLException e){
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //return false;
        return 0;//test use
    }
    
    public static List getAllUser(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<User> list = new ArrayList<User>();;
        
        try{
            conn = DBUtil.getConn();
            String sql = "select * from user where uadmin != 1";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUid(Integer.parseInt(rs.getString("uid")));
                user.setUname(rs.getString("uname"));
                user.setUpass(rs.getString("upass"));
                user.setUemail(rs.getString("uemail"));
                
                list.add(user);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            try{
                rs.close();
                ps.close();
                DBUtil.close(conn);
            }catch(SQLException e){
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    
    public static List getSearchEdit(String uid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<User> list = new ArrayList<User>();
        
        try{
            conn = DBUtil.getConn();
            String sql = "select * from user where uid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, uid);
            rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUid(Integer.parseInt(rs.getString("uid")));
                user.setUname(rs.getString("uname"));
                user.setUpass(rs.getString("upass"));
                user.setUemail(rs.getString("uemail"));
                
                list.add(user);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            try{
                rs.close();
                ps.close();
                DBUtil.close(conn);
            }catch(SQLException e){
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }
        
    public static boolean editUser(User user){
        Connection conn = null;
        PreparedStatement ps = null;
        Integer n = 0;
        
        try {
            conn = DBUtil.getConn();
            String sql = "update user set uname=?, upass=?, uemail=? where uid=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUname());
            ps.setString(2, user.getUpass());
            ps.setString(3, user.getUemail());
            ps.setString(4, user.getUid().toString());
            n = ps.executeUpdate();
            if(n > 0){
                return true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
    
    public static boolean delUser(String uid) {
        Connection conn = null;
        PreparedStatement ps = null;
        Integer n = 0;
        
        try {
            conn = DBUtil.getConn();
            String sql = "delete from user where uid=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, uid);
            n = ps.executeUpdate();
            if(n > 0){
                return true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
