<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
<title>SRM Portal</title>

<style>
body {
    margin:0;
    font-family: Arial;
    background: linear-gradient(to right,#e0eafc,#cfdef3);
    text-align:center;
}

.container {
    margin-top:100px;
}

.card {
    display:inline-block;
    width:250px;
    padding:30px;
    margin:20px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
    background:white;
}

.card a {
    text-decoration:none;
    color:blue;
    font-weight:bold;
}
</style>

</head>

<body>

<div class="container">

<h1>🎓 SRM PORTAL</h1>
<p>Access your results easily</p>

<div class="card">
<h3>Student Portal</h3>
<p>View your results</p>
<a href="studentLogin.jsp">Login →</a>
</div>

<div class="card">
<h3>Admin Access</h3>
<p>Manage students</p>
<a href="adminLogin.jsp">Admin Login →</a>
</div>

</div>

</body>
</html>