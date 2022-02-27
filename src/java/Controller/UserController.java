/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccessor.UserDA;
import Model.User;
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
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

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
            case "viewProfile":
                viewProfile(request, response);
                break;
            case "getUser":
                getUser(request, response);
                break;
            case "addUser":
                addUser(request, response);
                break;
            case "updateUser":
                updateUser(request, response);
                break;
            case "deleteUser":
                deleteUser(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "login":
                login(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "editProfile":
                editProfile(request, response);
                break;
            default:
                notFound();
        }
    }

    protected void viewProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        int user_id = (int)request.getSession(false).getAttribute("user_id");
        
        UserDA uda = new UserDA();
        List<User> userList = uda.getUser(user_id);
        
        request.setAttribute("userList", userList.get(0));
        request.setAttribute("edited", 0);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/viewProfile.jsp");
        rd.forward(request, response);
    }
    
    protected void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        int user_id = (int)session.getAttribute("user_id");
         
        UserDA uda = new UserDA();
        List<User> userList = uda.getUser(user_id);
        
        request.setAttribute("userList", userList.get(0));
         
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/editProfile.jsp");
        rd.forward(request, response);
     
    }
    
    protected void getUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        
        UserDA uda = new UserDA();
        List<User> userList = uda.getUser(user_id);
    }

    protected void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        String username = request.getParameter("username");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone_num = request.getParameter("phone_num");
        
        UserDA uda = new UserDA();
        boolean flag = uda.addUser(new User(username, first_name, last_name, email, password, phone_num));
    }
    
    protected void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int user_id = (int)request.getSession(false).getAttribute("user_id");
        String username = request.getParameter("username");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone_num = request.getParameter("phone_num");
        
        UserDA uda = new UserDA();
        boolean flag = uda.updateUser(new User(user_id,username, first_name, last_name, email, "", phone_num));

        List<User> userList = uda.getUser(user_id);
        
        request.setAttribute("userList", userList.get(0));
        request.setAttribute("edited", 1);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-view/viewProfile.jsp");
        rd.forward(request, response);
    }
    
    protected void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        
        UserDA uda = new UserDA();
        boolean flag = uda.deleteUser(user_id);
    }
    
    protected void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        String username = request.getParameter("username");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone_num = request.getParameter("phone_num"); 
        
        UserDA uda = new UserDA();
        boolean flag = uda.addUser(new User(username, first_name, last_name, email, password, phone_num));
        
        if(flag){
            response.sendRedirect("admin-view/pages/inc/login.jsp");
        }else{
            //redirect to register page, with error message
        }
    }
    
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDA uda = new UserDA();
        int user_id = uda.login(email, password);
        
        if(user_id != 0){
            createUserSession(request, response, user_id);
            response.sendRedirect("VehicleController?module=getVehicle&vehicle_id=0");
        }else{

        }
    }
    
    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        destroyUserSession(request, response);
        response.sendRedirect("view/index.jsp");
        
    }
    
    protected void createUserSession(HttpServletRequest request, HttpServletResponse response, int user_id)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(true); 
        session.setAttribute("user_id", user_id);
    }
    
    protected void destroyUserSession(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();
        }
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
