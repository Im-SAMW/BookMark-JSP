package com.sam.dao;

import com.sam.model.BookMark;
import com.sam.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author sam
 */
public class ListDao {
    public static List getList(String user){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement psclass = null;
        ResultSet rsclass = null;
        
        
        
        List<BookMark> list = new ArrayList<BookMark>();
        
        try{
            conn = DBUtil.getConn();
//            String sql = "select * from bookmark group by bclass order by bclass asc";
//            ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
            String sqlclass = "select distinct bclass from bookmark where uname=? order by bclass";
            psclass = conn.prepareStatement(sqlclass);
            psclass.setString(1, user);
            rsclass = psclass.executeQuery();
            
            while(rsclass.next()){
                BookMark bm = new BookMark();
                bm.setBid(0);
                bm.setBclass(rsclass.getString("bclass"));
                list.add(bm);
                
                String sql = "select * from bookmark where bclass=? and uname=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, bm.getBclass());
                ps.setString(2, user);
                rs = ps.executeQuery();
                
                while(rs.next()){
                    BookMark bookmark = new BookMark();
                    bookmark.setBid(Integer.parseInt(rs.getString("bid")));
                    bookmark.setBname(rs.getString("bname"));
                    bookmark.setBurl(rs.getString("burl"));
                    bookmark.setBclass(rs.getString("bclass"));
                    list.add(bookmark);
                }
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
    
    public static List getSearchEdit(String bid,String user){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        
        List<BookMark> list = new ArrayList<BookMark>();
        try{
            conn = DBUtil.getConn();
            String sql = "select * from bookmark where bid=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while(rs.next()){
                BookMark bookmark = new BookMark();
                bookmark.setBid(Integer.parseInt(rs.getString("bid")));
                bookmark.setBname(rs.getString("bname"));
                bookmark.setBurl(rs.getString("burl"));
                bookmark.setBclass(rs.getString("bclass"));
                list.add(bookmark);
            }
            
            sql = "select distinct bclass from bookmark where uname=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while(rs.next()){
                BookMark bookmark = new BookMark();
                bookmark.setBid(0);
                bookmark.setBclass(rs.getString("bclass"));
                list.add(bookmark);
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
    
    public static boolean addBookMark(BookMark bm,String user){
        Connection conn = null;
        PreparedStatement ps = null;
        Integer n = 0;
        
        try {
            conn = DBUtil.getConn();
            String sql = "insert into bookmark(bname,burl,bclass,uname) values(?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, bm.getBname());
            ps.setString(2, bm.getBurl());
            ps.setString(3, bm.getBclass());
            ps.setString(4, user);
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
    
    public static boolean delBookMark(String bid){
        Connection conn = null;
        PreparedStatement ps = null;
        Integer n = 0;
        
        try {
            conn = DBUtil.getConn();
            String sql = "delete from bookmark where bid=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
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
    
    public static boolean editBookMark(BookMark bm){
        Connection conn = null;
        PreparedStatement ps = null;
        Integer n = 0;
        
        try {
            conn = DBUtil.getConn();
            String sql = "update bookmark set bname=?, burl=?, bclass=? where bid=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, bm.getBname());
            ps.setString(2, bm.getBurl());
            ps.setString(3, bm.getBclass());
            ps.setString(4, bm.getBid().toString());
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
    
    public static List<String> getSearchClass(String user) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
                
        List<String> list = new ArrayList<String>();;
        
        try{
            conn = DBUtil.getConn();
            String sql = "select distinct bclass from bookmark where uname=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(rs.getString("bclass"));
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
     
    public static void main(String[] args) throws Exception {
        List<Map<String,String>> list = ListDao.getList("123123");
        for (Map<String, String> m:list)  
        {  
            for (String k : m.keySet())  
            {  
                System.out.println(k + " : " + m.get(k));  
            }  
        } 
        
    }

    public static List<BookMark> getSearchBookMark(String search,String user) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<BookMark> list = new ArrayList<BookMark>();
        try{
            conn = DBUtil.getConn();
            String sql = "select * from bookmark where (bname like ? or burl like ? or bclass like ?) and uname=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+search+"%");
            ps.setString(2, "%"+search+"%");
            ps.setString(3, "%"+search+"%");
            ps.setString(4, user);
            rs = ps.executeQuery();
            while(rs.next()){
                BookMark bookmark = new BookMark();
                bookmark.setBid(Integer.parseInt(rs.getString("bid")));
                bookmark.setBname(rs.getString("bname"));
                bookmark.setBurl(rs.getString("burl"));
                bookmark.setBclass(rs.getString("bclass"));
                list.add(bookmark);
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
}
