package com.example;

import com.example.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.Path;
import java.sql.SQLException;

@WebServlet("/add")
@MultipartConfig()
public class AddProperties extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Part image1 = request.getPart("img1");
        Part image2 = request.getPart("img2");
        Part image3 = request.getPart("img3");
        FileInputStream fis1 = pathgeter(image1);
        FileInputStream fis2 = pathgeter(image2);
        FileInputStream fis3 = pathgeter(image3);
        String price =request.getParameter("price");
        String address =request.getParameter("address");
        int size =Integer.parseInt(request.getParameter("size"));
        int bed =Integer.parseInt(request.getParameter("bed"));
        int bath =Integer.parseInt(request.getParameter("bath"));
        String status =request.getParameter("status");
        String disc =request.getParameter("disc");
        try {
            PrintWriter out = response.getWriter();
            Manipuletor.add_property(Integer.parseInt(price),address,size,bed,bath,status,fis1,fis2,fis3,disc);
            out.println("added");
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private FileInputStream pathgeter(Part image) throws IOException {
        String Filename = Path.of(image.getSubmittedFileName()).getFileName().toString();
        File tmp = File.createTempFile("upload_", Filename);
        image.write(tmp.getAbsolutePath());
        File file = new File(tmp.getAbsolutePath());
        return new FileInputStream(file);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        session.setAttribute("header","Adding property to the  web");
        session.setAttribute("form","Fill out the information about the property");
        RequestDispatcher rd = request.getRequestDispatcher("Sell.jsp");
        rd.forward(request, response);
    }
}
