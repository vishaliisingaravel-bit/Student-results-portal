<%@ page import="java.sql.*" %>
<%@ page import="com.student.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>Admin Dashboard</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body { font-family:'Segoe UI'; background:#eef2f7; }

.header {
    display:flex;
    justify-content:space-between;
    background:#1e3a8a;
    color:white;
    padding:15px;
}

.container { width:95%; margin:auto; }

.cards { display:flex; gap:20px; margin:20px 0; }

.card {
    flex:1;
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

table {
    width:100%;
    background:white;
    border-collapse: collapse;
}

th, td {
    padding:10px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

.topper {
    background:#d1fae5;
    font-weight:bold;
}

.search-box {
    margin:10px 0;
}
</style>
</head>

<body>

<div class="header">
<h2>Admin Dashboard</h2>

<div>
<a href="addStudent.jsp">
<button style="margin-right:10px; background:#22c55e; color:white; border:none; padding:8px 12px; border-radius:6px;">
+ Add Student
</button>
</a>

<a href="index.jsp" style="color:white;">Logout</a>
</div>

</div>

<div class="container">

<%
Connection con = DBConnection.getConnection();

// STATS
ResultSet r1 = con.createStatement().executeQuery("SELECT COUNT(*) FROM students");
r1.next(); int total = r1.getInt(1);

ResultSet r2 = con.createStatement().executeQuery("SELECT AVG(average) FROM students");
r2.next(); double avg = r2.getDouble(1);

ResultSet r3 = con.createStatement().executeQuery("SELECT COUNT(*) FROM students WHERE result='PASS'");
r3.next(); int pass = r3.getInt(1);

ResultSet r4 = con.createStatement().executeQuery("SELECT COUNT(*) FROM students WHERE result='FAIL'");
r4.next(); int fail = r4.getInt(1);

// TOPPER
ResultSet topRs = con.createStatement().executeQuery(
"SELECT name, average FROM students ORDER BY average DESC LIMIT 1");
topRs.next();
String topper = topRs.getString("name");
%>

<div class="cards">
<div class="card">Total<br><b><%= total %></b></div>
<div class="card">Avg<br><b><%= String.format("%.2f", avg) %></b></div>
<div class="card">Pass<br><b><%= pass %></b></div>
<div class="card">Fail<br><b><%= fail %></b></div>
<div class="card">Topper<br><b><%= topper %></b></div>
</div>

<!-- SEARCH -->
<form method="get">
<input type="text" name="search" placeholder="Search name or reg no" class="search-box">
<button>Search</button>
</form>

<table>
<tr>
<th>Rank</th>
<th>Reg No</th>
<th>Name</th>
<th>Total</th>
<th>Average</th>
<th>Grade</th>
<th>Actions</th>
</tr>

<%
String search = request.getParameter("search");

String query = "SELECT * FROM students ORDER BY average DESC";

if(search != null && !search.isEmpty()){
query = "SELECT * FROM students WHERE name LIKE '%"+search+"%' OR reg_no LIKE '%"+search+"%' ORDER BY average DESC";
}

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);

int rank = 1;

while(rs.next()){
boolean isTopper = rs.getString("name").equals(topper);
%>

<tr class="<%= isTopper ? "topper" : "" %>">
<td><%= rank++ %></td>
<td><%= rs.getString("reg_no") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getInt("total") %></td>
<td><%= rs.getDouble("average") %></td>
<td><%= rs.getString("grade") %></td>

<td>
<a href="edit.jsp?reg_no=<%= rs.getString("reg_no") %>">Edit</a> |
<a href="DeleteServlet?id=<%= rs.getString("reg_no") %>">Delete</a>
</td>

</tr>

<% } %>

</table>

</div>
</body>
</html>