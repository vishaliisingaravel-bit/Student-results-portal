<%@ page import="java.sql.*" %>
<%@ page import="com.student.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>Student Result</title>

<style>
body {
    font-family: Arial;
    background:#0f172a;
    color:white;
}

.container {
    width:700px;
    margin:40px auto;
}

.card {
    background:#1e293b;
    padding:25px;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,0.5);
}

table {
    width:100%;
    border-collapse: collapse;
    margin-top:20px;
}

th, td {
    padding:10px;
    text-align:center;
    border-bottom:1px solid #334155;
}

.progress {
    height:8px;
    background:#334155;
    border-radius:10px;
}

.progress-bar {
    height:8px;
    background:#6366f1;
    border-radius:10px;
}

.pass { color:#22c55e; font-weight:bold; }
.fail { color:#ef4444; font-weight:bold; }

button {
    margin-top:20px;
    padding:10px;
    background:#4f46e5;
    border:none;
    color:white;
}
</style>
</head>

<body>

<div class="container">
<div class="card">

<h2 style="text-align:center;">Student Result</h2>

<%
String reg = request.getParameter("reg_no");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    con = DBConnection.getConnection();

    if(con == null){
        out.println("DB Connection Failed ❌");
        return;
    }

    ps = con.prepareStatement(
        "SELECT * FROM students WHERE reg_no=?"
    );

    ps.setString(1, reg);

    rs = ps.executeQuery();

    if(rs.next()){

        // ✅ SAFE RANK CALCULATION
        double avgValue = rs.getDouble("average");

        PreparedStatement rankPs = con.prepareStatement(
            "SELECT COUNT(*) + 1 AS rnk FROM students WHERE average > ?"
        );

        rankPs.setDouble(1, avgValue);

        ResultSet rankRs = rankPs.executeQuery();

        int rank = 0;

        if(rankRs.next()){
            rank = rankRs.getInt("rnk");
        }
%>

<h3 style="text-align:center;"><%= rs.getString("name") %></h3>

<p style="text-align:center;">Rank: <b>#<%= rank %></b></p>

<table>
<tr>
<th>Subject</th>
<th>Marks</th>
<th>Performance</th>
</tr>

<tr>
<td><%= rs.getString("sub1_code") %></td>
<td><%= rs.getInt("sub1") %></td>
<td><div class="progress"><div class="progress-bar" style="width:<%= rs.getInt("sub1") %>%"></div></div></td>
</tr>

<tr>
<td><%= rs.getString("sub2_code") %></td>
<td><%= rs.getInt("sub2") %></td>
<td><div class="progress"><div class="progress-bar" style="width:<%= rs.getInt("sub2") %>%"></div></div></td>
</tr>

<tr>
<td><%= rs.getString("sub3_code") %></td>
<td><%= rs.getInt("sub3") %></td>
<td><div class="progress"><div class="progress-bar" style="width:<%= rs.getInt("sub3") %>%"></div></div></td>
</tr>

<tr>
<td><%= rs.getString("sub4_code") %></td>
<td><%= rs.getInt("sub4") %></td>
<td><div class="progress"><div class="progress-bar" style="width:<%= rs.getInt("sub4") %>%"></div></div></td>
</tr>

<tr>
<td><%= rs.getString("sub5_code") %></td>
<td><%= rs.getInt("sub5") %></td>
<td><div class="progress"><div class="progress-bar" style="width:<%= rs.getInt("sub5") %>%"></div></div></td>
</tr>

</table>

<div style="text-align:center; margin-top:20px;">

<p>Total: <b><%= rs.getInt("total") %></b></p>
<p>Average: <b><%= rs.getDouble("average") %></b></p>
<p>Grade: <b><%= rs.getString("grade") %></b></p>
<p>CGPA: <b><%= rs.getDouble("cgpa") %></b></p>

<p class="<%= rs.getString("result").equals("PASS") ? "pass" : "fail" %>">
<%= rs.getString("result") %>
</p>

</div>

<button onclick="window.print()">Download / Print</button>

<%
    } else {
%>
<p>No Student Found ❌</p>
<%
    }

} catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>

</div>
</div>

</body>
</html>