/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author Welcome
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            
// fetching all edit form datail data here ....
       
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            // no need direct update here
//            String gender = request.getParameter("user-gender");
            String about = request.getParameter("user_about");
            Part part = request.getPart("user_file");
            String imageName = part.getSubmittedFileName();
            
//            getting user from the session

     HttpSession session = request.getSession();
     
   User user = (User) session.getAttribute("currentUser");
   
   user.setName(name);
   user.setEmail(email);
   user.setPassword(password);
//   user.setGender(gender);
   user.setAbout(about);
   String oldProfileName = user.getProfile();
   user.setProfile(imageName);
   
//     updating data 

 UserDao dao = new UserDao(ConnectionProvider.getConnection());
boolean ans = dao.updateUser(user);

if(ans){
   out.println("updated to database");
ServletContext context = request.getServletContext();
String basePath = context.getRealPath("/");
String profileImagePath = basePath + "pics" + File.separator + user.getProfile();

String OldprofileImagePath = basePath + "pics" + File.separator + oldProfileName;

if(!"default.png".equals(oldProfileName)){
    Helper.deleteFile(  OldprofileImagePath);
}

 if(Helper.saveFile(part.getInputStream(), profileImagePath)){
     out.print("Profile Upadated.....");
     Message msg = new Message("Profile details upadated....." , "success" , "alert-success");
      session.setAttribute("msg", msg);
 }else{
     Message msg = new Message("Something went wrong, please try again" , "error" , "alert-error");
     session.setAttribute("msg", msg);
 }
}else{
    out.print("Not updated to db");
    Message msg = new Message("Something went wrong, please try again" , "error" , "alert-error");
    session.setAttribute("msg", msg);
}
 
   response.sendRedirect("profile.jsp");
     
     
     
           


            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
