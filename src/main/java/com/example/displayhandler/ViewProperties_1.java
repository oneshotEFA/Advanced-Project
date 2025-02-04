package com.example.displayhandler;

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

@WebServlet("/view_rent")
public class ViewProperties_1 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            ResultSet rs= Manipuletor.view_rent_property();
            request.setAttribute("Data",rs);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/DisplayRent.jsp");
            rd.forward(request,response);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
            ResultSet rs= Manipuletor.all_pro();
            request.setAttribute("Data",rs);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/DisplayRent.jsp");
            rd.forward(request,response);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
