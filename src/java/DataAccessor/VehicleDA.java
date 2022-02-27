/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessor;

import Model.Vehicle;
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
public class VehicleDA {
    
    public List<Vehicle> getVehicle(int vehicle_id, int user_id){
        
        Connection conn;
        List<Vehicle> vehicleList = new ArrayList<Vehicle>();
        
        conn = DBConnectionUtil.OpenConnection();
        
        String query = "";
        
        try{
            
            Statement stmt = conn.createStatement();
            if(vehicle_id == 0)
                query = "SELECT * FROM Vehicle WHERE user_id != " + user_id;
            else
                query = "SELECT * FROM Vehicle WHERE vehicle_id = " + vehicle_id;
            
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                vehicleList.add(new Vehicle(rs.getInt("vehicle_id"),rs.getInt("user_id"),rs.getInt("vehicle_type"), rs.getString("vehicle_name"), rs.getString("vehicle_picture"), rs.getString("plate_num"), rs.getString("year_make"), rs.getDouble("vehicleRateDay"), rs.getDouble("vehicleRateWeek"), rs.getDouble("vehicleRateMonth"), rs.getDouble("vehicleRateYear"), rs.getDouble("mileage"), rs.getString("vehicle_desc"), rs.getInt("doors"), rs.getInt("seats"), rs.getString("transmission"), rs.getInt("minAge")));
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return vehicleList;
    }
    
    public List<Vehicle> getVehicleByUserID(int user_id){
        
        Connection conn;
        List<Vehicle> vehicleList = new ArrayList<Vehicle>();
        
        conn = DBConnectionUtil.OpenConnection();
        
        String query = "";
        
        try{
            
            Statement stmt = conn.createStatement();
            query = "SELECT * FROM Vehicle WHERE user_id = " + user_id;
            
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                vehicleList.add(new Vehicle(rs.getInt("vehicle_id"),rs.getInt("user_id"),rs.getInt("vehicle_type"), rs.getString("vehicle_name"), rs.getString("vehicle_picture"), rs.getString("plate_num"), rs.getString("year_make"), rs.getDouble("vehicleRateDay"), rs.getDouble("vehicleRateWeek"), rs.getDouble("vehicleRateMonth"), rs.getDouble("vehicleRateYear"), rs.getDouble("mileage"), rs.getString("vehicle_desc"), rs.getInt("doors"), rs.getInt("seats"), rs.getString("transmission"), rs.getInt("minAge")));
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return vehicleList;
    }
    
    public boolean insertVehicle(Vehicle vehicle){
              
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        int rowCount = 0;
        
        try{ 
                String query = "INSERT INTO Vehicle (user_id, vehicle_type, vehicle_name, vehicle_picture, plate_num, year_make, vehicleRateDay, vehicleRateWeek, vehicleRateMonth, vehicleRateYear, mileage, vehicle_desc, doors, seats, transmission, minAge) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, vehicle.getUser_id());
                pstmt.setInt(2, vehicle.getVehicle_type());
                pstmt.setString(3, vehicle.getVehicle_name());
                pstmt.setString(4, vehicle.getVehicle_picture());               
                pstmt.setString(5, vehicle.getPlate_num());  
                pstmt.setString(6, vehicle.getYear_make());
                pstmt.setDouble(7, vehicle.getVehicleRateDay());
                pstmt.setDouble(8, vehicle.getVehicleRateWeek());
                pstmt.setDouble(9, vehicle.getVehicleRateMonth());
                pstmt.setDouble(10, vehicle.getVehicleRateYear());
                pstmt.setDouble(11, vehicle.getMileage());
                pstmt.setString(12, vehicle.getVehicle_desc());
                pstmt.setInt(13, vehicle.getDoors());
                pstmt.setInt(14, vehicle.getSeats());
                pstmt.setString(15, vehicle.getTransmission());
                pstmt.setInt(16, vehicle.getMinAge());
                
                rowCount = pstmt.executeUpdate();   
        }
        catch(Exception ex){
            ex.printStackTrace();
        }

        return (rowCount != 0);
    }
    
    public boolean updateVehicle(Vehicle vehicle){
        
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        int rowCount = 0;
        
        try{ 
                String query = "UPDATE Vehicle SET " + 
                        "user_id = ?, vehicle_type = ?, vehicle_name = ?, " + 
                        //"vehicle_picture = ?, " +
                        "plate_num = ?, year_make = ?, " +
                        "vehicleRateDay = ?, vehicleRateWeek = ?, vehicleRateMonth = ?, vehicleRateYear = ?, " +
                        "mileage = ?, vehicle_desc = ?, doors = ?, seats = ?, transmission = ?, minAge = ? " +
                        "WHERE vehicle_id = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                
//                pstmt.setInt(1, vehicle.getUser_id());
//                pstmt.setInt(2, vehicle.getVehicle_type());
//                pstmt.setString(3, vehicle.getVehicle_name());
//                pstmt.setString(4, vehicle.getVehicle_picture());               
//                pstmt.setString(5, vehicle.getPlate_num());  
//                pstmt.setString(6, vehicle.getYear_make());
//                pstmt.setDouble(7, vehicle.getVehicleRateDay());
//                pstmt.setDouble(8, vehicle.getVehicleRateWeek());
//                pstmt.setDouble(9, vehicle.getVehicleRateMonth());
//                pstmt.setDouble(10, vehicle.getVehicleRateYear());
//                pstmt.setDouble(11, vehicle.getMileage());
//                pstmt.setString(12, vehicle.getVehicle_desc());
//                pstmt.setInt(13, vehicle.getDoors());
//                pstmt.setInt(14, vehicle.getSeats());
//                pstmt.setString(15, vehicle.getTransmission());
//                pstmt.setInt(16, vehicle.getMinAge());
//                pstmt.setInt(17, vehicle.getVehicle_id());
                
                pstmt.setInt(1, vehicle.getUser_id());
                pstmt.setInt(2, vehicle.getVehicle_type());
                pstmt.setString(3, vehicle.getVehicle_name());            
                pstmt.setString(4, vehicle.getPlate_num());  
                pstmt.setString(5, vehicle.getYear_make());
                pstmt.setDouble(6, vehicle.getVehicleRateDay());
                pstmt.setDouble(7, vehicle.getVehicleRateWeek());
                pstmt.setDouble(8, vehicle.getVehicleRateMonth());
                pstmt.setDouble(9, vehicle.getVehicleRateYear());
                pstmt.setDouble(10, vehicle.getMileage());
                pstmt.setString(11, vehicle.getVehicle_desc());
                pstmt.setInt(12, vehicle.getDoors());
                pstmt.setInt(13, vehicle.getSeats());
                pstmt.setString(14, vehicle.getTransmission());
                pstmt.setInt(15, vehicle.getMinAge());
                pstmt.setInt(16, vehicle.getVehicle_id());
                
                rowCount = pstmt.executeUpdate();   
        }
        catch(Exception ex){
            ex.printStackTrace();
        }

        return (rowCount != 0);
    }
    
    public boolean deleteVehicle(int vehicle_id){
        
        Connection conn;

        conn = DBConnectionUtil.OpenConnection();
        
        String query = "";
        
        try{
            Statement stmt = conn.createStatement();
            
            query = "DELETE FROM Vehicle WHERE vehicle_id = " + vehicle_id;
            
            stmt.executeUpdate(query);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return true;
    }

}
