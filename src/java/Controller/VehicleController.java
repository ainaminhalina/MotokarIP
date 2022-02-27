/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccessor.VehicleDA;
import Model.Vehicle;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "VehicleController", urlPatterns = {"/VehicleController"})
public class VehicleController extends HttpServlet {

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
            case "getVehicle":
                getVehicle(request, response);
                break;
            case "garage":
                garage(request, response);
                break;
            case "viewVehicle":
                viewVehicle(request, response);
                break;
            case "addVehicle":
                addVehicle(request, response);
                break;
            case "editVehicle":
                editVehicle(request, response);
                break; 
            case "insertVehicle":
                insertVehicle(request, response);
                break; 
            case "updateVehicle":
                updateVehicle(request, response);
                break; 
            case "deleteVehicle":
                deleteVehicle(request, response);
                break;
            default:
                notFound();
        }
    }
    
    protected void getVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
        
        VehicleDA vda = new VehicleDA();
        List<Vehicle> vehicleList = vda.getVehicle(vehicle_id, user_id);

        if(vehicle_id != 0){
            request.setAttribute("vehicle", vehicleList.get(0));
            request.setAttribute("user_id",user_id);
            RequestDispatcher rd = request.getRequestDispatcher("admin-view/carDetail.jsp");
            rd.forward(request, response);
        }else{   
            request.setAttribute("vehicleList", vehicleList);
            request.setAttribute("rented", 0);
            RequestDispatcher rd = request.getRequestDispatcher("admin-view/cars.jsp");
            rd.forward(request, response);
        }
    }
    
    protected void garage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        
        VehicleDA vda = new VehicleDA();
        List<Vehicle> vehicleList = vda.getVehicleByUserID(user_id);
        
        request.setAttribute("vehicleList", vehicleList);
        request.setAttribute("added", 0);
        request.setAttribute("edited", 0);
        request.setAttribute("deleted", 0);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/garage.jsp");
        rd.forward(request, response);
        
    }
    
    protected void viewVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        
        int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
        
        VehicleDA vda = new VehicleDA();
        List<Vehicle> vehicleList = vda.getVehicle(vehicle_id, user_id);
        
        request.setAttribute("vehicle", vehicleList.get(0));
        request.setAttribute("user_id", user_id);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/viewVehicle.jsp");
        rd.forward(request, response);
        
    }
    protected void addVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/addVehicle.jsp");
        rd.forward(request, response);
    }
    
    protected void editVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        
        int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
        
        VehicleDA vda = new VehicleDA();
        List<Vehicle> vehicleList = vda.getVehicle(vehicle_id, user_id);
        
        request.setAttribute("vehicle", vehicleList.get(0));
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/editVehicle.jsp");
        rd.forward(request, response);
        
    }

    protected void insertVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        
        String vehicle_name = request.getParameter("vehicle_name");
        //String vehicle_picture = request.getParameter("vehicle_picture");
        String vehicle_picture = "images/vehiclepicture.png";
        int doors = Integer.parseInt(request.getParameter("doors"));
        int seats = Integer.parseInt(request.getParameter("seats"));
        String transmission = request.getParameter("transmission");
        double mileage = Double.parseDouble(request.getParameter("mileage"));
        double vehicleRateDay = Double.parseDouble(request.getParameter("vehicleRateDay"));
        double vehicleRateWeek = Double.parseDouble(request.getParameter("vehicleRateWeek"));
        double vehicleRateMonth = Double.parseDouble(request.getParameter("vehicleRateMonth"));
        double vehicleRateYear = Double.parseDouble(request.getParameter("vehicleRateYear"));
        String vehicle_desc = request.getParameter("vehicle_desc");
        
        VehicleDA vda = new VehicleDA();
        
        Vehicle vehicle = new Vehicle(user_id, 1, vehicle_name, vehicle_picture, "", "", vehicleRateDay, vehicleRateWeek, vehicleRateMonth, vehicleRateYear, mileage, vehicle_desc, doors, seats, transmission, 18);
        vda.insertVehicle(vehicle);
        
        List<Vehicle> vehicleList = vda.getVehicleByUserID(user_id);
        
        request.setAttribute("vehicleList", vehicleList);
        request.setAttribute("added", 1);
        request.setAttribute("edited", 0);
        request.setAttribute("deleted", 0);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/garage.jsp");
        rd.forward(request, response);

    }
    
    protected void updateVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        
        int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
        String vehicle_name = request.getParameter("vehicle_name");
        //String vehicle_picture = request.getParameter("vehicle_picture");
        String vehicle_picture = "images/vehiclepicture.png";
        int doors = Integer.parseInt(request.getParameter("doors"));
        int seats = Integer.parseInt(request.getParameter("seats"));
        String transmission = request.getParameter("transmission");
        double mileage = Double.parseDouble(request.getParameter("mileage"));
        double vehicleRateDay = Double.parseDouble(request.getParameter("vehicleRateDay"));
        double vehicleRateWeek = Double.parseDouble(request.getParameter("vehicleRateWeek"));
        double vehicleRateMonth = Double.parseDouble(request.getParameter("vehicleRateMonth"));
        double vehicleRateYear = Double.parseDouble(request.getParameter("vehicleRateYear"));
        String vehicle_desc = request.getParameter("vehicle_desc");
        
        VehicleDA vda = new VehicleDA();
        
        Vehicle vehicle = new Vehicle(vehicle_id, user_id, 1, vehicle_name, vehicle_picture, "", "", vehicleRateDay, vehicleRateWeek, vehicleRateMonth, vehicleRateYear, mileage, vehicle_desc, doors, seats, transmission, 18);
        vda.updateVehicle(vehicle);
        
        List<Vehicle> vehicleList = vda.getVehicleByUserID(user_id);
        
        request.setAttribute("vehicleList", vehicleList);
        request.setAttribute("added", 0);
        request.setAttribute("edited", 1);
        request.setAttribute("deleted", 0);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/garage.jsp");
        rd.forward(request, response);

    }
    
    protected void deleteVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
        
        int vehicle_id = Integer.parseInt(request.getParameter("vehicle_id"));
        
        VehicleDA vda = new VehicleDA();
        vda.deleteVehicle(vehicle_id);
        List<Vehicle> vehicleList = vda.getVehicleByUserID(user_id);
        
        request.setAttribute("vehicleList", vehicleList);
        request.setAttribute("added", 0);
        request.setAttribute("edited", 0);
        request.setAttribute("deleted", 1);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/garage.jsp");
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
