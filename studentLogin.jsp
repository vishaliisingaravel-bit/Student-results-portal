<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>Student Login</title>

<style>
body {
    margin:0;
    font-family: Arial;
    height:100vh;
    background: linear-gradient(135deg,#00c6ff,#0072ff);
    display:flex;
    justify-content:center;
    align-items:center;
}

.glass {
    background: rgba(255,255,255,0.2);
    backdrop-filter: blur(12px);
    padding:40px;
    border-radius:20px;
    width:300px;
    text-align:center;
    box-shadow:0 8px 30px rgba(0,0,0,0.3);
}

input {
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:10px;
    border:none;
}

button {
    width:100%;
    padding:12px;
    background: linear-gradient(45deg,#ff512f,#dd2476);
    border:none;
    color:white;
    border-radius:10px;
    transition:0.3s;
}

button:hover {
    transform: scale(1.05);
}
</style>

</head>

<body>

<div class="glass">

<h2>Student Login</h2>

<form action="LoginServlet" method="post">
<input type="text" name="reg_no" placeholder="Reg No"><br><br>
<input type="password" name="password" placeholder="Password"><br><br>
<button>Login</button>
</form>

</div>

</body>
</html>