package com.example.propertyhandler;

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
@WebServlet("/remove")
public class RemoveProperty extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            ResultSet rs= Manipuletor.all_pro();
            request.setAttribute("pro",rs);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Removing.jsp");
            rd.forward(request,response);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Manipuletor.remove_property(id);
            ResultSet rs= Manipuletor.all_pro();
            request.setAttribute("pro",rs);
            request.setAttribute("message","Property Removed Successfully");
        } catch (SQLException e) {
            request.setAttribute("message","Error while removing the property");
        }
        finally {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Removing.jsp");
            rd.forward(request,response);
        }
    }
}
