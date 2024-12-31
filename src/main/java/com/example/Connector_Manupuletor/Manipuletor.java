package com.example.Connector_Manupuletor;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Random;

public class Manipuletor {
    public static void add_property(int price, String address, int size, int bedroom, int bathroom, String status, FileInputStream img1, FileInputStream img2, FileInputStream img3, String des) throws SQLException {
        Connection con = Dbconnector.connect();
        CallableStatement cs = con.prepareCall("{call add_pro(?,?,?,?,?,?,?,?,?,?)}");
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
        String sql_update="update admin set admin_password='"+newpass+"' where admin_username='"+username+"'";
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement(sql_update);

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
        CallableStatement cs = con.prepareCall("{call accept_pro(?,?,?,?,?,?,?,?,?,?)}");
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
      CallableStatement cs = con.prepareCall("{call Copy_pro(?)}");
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
    public static void chnageusername(String user,String olduser) throws SQLException{
        Connection con = Dbconnector.connect();
        String sql="update Admin set admin_username='"+user+"' where admin_username='"+olduser+"'";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.execute();
        con.close();
    }
    public static void storefeedback(String name,String email,int phone,String sub ,String msg) throws SQLException {
        Connection con = Dbconnector.connect();
        CallableStatement cs = con.prepareCall("{call storefeedback(?,?,?,?,?)}");
        cs.setString(1,name);
        cs.setString(2,email);
        cs.setInt(3,phone);
        cs.setString(4,sub);
        cs.setString(5,msg);
        cs.execute();
        con.close();
    }
    public static ResultSet readfeedback() throws SQLException {
      Connection con =Dbconnector.connect();
      Statement st = con.createStatement();
      String sql="select * from feedback";
      return st.executeQuery(sql);
    }
    public static boolean adminexist(String email) throws SQLException {
        Connection con = Dbconnector.connect();
        String sql="select admin_username from admin";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
            if(rs.getString(1).equals(email)){
                return true;
            }
        }
        return false;
    }
    public static void addverfication(String email,String key) throws SQLException {
        Connection con = Dbconnector.connect();
        String sql="update admin set verfication='"+key+"' where admin_username='"+email+"'";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.executeUpdate();
        con.close();
    }
    public static String verficationGenerater(){
        String[] key = {"q4xlu1", "l2sud0", "oq7n2v", "dfqp12", "lkxr40", "5bdzmw", "opsd38"};
        Random random = new Random();
        int key_num = random.nextInt(1000);
        int randomIndex = random.nextInt(key.length);
        return key[randomIndex]+key_num;
    }
    public static boolean keychecker(String email,String key) throws SQLException {
        Connection con = Dbconnector.connect();
        String sql="select verfication from admin where admin_username='"+email+"'";
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery(sql);
        while(rs.next()){
            if(rs.getString(1).equals(key)){
                return true;
            }
        }
        return false;
    }public static boolean updatepass(String email, String pass) throws SQLException {
        Connection con = Dbconnector.connect();
        String sql = "update admin set admin_password = ? where admin_username = ?";
        String remove_key="update admin set verfication='' where admin_username = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        PreparedStatement ps1 = con.prepareStatement(remove_key);
        ps1.setString(1,email);
        ps.setString(1, pass);
        ps.setString(2, email);
        int rowsAffected = ps.executeUpdate();
        int rowsAffected1 = ps1.executeUpdate();
        con.close();
        return rowsAffected > 0 && rowsAffected1 > 0;
    }
}

