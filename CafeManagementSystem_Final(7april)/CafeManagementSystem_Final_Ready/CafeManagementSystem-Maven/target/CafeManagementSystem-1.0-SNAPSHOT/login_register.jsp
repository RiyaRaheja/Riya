<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login/Signup Form</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #a8e063, #56ab2f);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            max-width: 900px;
            width: 100%;
            overflow: hidden;
            display: flex;
            flex-wrap: wrap;
        }

        .form-box {
            padding: 40px;
            width: 50%;
            transition: all 0.6s ease-in-out;
        }

        .form-box h1 {
            font-weight: 700;
            color: #2e7d32;
            margin-bottom: 30px;
        }

        .input-box {
            position: relative;
            margin-bottom: 20px;
        }

        .input-box input {
            width: 100%;
            padding: 12px 45px 12px 15px;
            border-radius: 12px;
            border: 1px solid #ccc;
            background-color: #f1f8e9;
        }

        .input-box i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #4caf50;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #4caf50;
            border: none;
            color: white;
            font-weight: 600;
            border-radius: 12px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #388e3c;
        }

        .toggle-box {
            width: 50%;
            background: linear-gradient(135deg, #4caf50, #81c784);
            color: white;
            text-align: center;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .toggle-box h1 {
            font-size: 32px;
            font-weight: 700;
        }

        .toggle-box p {
            margin: 15px 0 30px;
        }

        .toggle-box .btn {
            background: #fff;
            color: #4caf50;
            width: auto;
            padding: 10px 30px;
            border-radius: 20px;
        }

        .toggle-box .btn:hover {
            background: #f1f8e9;
        }

        .form-box.register {
            display: none;
        }

        @media(max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .form-box, .toggle-box {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<% if (request.getParameter("error") != null) { %>
<p class="text-danger position-absolute top-0 mt-3"><%= request.getParameter("error") %></p>
<% } else if (request.getParameter("success") != null) { %>
<p class="text-success position-absolute top-0 mt-3"><%= request.getParameter("success") %></p>
<% } %>

<div class="container" id="container">
    <!-- Login Form -->
    <div class="form-box login">
        <form action="login_signupServlet" method="post">
            <h1>Login</h1>
            <input type="hidden" name="action" value="login">
            <div class="input-box">
                <input type="email" name="email" placeholder="Email" required>
                <i class='bx bxs-envelope'></i>
            </div>
            <div class="input-box">
                <input type="password" name="password" placeholder="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
    </div>

    <!-- Toggle Panel -->
    <div class="toggle-box">
        <h1>Hello, Green Friend!</h1>
        <p>Don't have an account yet?</p>
        <button class="btn" id="showRegister">Register</button>
    </div>

    <!-- Register Form -->
    <div class="form-box register">
        <form action="login_signupServlet" method="post">
            <h1>Register</h1>
            <input type="hidden" name="action" value="register">
            <div class="input-box">
                <input type="text" name="name" placeholder="Username" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="email" name="email" placeholder="Email" required>
                <i class='bx bxs-envelope'></i>
            </div>
            <div class="input-box">
                <input type="text" name="phone" placeholder="Phone Number" required>
                <i class='bx bxs-phone'></i>
            </div>
            <div class="input-box">
                <input type="password" name="password" placeholder="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <button type="submit" class="btn">Register</button>
            <p class="mt-3">Already have an account? <a href="#" id="showLogin">Login here</a></p>
        </form>
    </div>
</div>

<!-- JS Switch Logic -->
<script>
    const container = document.getElementById('container');
    const showRegister = document.getElementById('showRegister');
    const showLogin = document.getElementById('showLogin');
    const loginBox = document.querySelector('.form-box.login');
    const registerBox = document.querySelector('.form-box.register');

    showRegister.addEventListener('click', () => {
        loginBox.style.display = 'none';
        registerBox.style.display = 'block';
    });

    showLogin.addEventListener('click', (e) => {
        e.preventDefault();
        loginBox.style.display = 'block';
        registerBox.style.display = 'none';
    });
</script>

</body>
</html>
