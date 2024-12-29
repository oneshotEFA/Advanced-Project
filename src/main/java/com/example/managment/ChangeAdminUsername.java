package com.example.managment;

import com.example.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/change_Admin_name")
public class ChangeAdminUsername extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = request.getParameter("newUsername");
        String password = request.getParameter("pass");
        String olduser =session.getAttribute("username").toString();
        try {
            if(Manipuletor.Autentication(olduser,password)){
                Manipuletor.chnageusername(username,olduser);
                session.setAttribute("username",username);
                request.setAttribute("changed","Admin user name changed successfully");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ManageAccount.jsp");
                rd.forward(request,response);
            }
            else{
                request.setAttribute("changed","Current password is incorrect");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ManageAccount.jsp");
                rd.forward(request,response);
            }
        } catch (SQLException e) {
            request.setAttribute("changed",e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ManageAccount.jsp");
            rd.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
