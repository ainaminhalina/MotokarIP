/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author User
 */
public class VehicleRent implements Serializable{
    
    private int vehicle_rent_id;
    private int user_id;
    private int vehicle_id;
    private int rent_status;
    private Date start_date;
    private Date end_date;
    private double rent_price;
    private String rent_desc; 
    private String vehicle_name;
    private String vehicle_picture; 
    private Double vehicleRateDay;
    private Double vehicleRateWeek;
    private Double vehicleRateMonth;
    private Double vehicleRateYear;
    private Double mileage;
    private String vehicle_desc;
    private int doors;
    private int seats;
    private String transmission;

    public VehicleRent(int user_id, int vehicle_id, int rent_status, Date start_date, Date end_date, double rent_price, String rent_desc) {
        this.user_id = user_id;
        this.vehicle_id = vehicle_id;
        this.rent_status = rent_status;
        this.start_date = start_date;
        this.end_date = end_date;
        this.rent_price = rent_price;
        this.rent_desc = rent_desc;
    }
    
    public VehicleRent(int vehicle_rent_id, int user_id, int vehicle_id, int rent_status, Date start_date, Date end_date, double rent_price, String rent_desc) {
        this.vehicle_rent_id = vehicle_rent_id;
        this.user_id = user_id;
        this.vehicle_id = vehicle_id;
        this.rent_status = rent_status;
        this.start_date = start_date;
        this.end_date = end_date;
        this.rent_price = rent_price;
        this.rent_desc = rent_desc;
    }

    public VehicleRent(int vehicle_rent_id, int user_id, int vehicle_id, int rent_status, Date start_date, Date end_date, double rent_price, String rent_desc, String vehicle_name, String vehicle_picture, Double vehicleRateDay, Double vehicleRateWeek, Double vehicleRateMonth, Double vehicleRateYear, Double mileage, String vehicle_desc, int doors, int seats, String transmission) {
        this.vehicle_rent_id = vehicle_rent_id;
        this.user_id = user_id;
        this.vehicle_id = vehicle_id;
        this.rent_status = rent_status;
        this.start_date = start_date;
        this.end_date = end_date;
        this.rent_price = rent_price;
        this.rent_desc = rent_desc;
        this.vehicle_name = vehicle_name;
        this.vehicle_picture = vehicle_picture;
        this.vehicleRateDay = vehicleRateDay;
        this.vehicleRateWeek = vehicleRateWeek;
        this.vehicleRateMonth = vehicleRateMonth;
        this.vehicleRateYear = vehicleRateYear;
        this.mileage = mileage;
        this.vehicle_desc = vehicle_desc;
        this.doors = doors;
        this.seats = seats;
        this.transmission = transmission;
    }

    public int getVehicle_rent_id() {
        return vehicle_rent_id;
    }

    public void setVehicle_rent_id(int vehicle_rent_id) {
        this.vehicle_rent_id = vehicle_rent_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getVehicle_id() {
        return vehicle_id;
    }

    public void setVehicle_id(int vehicle_id) {
        this.vehicle_id = vehicle_id;
    }

    public int getRent_status() {
        return rent_status;
    }

    public void setRent_status(int rent_status) {
        this.rent_status = rent_status;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public double getRent_price() {
        return rent_price;
    }

    public void setRent_price(double rent_price) {
        this.rent_price = rent_price;
    }

    public String getRent_desc() {
        return rent_desc;
    }

    public void setRent_desc(String rent_desc) {
        this.rent_desc = rent_desc;
    }

    public String getVehicle_name() {
        return vehicle_name;
    }

    public void setVehicle_name(String vehicle_name) {
        this.vehicle_name = vehicle_name;
    }

    public String getVehicle_picture() {
        return vehicle_picture;
    }

    public void setVehicle_picture(String vehicle_picture) {
        this.vehicle_picture = vehicle_picture;
    }

    public Double getVehicleRateDay() {
        return vehicleRateDay;
    }

    public void setVehicleRateDay(Double vehicleRateDay) {
        this.vehicleRateDay = vehicleRateDay;
    }

    public Double getVehicleRateWeek() {
        return vehicleRateWeek;
    }

    public void setVehicleRateWeek(Double vehicleRateWeek) {
        this.vehicleRateWeek = vehicleRateWeek;
    }

    public Double getVehicleRateMonth() {
        return vehicleRateMonth;
    }

    public void setVehicleRateMonth(Double vehicleRateMonth) {
        this.vehicleRateMonth = vehicleRateMonth;
    }

    public Double getVehicleRateYear() {
        return vehicleRateYear;
    }

    public void setVehicleRateYear(Double vehicleRateYear) {
        this.vehicleRateYear = vehicleRateYear;
    }

    public Double getMileage() {
        return mileage;
    }

    public void setMileage(Double mileage) {
        this.mileage = mileage;
    }

    public String getVehicle_desc() {
        return vehicle_desc;
    }

    public void setVehicle_desc(String vehicle_desc) {
        this.vehicle_desc = vehicle_desc;
    }

    public int getDoors() {
        return doors;
    }

    public void setDoors(int doors) {
        this.doors = doors;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    
}
