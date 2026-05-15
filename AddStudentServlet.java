package com.student;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

    try {
        Connection con = DBConnection.getConnection();

        String reg = req.getParameter("reg_no");
        String name = req.getParameter("name");
        String pass = req.getParameter("password");

        int s1 = Integer.parseInt(req.getParameter("sub1"));
        int s2 = Integer.parseInt(req.getParameter("sub2"));
        int s3 = Integer.parseInt(req.getParameter("sub3"));
        int s4 = Integer.parseInt(req.getParameter("sub4"));
        int s5 = Integer.parseInt(req.getParameter("sub5"));

        int total = s1+s2+s3+s4+s5;
        double avg = total/5.0;

        String grade="C";
        if(avg>=90) grade="A";
        else if(avg>=75) grade="B";

        String result = avg>=50 ? "PASS":"FAIL";
        double cgpa = avg/10;

        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO students VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        ps.setString(1, reg);
        ps.setString(2, name);
        ps.setInt(3, s1);
        ps.setInt(4, s2);
        ps.setInt(5, s3);
        ps.setInt(6, s4);
        ps.setInt(7, s5);
        ps.setInt(8, total);
        ps.setDouble(9, avg);
        ps.setString(10, grade);
        ps.setString(11, pass);

        // SUBJECT CODES
        ps.setString(12, "CS101");
        ps.setString(13, "CS102");
        ps.setString(14, "CS103");
        ps.setString(15, "CS104");
        ps.setString(16, "CS105");           

        ps.setString(17, result);
        ps.setDouble(18, cgpa);

        ps.executeUpdate();

        res.sendRedirect("adminHome.jsp");

    } catch(Exception e){
        e.printStackTrace();
    }
}
}