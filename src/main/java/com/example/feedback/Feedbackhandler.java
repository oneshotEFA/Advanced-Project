package com.example.feedback;

import com.example.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/feedback")
public class Feedbackhandler extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ResultSet rs = Manipuletor.readfeedback();
            request.setAttribute("feedback", rs);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Feedback.jsp");
            rd.forward(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             String name = request.getParameter("name");
             String email = request.getParameter("email");
             String message = request.getParameter("message");
             int phone = Integer.parseInt(request.getParameter("phone"));
             String subject = request.getParameter("subject");
        try {
            request.setAttribute("success", "Feedback sent successfully");
            Manipuletor.storefeedback(name,email,phone,subject,message);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
