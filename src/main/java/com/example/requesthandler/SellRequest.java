package com.example.requesthandler;
import com.example.Connector_Manupuletor.Manipuletor;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.sql.SQLException;
@WebServlet("/accept")
@MultipartConfig
public class SellRequest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html");
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
            Manipuletor.accept(Integer.parseInt(price),address,size,bed,bath,status,fis1,fis2,fis3,disc);
            request.setAttribute("info","Request Sent to The Admin After the review it will be posted in the Web soon!!");
            RequestDispatcher rd = request.getRequestDispatcher("Sell.jsp");
            rd.forward(request, response);
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
}

