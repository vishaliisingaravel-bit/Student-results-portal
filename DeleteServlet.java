package com.student;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

    String reg = req.getParameter("id");

    try {
        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
        "DELETE FROM students WHERE reg_no=?");

        ps.setString(1, reg);
        ps.executeUpdate();

        res.sendRedirect("adminHome.jsp");

    } catch(Exception e){
        e.printStackTrace();
    }
}
}