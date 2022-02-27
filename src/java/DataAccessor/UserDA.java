/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessor;

import Model.User;
import Utility.DBConnectionUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class UserDA {
    
    public List<User> getUser(int user_id){
        
        List<User> userList = new ArrayList<User>();
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        
        String query = "";
        
        try{
            
            Statement stmt = conn.createStatement();
            if(user_id == 0)
                query = "SELECT * FROM User";
            else
                query = "SELECT * FROM User WHERE user_id = " + user_id;
            
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                userList.add(new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("password"), rs.getString("phone_num")));
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return userList;
    }
    
    public boolean addUser(User user){
        
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        int rowCount = 0;
        
        try{ 
                String query = "INSERT INTO User (user_id,username,first_name,last_name,email,password,phone_num) values (?,?,?,?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, user.getUser_id());
                pstmt.setString(2, user.getUsername());
                pstmt.setString(3, user.getFirst_name());
                pstmt.setString(4, user.getLast_name());
                pstmt.setString(5, user.getEmail());
                pstmt.setString(6, user.getPassword());
                pstmt.setString(7, user.getPhone_num());
                rowCount = pstmt.executeUpdate();   
        }
        catch(Exception ex){
            ex.printStackTrace();
        }

        return (rowCount != 0);
    }
    
    public boolean updateUser(User user){
        
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        int rowCount = 0;
        
        try{ 
                String query = "UPDATE User SET " + 
                        "username = ?,first_name = ?,last_name = ?," +
                        "email = ?,phone_num = ? WHERE user_id = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, user.getUsername());
                pstmt.setString(2, user.getFirst_name());
                pstmt.setString(3, user.getLast_name());
                pstmt.setString(4, user.getEmail());
                pstmt.setString(5, user.getPhone_num());
                pstmt.setInt(6, user.getUser_id());
                
                rowCount = pstmt.executeUpdate();   
        }
        catch(Exception ex){
            ex.printStackTrace();
        }

        return (rowCount != 0);
    }
    
    public boolean deleteUser(int user_id){
        
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        int rowCount = 0;
        
        try{
            
            String query = "DELETE FROM User WHERE user_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, user_id);
            rowCount = pstmt.executeUpdate();   
        }
        catch(Exception ex){
            ex.printStackTrace();
        }

        return (rowCount != 0);
    }
    
    public int login(String email, String password){
        
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        int user_id = 0;

        try{
            
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM User WHERE email = '" + email + "'";
            
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                user_id = rs.getInt("user_id");
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return user_id;
    }
}
