package com.student;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

    try {
        Connection con = DBConnection.getConnection();

        String reg = req.getParameter("reg_no");

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
        "UPDATE students SET sub1=?,sub2=?,sub3=?,sub4=?,sub5=?,total=?,average=?,grade=?,cgpa=?,result=? WHERE reg_no=?");

        ps.setInt(1,s1);
        ps.setInt(2,s2);
        ps.setInt(3,s3);
        ps.setInt(4,s4);
        ps.setInt(5,s5);
        ps.setInt(6,total);
        ps.setDouble(7,avg);
        ps.setString(8,grade);
        ps.setDouble(9,cgpa);
        ps.setString(10,result);
        ps.setString(11,reg);

        ps.executeUpdate();

        res.sendRedirect("adminHome.jsp");

    } catch(Exception e){
        e.printStackTrace();
    }
}
}