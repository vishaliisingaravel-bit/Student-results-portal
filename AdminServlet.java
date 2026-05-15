package com.student;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws IOException {

    String user = req.getParameter("username");
    String pass = req.getParameter("password");

    try {
        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM admin WHERE username=? AND password=?");

        ps.setString(1, user);
        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            res.sendRedirect("adminHome.jsp");
        } else {
            res.getWriter().println("Invalid Admin Login ❌");
        }

    } catch(Exception e){
        e.printStackTrace();
    }
}
}