<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Center Management System</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #f1f8ff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .hero-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 15px;
        }

        .hero-card {
            background-color: white;
            border-radius: 1rem;
            padding: 40px;
            box-shadow: 0 0 40px rgba(0, 0, 0, 0.08);
            max-width: 700px;
            text-align: center;
        }

        .hero-card h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #2c3e50;
        }

        .hero-card p.lead {
            color: #6c757d;
            font-size: 1.1rem;
        }

        .hero-card .btn {
            padding: 12px 24px;
            font-size: 1rem;
            border-radius: 0.5rem;
        }

        .btn-login {
            background-color: #3498db;
            border: none;
        }

        .btn-login:hover {
            background-color: #2980b9;
        }

        .btn-register {
            background-color: #6c757d;
            border: none;
        }

        .btn-register:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="hero-container">
    <div class="hero-card">
        <h1>Medical Center Management System</h1>
        <p class="lead">A complete platform to manage patients, appointments, and health records efficiently.</p>
        <hr>
        <p>Please log in to continue, or register to create a new account.</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-center mt-4">
            <a class="btn btn-login text-white me-2" href="login.jsp">Login</a>
            <a class="btn btn-register text-white" href="register.jsp">Register</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
