package com.student;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String reg = req.getParameter("reg_no");
        String pass = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM students WHERE reg_no=? AND password=?"
            );

            ps.setString(1, reg);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                req.setAttribute("name", rs.getString("name"));
                req.setAttribute("sub1", rs.getInt("sub1"));
                req.setAttribute("sub2", rs.getInt("sub2"));
                req.setAttribute("sub3", rs.getInt("sub3"));
                req.setAttribute("sub4", rs.getInt("sub4"));
                req.setAttribute("sub5", rs.getInt("sub5"));
                req.setAttribute("total", rs.getInt("total"));
                req.setAttribute("avg", rs.getFloat("average"));
                req.setAttribute("grade", rs.getString("grade"));

                RequestDispatcher rd = req.getRequestDispatcher("result.jsp");
                rd.forward(req, res);

            } else {
                res.getWriter().println("<h3>Invalid Login ❌</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println(e); // show error
        }
    }
}