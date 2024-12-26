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
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/manage")
public class ManageAccount extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ManageAccount.jsp");
            rd.forward(request,response);
        }

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            try {
                String name = session.getAttribute("username").toString();
                String current = request.getParameter("current");
                String pass = request.getParameter("new-1");
                String pass2 = request.getParameter("new-2");
                if(pass.equals(pass2)){
                    if (Manipuletor.changepass(name,current,pass)){
                        request.setAttribute("success","successfully password changed");
                        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ManageAccount.jsp");
                        rd.forward(request,response);
                    }
                    else{
                        request.setAttribute("current_error","Current password is incorrect");
                        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ManageAccount.jsp");
                        rd.forward(request,response);
                    }
                }
                else{
                    request.setAttribute("not_match","The new password doesn't match");
                    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ManageAccount.jsp");
                    rd.forward(request,response);
                }
            } catch (SQLException e) {
                PrintWriter out = response.getWriter();
                out.println(e.getMessage());
            }

        }
    }
}
