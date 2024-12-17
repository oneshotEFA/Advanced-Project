package com.example.advanced_project;

import com.example.advanced_project.Connector_Manupuletor.Dbconnector;
import com.example.advanced_project.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet("/approve")
public class ApproveProperties extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        Connection con = null;
        try {
            con = Dbconnector.connect();
            PreparedStatement cs = null;
            cs = con.prepareStatement("select * from property_accept");
            ResultSet rs = cs.executeQuery();
            request.setAttribute("property_accept", rs);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Approving.jsp");
            rd.forward(request,response);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            PrintWriter out = response.getWriter();
            Manipuletor.approve(id);
            out.println("Approved successfully");
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
