/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccessor.VehicleDA;
import DataAccessor.VehicleRentDA;
import Model.Vehicle;
import Model.VehicleRent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "VehicleRentController", urlPatterns = {"/VehicleRentController"})
public class VehicleRentController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String module = request.getParameter("module");
        
        switch(module){
            case "getVehicleRent":
                getVehicleRent(request, response);
                break;
            case "addVehicleRent":
                addVehicleRent(request, response);
                break;
            case "getTrips":
                getTrips(request, response);
                break;
            default:
                notFound();
        }
    }

    protected void getVehicleRent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        int vehicle_rent_id = Integer.parseInt(request.getParameter("vehicle_rent_id"));
        
        VehicleRentDA vrda = new VehicleRentDA();
        List<VehicleRent> vehicleRentList = vrda.getVehicleRent(vehicle_rent_id);
    }
    
    protected void addVehicleRent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
        int rent_status = 1; 
        Date start_date  = Date.valueOf(request.getParameter("start_date"));
        Date end_date  = Date.valueOf(request.getParameter("end_date")); 
        long days = ChronoUnit.DAYS.between(LocalDate.parse(start_date.toString()),LocalDate.parse(end_date.toString()));
        double vehicleRateDay = Double.parseDouble(request.getParameter("vehicleRateDay"));
        double rent_price = vehicleRateDay * days; 
        String rent_desc = request.getParameter("rent_desc");
        
        VehicleRentDA vrda = new VehicleRentDA();
        boolean flag = vrda.addVehicleRent(new VehicleRent(user_id, vehicle_id,rent_status, start_date, end_date, rent_price, rent_desc));
        
        VehicleDA vda = new VehicleDA();
        List<Vehicle> vehicleList = vda.getVehicle(0, user_id);

        request.setAttribute("vehicleList", vehicleList);
        request.setAttribute("rented", 1);
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/cars.jsp");
        rd.forward(request, response);
        
    }
    
    protected void getTrips(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        
        VehicleRentDA vrda = new VehicleRentDA();
        List<VehicleRent> vehicleRentList = vrda.getTrips(user_id);

        request.setAttribute("vehicleRentList", vehicleRentList);
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/trips.jsp");
        rd.forward(request, response);
    }
    
    protected void notFound(){
    
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
