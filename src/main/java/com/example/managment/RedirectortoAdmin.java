package com.example.managment;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/redirect")
public class RedirectortoAdmin extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException, ServletException {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("isAdmin") == null) {
                response.sendRedirect("AdminLoginPage.jsp");
                return;
            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/AdminDashboard.jsp");
            dispatcher.forward(request, response);
        }
    }

