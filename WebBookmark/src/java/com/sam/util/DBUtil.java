package com.sam.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class DBUtil {
    private static String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=utf-8";
    private static String driver = "com.mysql.jdbc.Driver";
    private static String username = "javaee";
    private static String password = "javaee";
    
    public static Connection getConn() throws Exception {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, username, password);
        return conn;
    }
    
    public static void close(Connection conn) throws Exception {
        if(conn != null){
            conn.close();
        }
    }
    
    public static void main(String[] args) throws Exception {
        Connection conn = DBUtil.getConn();
        System.out.println(conn == null);
        
    }
}
