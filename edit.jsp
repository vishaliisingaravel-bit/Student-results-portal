<%@ page import="java.sql.*" %>
<%@ page import="com.student.DBConnection" %>

<%
String reg = request.getParameter("reg_no");

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM students WHERE reg_no=?");

ps.setString(1, reg);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<form action="UpdateServlet" method="post">
<input type="hidden" name="reg_no" value="<%= reg %>">

Sub1: <input type="text" name="sub1" value="<%= rs.getInt("sub1") %>"><br>
Sub2: <input type="text" name="sub2" value="<%= rs.getInt("sub2") %>"><br>
Sub3: <input type="text" name="sub3" value="<%= rs.getInt("sub3") %>"><br>
Sub4: <input type="text" name="sub4" value="<%= rs.getInt("sub4") %>"><br>
Sub5: <input type="text" name="sub5" value="<%= rs.getInt("sub5") %>"><br>

<button>Update</button>
</form>