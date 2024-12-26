package com.example.filterhandler;

import com.example.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/search")
public class Filtering extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        String address = request.getParameter("address");
        try {
            ResultSet rs = Manipuletor.Filter(address);
            if(rs==null){
                PrintWriter out = response.getWriter();
                out.println("no similar value sir");
            }
            else
            request.setAttribute("Data_filter",rs);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/DisplayRent.jsp");
            rd.forward(request,response);
        } catch (SQLException | IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
