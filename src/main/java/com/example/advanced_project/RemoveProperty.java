package com.example.advanced_project;

import com.example.advanced_project.Connector_Manupuletor.Manipuletor;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            PrintWriter out = response.getWriter();
            Manipuletor.remove_property(id);
            out.println("Removed!!");
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
