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

@WebServlet("/view_individual")
public class View_indvidual extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            ResultSet rs = Manipuletor.showbyid(id);
            request.setAttribute("individual", rs);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view_individual.jsp");
            rd.forward(request,response);
        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
