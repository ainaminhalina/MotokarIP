/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class Vehicle implements Serializable{
    
    private int vehicle_id;
    private int user_id;
    private int vehicle_type;
    private String vehicle_name;
    private String vehicle_picture;
    private String plate_num;
    private String year_make;
    private double vehicleRateDay;
    private double vehicleRateWeek;
    private double vehicleRateMonth;
    private double vehicleRateYear;
    private double mileage;
    private String vehicle_desc;
    private int doors;
    private int seats;
    private String transmission;
    private int minAge;

    public Vehicle(int vehicle_id, int user_id, int vehicle_type, String vehicle_name, String vehicle_picture, String plate_num, String year_make, double vehicleRateDay, double vehicleRateWeek, double vehicleRateMonth, double vehicleRateYear, double mileage, String vehicle_desc, int doors, int seats, String transmission, int minAge) {
        this.vehicle_id = vehicle_id;
        this.user_id = user_id;
        this.vehicle_type = vehicle_type;
        this.vehicle_name = vehicle_name;
        this.vehicle_picture = vehicle_picture;
        this.plate_num = plate_num;
        this.year_make = year_make;
        this.vehicleRateDay = vehicleRateDay;
        this.vehicleRateWeek = vehicleRateWeek;
        this.vehicleRateMonth = vehicleRateMonth;
        this.vehicleRateYear = vehicleRateYear;
        this.mileage = mileage;
        this.vehicle_desc = vehicle_desc;
        this.doors = doors;
        this.seats = seats;
        this.transmission = transmission;
        this.minAge = minAge;
    }

    public Vehicle(int user_id, int vehicle_type, String vehicle_name, String vehicle_picture, String plate_num, String year_make, double vehicleRateDay, double vehicleRateWeek, double vehicleRateMonth, double vehicleRateYear, double mileage, String vehicle_desc, int doors, int seats, String transmission, int minAge) {
        this.user_id = user_id;
        this.vehicle_type = vehicle_type;
        this.vehicle_name = vehicle_name;
        this.vehicle_picture = vehicle_picture;
        this.plate_num = plate_num;
        this.year_make = year_make;
        this.vehicleRateDay = vehicleRateDay;
        this.vehicleRateWeek = vehicleRateWeek;
        this.vehicleRateMonth = vehicleRateMonth;
        this.vehicleRateYear = vehicleRateYear;
        this.mileage = mileage;
        this.vehicle_desc = vehicle_desc;
        this.doors = doors;
        this.seats = seats;
        this.transmission = transmission;
        this.minAge = minAge;
    }

    public int getVehicle_id() {
        return vehicle_id;
    }

    public void setVehicle_id(int vehicle_id) {
        this.vehicle_id = vehicle_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getVehicle_type() {
        return vehicle_type;
    }

    public void setVehicle_type(int vehicle_type) {
        this.vehicle_type = vehicle_type;
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

    public String getPlate_num() {
        return plate_num;
    }

    public void setPlate_num(String plate_num) {
        this.plate_num = plate_num;
    }

    public String getYear_make() {
        return year_make;
    }

    public void setYear_make(String year_make) {
        this.year_make = year_make;
    }

    public double getVehicleRateDay() {
        return vehicleRateDay;
    }

    public void setVehicleRateDay(double vehicleRateDay) {
        this.vehicleRateDay = vehicleRateDay;
    }

    public double getVehicleRateWeek() {
        return vehicleRateWeek;
    }

    public void setVehicleRateWeek(double vehicleRateWeek) {
        this.vehicleRateWeek = vehicleRateWeek;
    }

    public double getVehicleRateMonth() {
        return vehicleRateMonth;
    }

    public void setVehicleRateMonth(double vehicleRateMonth) {
        this.vehicleRateMonth = vehicleRateMonth;
    }

    public double getVehicleRateYear() {
        return vehicleRateYear;
    }

    public void setVehicleRateYear(double vehicleRateYear) {
        this.vehicleRateYear = vehicleRateYear;
    }

    public double getMileage() {
        return mileage;
    }

    public void setMileage(double mileage) {
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

    public int getMinAge() {
        return minAge;
    }

    public void setMinAge(int minAge) {
        this.minAge = minAge;
    }

    @Override
    public String toString() {
        return "Vehicle{" + "vehicle_id=" + vehicle_id + ", user_id=" + user_id + ", vehicle_type=" + vehicle_type + ", vehicle_name=" + vehicle_name + ", vehicle_picture=" + vehicle_picture + ", plate_num=" + plate_num + ", year_make=" + year_make + ", vehicleRateDay=" + vehicleRateDay + ", vehicleRateWeek=" + vehicleRateWeek + ", vehicleRateMonth=" + vehicleRateMonth + ", vehicleRateYear=" + vehicleRateYear + ", mileage=" + mileage + ", vehicle_desc=" + vehicle_desc + ", doors=" + doors + ", seats=" + seats + ", transmission=" + transmission + ", minAge=" + minAge + '}';
    }

}
