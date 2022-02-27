/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessor;

import Model.VehicleRent;
import Utility.DBConnectionUtil;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class VehicleRentDA {
    
    public List<VehicleRent> getVehicleRent(int vehicle_rent_id){
        
        Connection conn;
        List<VehicleRent> vehicleRentList = new ArrayList<VehicleRent>();
        
        conn = DBConnectionUtil.OpenConnection();
        
        String query = "";
        
        try{
            
            Statement stmt = conn.createStatement();
            if(vehicle_rent_id == 0)
                query = "SELECT * FROM VehicleRent";
            else
                query = "SELECT * FROM VehicleRent WHERE vehicle_rent_id = " + vehicle_rent_id;
            
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                vehicleRentList.add(new VehicleRent(rs.getInt("vehicle_rent_id"), rs.getInt("user_id"), rs.getInt("vehicle_id"), rs.getInt("rent_status"), rs.getDate("start_date"), rs.getDate("end_date"), rs.getDouble("rent_price"), rs.getString("rent_desc")));
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return vehicleRentList;
    }
    
    public boolean addVehicleRent(VehicleRent vehicleRent){
        
        Connection conn;
        conn = DBConnectionUtil.OpenConnection();
        int rowCount = 0;
        
        try{ 
                String query = "INSERT INTO VehicleRent (user_id, vehicle_id, rent_status, start_date, end_date, rent_price, rent_desc) values (?,?,?,?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, vehicleRent.getUser_id());
                pstmt.setInt(2, vehicleRent.getVehicle_id());
                pstmt.setInt(3, vehicleRent.getRent_status());
                pstmt.setDate(4, vehicleRent.getStart_date());
                pstmt.setDate(5, vehicleRent.getEnd_date());
                pstmt.setDouble(6, vehicleRent.getRent_price());
                pstmt.setString(7, vehicleRent.getRent_desc());
                rowCount = pstmt.executeUpdate();   
        }
        catch(Exception ex){
            ex.printStackTrace();
        }

        return (rowCount != 0);
    }
    
    public List<VehicleRent> getTrips(int user_id){
        
        Connection conn;
        List<VehicleRent> vehicleRentList = new ArrayList<VehicleRent>();
        
        conn = DBConnectionUtil.OpenConnection();
        
        String query = "";
        
        try{
            
            Statement stmt = conn.createStatement();
            query = "SELECT VehicleRent.vehicle_rent_id, VehicleRent.vehicle_id, VehicleRent.rent_status, VehicleRent.start_date, VehicleRent.end_date, " +
            "VehicleRent.rent_price, VehicleRent.rent_desc, Vehicle.user_id, Vehicle.vehicle_name, Vehicle.vehicle_picture, Vehicle.vehicleRateDay, " +
            "Vehicle.vehicleRateWeek, Vehicle.vehicleRateMonth, Vehicle.vehicleRateYear, Vehicle.mileage, " +
            "Vehicle.vehicle_desc, Vehicle.doors, Vehicle.seats, Vehicle.transmission " +
            "FROM VehicleRent " +
            "LEFT JOIN Vehicle ON VehicleRent.vehicle_id = Vehicle.vehicle_id " +
            "WHERE VehicleRent.user_id = " + user_id;
            
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                
                vehicleRentList.add(new VehicleRent(rs.getInt("vehicle_rent_id"), rs.getInt("user_id"), rs.getInt("vehicle_id"), rs.getInt("rent_status"), rs.getDate("start_date"), rs.getDate("end_date"), rs.getDouble("rent_price"), rs.getString("rent_desc"), rs.getString("vehicle_name"), rs.getString("vehicle_picture"), rs.getDouble("vehicleRateDay"), rs.getDouble("vehicleRateWeek"), rs.getDouble("vehicleRateMonth"), rs.getDouble("vehicleRateYear"), rs.getDouble("mileage"), rs.getString("vehicle_desc"), rs.getInt("doors"), rs.getInt("seats"), rs.getString("transmission")));
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return vehicleRentList;
    }
}
