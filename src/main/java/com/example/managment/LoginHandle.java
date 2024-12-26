package com.example.managment;

import java.io.*;
import java.sql.SQLException;

import com.example.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet("/Login_handle")
public class LoginHandle extends HttpServlet {
    private String error="Your Email or Password is incorrect.";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String username = request.getParameter("username");
      String password = request.getParameter("password");
        try {
            if(Manipuletor.Autentication(username,password)){
                HttpSession session = request.getSession();
                session.setAttribute("username",username);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/AdminDashboard.jsp");
                rd.forward(request,response);
            }
            else{
                request.setAttribute("error",error);
                RequestDispatcher rd = request.getRequestDispatcher("AdminLoginPage.jsp");
                rd.forward(request,response);
            }
        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }


}