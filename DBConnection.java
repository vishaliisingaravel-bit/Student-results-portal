package com.student;

import java.sql.*;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal",
                "root",
                "Sha@1324i#"   // change if needed
            );

            System.out.println("DB Connected ✅");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}