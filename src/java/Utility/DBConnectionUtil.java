/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class DBConnectionUtil {
    
    public static Connection OpenConnection(){
    
        String driver = "com.mysql.jdbc.Driver";
        String jdbcURL = "jdbc:mysql://localhost:3306/motokar";
        String username = "root";
        String password = "";
        
        Connection conn = null;
        
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcURL,username,password);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return conn;
    }
}
