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

@WebServlet("/forgot")
public class Paswordforgot extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        String email = request.getParameter("email");
        try {
            request.setAttribute("code", true);
            if(Manipuletor.adminexist(email)){
              String key = Manipuletor.verficationGenerater();
              Manipuletor.addverfication(email, key);
              request.setAttribute("emailValid", true);
                request.setAttribute("success", "Verification key sent to your email. Fill the next input to continue. ");
              request.setAttribute("email", email);
              RequestDispatcher rd = request.getRequestDispatcher("Forgot.jsp");
              rd.forward(request,response);
            }
            else{
                request.setAttribute("error", "Email doesn't exist");
                RequestDispatcher rd = request.getRequestDispatcher("Forgot.jsp");
                rd.forward(request,response);
            }
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String key =request.getParameter("verificationCode");
        try {
            request.setAttribute("code", true);
            if(Manipuletor.keychecker(email,key)){
                request.setAttribute("Admin", email);
                request.setAttribute("success", "Verification key sent to your email. Fill the next input to continue. ");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Fix_password.jsp");
                rd.forward(request,response);
            }
            else{
                request.setAttribute("Admin", email);
                request.setAttribute("emailValid", true);
                request.setAttribute("error_1", "verification code not correct: submit email again ");
                RequestDispatcher rd = request.getRequestDispatcher("Forgot.jsp");
                rd.forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
