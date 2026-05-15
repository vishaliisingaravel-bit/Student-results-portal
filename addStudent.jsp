<html>
<head>
<title>Add Student</title>

<style>
body {
    font-family: 'Segoe UI';
    background:#f3f4f6;
}

.container {
    width:400px;
    margin:50px auto;
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

input {
    width:100%;
    padding:10px;
    margin:10px 0;
}

button {
    width:100%;
    padding:10px;
    background:#4f46e5;
    color:white;
    border:none;
}
</style>
</head>

<body>

<div class="container">

<h2>Add Student</h2>

<form action="AddStudentServlet" method="post">

Reg No: <input type="text" name="reg_no" required>
Name: <input type="text" name="name" required>
Password: <input type="text" name="password" required>

Sub1: <input type="number" name="sub1">
Sub2: <input type="number" name="sub2">
Sub3: <input type="number" name="sub3">
Sub4: <input type="number" name="sub4">
Sub5: <input type="number" name="sub5">

<button>Add Student</button>

</form>

</div>

</body>
</html>