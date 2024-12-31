package com.example.managment;

import com.example.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.sql.SQLException;

@WebServlet("/update_pass")
public class Updatepassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("newPassword");
            try {
                if(Manipuletor.updatepass(email,password)){
                    request.setAttribute("Admin","null");
                    request.setAttribute("message","Password updated successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Fix_password.jsp");
                    rd.forward(request,response);
                }
                else{
                    request.setAttribute("message","Password update failed");
                    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Fix_password.jsp");
                    rd.forward(request,response);
                }
            } catch (SQLException | ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }

}
