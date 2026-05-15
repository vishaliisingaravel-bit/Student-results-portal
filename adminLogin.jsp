%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>Admin Login</title>

<style>
body {
    margin:0;
    font-family: Arial;
    height:100vh;
    background: linear-gradient(135deg,#667eea,#764ba2);
    display:flex;
    justify-content:center;
    align-items:center;
}

/* GLASS EFFECT */
.glass {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);
    border-radius:20px;
    padding:40px;
    width:300px;
    text-align:center;
    box-shadow:0 8px 32px rgba(0,0,0,0.3);
}

h2 {
    color:white;
}

/* INPUT */
input {
    width:100%;
    padding:10px;
    margin:10px 0;
    border:none;
    border-radius:10px;
}

/* ANIMATED BUTTON */
button {
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background: linear-gradient(45deg,#ff6ec4,#7873f5);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover {
    transform: scale(1.05);
    box-shadow:0 0 15px #fff;
}
</style>

</head>

<body>

<div class="glass">

<h2>Admin Login</h2>

<form action="AdminServlet" method="post">
<input type="text" name="username" placeholder="Username"><br><br>
<input type="password" name="password" placeholder="Password"><br><br>

<button>Login</button>

</form>

</div>

</body>
</html>