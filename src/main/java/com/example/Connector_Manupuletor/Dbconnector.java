package com.example.Connector_Manupuletor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Dbconnector {
    static Connection con = null;
    static String url = "jdbc:mysql://localhost:3306/property_db";
     public static Connection connect() throws SQLException {
         con= DriverManager.getConnection(url,"root","1221");
         return con;
    }
}
