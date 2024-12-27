package com.example.Connector_Manupuletor;

import jakarta.servlet.annotation.WebServlet;

import java.io.FileInputStream;
import java.sql.*;
public class Manipuletor {
    public static void add_property(int price, String address, int size, int bedroom, int bathroom, String status, FileInputStream img1, FileInputStream img2, FileInputStream img3, String des) throws SQLException {
       Connection con = Dbconnector.connect();
       String sql="insert into property ( proprety_price, property_address, property_size, bedroom_number, bathroom_number,\n" +
               "                       property_status, property_image1, property_image2, property_image3, proprerty_description)\n" +
               "values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement cs = con.prepareStatement(sql);
        cs.setInt(1,price);
        cs.setString(2,address);
        cs.setInt(3,size);
        cs.setInt(4,bedroom);
        cs.setInt(5,bathroom);
        cs.setString(6,status);
        cs.setBinaryStream(7,img1);
        cs.setBinaryStream(8,img2);
        cs.setBinaryStream(9,img3);
        cs.setString(10,des);
        cs.execute();
        cs.close();
        con.close();
    }
    public static void remove_property(int id) throws SQLException {
        Connection con = Dbconnector.connect();
        CallableStatement cs = con.prepareCall("{call del(?)}");
        cs.setInt(1,id);
        cs.execute();
        cs.close();
        con.close();
    }
    public static ResultSet view_buy_property() throws SQLException {
        Connection con = Dbconnector.connect();
        PreparedStatement cs = null;
        cs = con.prepareStatement("select * from property where property_status='For Sell'");
        return cs.executeQuery();
     }
    public static ResultSet all_pro() throws SQLException {
        Connection con = Dbconnector.connect();
        PreparedStatement cs = null;
        cs = con.prepareStatement("select * from property ");
        return cs.executeQuery();
    }
    public static ResultSet view_rent_property() throws SQLException {
        Connection con = Dbconnector.connect();
        PreparedStatement cs = null;
        cs = con.prepareStatement("select * from property where property_status='For Rent'");
        return cs.executeQuery();
    }
    public static boolean changepass(String username,String current,String newpass) throws SQLException {
        Connection con = Dbconnector.connect();
        String admin_password = "";
        String sql = "select admin_password from admin where admin_username='"+username+"'";
        String sqlupdate="update admin set admin_password='"+newpass+"' where admin_username='"+username+"'";
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement(sqlupdate);

        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
            admin_password= rs.getString("admin_password");
        }
        if(current.equals(admin_password)){
            return ps.executeUpdate() >= 1;
        }
        return false;
    }
    public static boolean Autentication(String user, String pass) throws SQLException {
        Connection con = Dbconnector.connect();
        String password = "";
        String sql="select admin_password from admin where admin_username='"+user+"' and admin_password='"+pass+"'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
             password = rs.getString(1);
        }
        st.close();
        con.close();
        return pass.equals(password);
    }
    public static void accept(int price, String address, int size, int bedroom, int bathroom, String status, FileInputStream img1, FileInputStream img2, FileInputStream img3, String des) throws SQLException {
        Connection con = Dbconnector.connect();
        String sql="insert into property_accept ( proprety_price, property_address, property_size, bedroom_number, bathroom_number,\n" +
                "                       property_status, property_image1, property_image2, property_image3, proprerty_description)\n" +
                "values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement cs = con.prepareStatement(sql);
        cs.setInt(1,price);
        cs.setString(2,address);
        cs.setInt(3,size);
        cs.setInt(4,bedroom);
        cs.setInt(5,bathroom);
        cs.setString(6,status);
        cs.setBinaryStream(7,img1);
        cs.setBinaryStream(8,img2);
        cs.setBinaryStream(9,img3);
        cs.setString(10,des);
        cs.execute();
        cs.close();
        con.close();
    }
    public static void approve(int id) throws SQLException {
        Connection con = Dbconnector.connect();
        String sql = "INSERT INTO property (proprety_price, property_address, property_size, bedroom_number, bathroom_number, " +
                "property_status, property_image1, property_image2, property_image3, proprerty_description) " +
                "SELECT proprety_price, property_address, property_size, bedroom_number, bathroom_number, " +
                "property_status, property_image1, property_image2, property_image3, proprerty_description " +
                "FROM property_accept WHERE propertyID = ?";
        PreparedStatement cs = con.prepareStatement(sql);
      cs.setInt(1,id);
      cs.execute();
      cs.close();
      String sql1="delete from property_accept where propertyID = ?";
      PreparedStatement cs1 = con.prepareStatement(sql1);
      cs1.setInt(1,id);
      cs1.execute();
      con.close();
    }
    public static ResultSet Filter(String address) throws SQLException {
        String sql = "select * from property where property_address like '%"+address+"%'";
        Connection con = Dbconnector.connect();
        PreparedStatement st = con.prepareStatement(sql);
        return st.executeQuery(sql);
    }
    public static ResultSet showbyid(int id) throws SQLException {
        String sql = "select * from property where propertyID=?";
        Connection con = Dbconnector.connect();
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1,id);
        return st.executeQuery();
    }
    public static void chnageusername(String user,String olduser) throws SQLException {
        Connection con = Dbconnector.connect();
        String sql="update Admin set admin_username='"+user+"' where admin_username='"+olduser+"'";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.execute();
        con.close();
    }

    public static void main(String[] args) throws SQLException {
        chnageusername("ephi","ephrem");
    }
}

