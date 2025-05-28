<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login · Medical Center</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom styles (extract to CSS file in production) -->
    <style>
        :root {
            --mc-primary: #0d6efd;
            --mc-gradient-end: #4f9efd;
        }
        body {
            background: linear-gradient(135deg, var(--mc-primary) 0%, var(--mc-gradient-end) 100%) fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
        }
        .card-login {
            max-width: 420px;
            width: 100%;
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 0.75rem 1.5rem rgba(0,0,0,.15);
        }
        .card-header {
            background: var(--mc-primary);
            color: #fff;
            text-align: center;
            padding: 2rem 1rem;
        }
        .card-header img {
            width: 64px;
            height: 64px;
        }
        .card-body {
            background: #fff;
            padding: 2rem 2.5rem;
        }
        .btn-login {
            font-weight: 500;
        }
        .input-group-text {
            background: transparent;
            border-right: 0;
        }
        .form-control.password-field {
            border-left: 0;
        }
        .password-toggle {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="card card-login">
    <!-- Header -->
    <div class="card-header">
        <img src="${pageContext.request.contextPath}/resources/images/medical-logo.svg" alt="Medical Center Logo"
             onerror="this.onerror=null; this.src='https://cdn-icons-png.flaticon.com/512/4320/4320371.png';">
        <h2 class="h4 mt-3 mb-1">Medical Center</h2>
        <p class="text-white-50 mb-0">Sign in to your account</p>
    </div>

    <!-- Body -->
    <div class="card-body">
        <!-- Alerts -->
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <c:choose>
                    <c:when test="${param.error eq 'invalid'}">Invalid username or password. Please try again.</c:when>
                    <c:when test="${param.error eq 'expired'}">Your session has expired. Please login again.</c:when>
                    <c:otherwise>An error occurred during login. Please try again.</c:otherwise>
                </c:choose>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${not empty param.success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i>
                <c:choose>
                    <c:when test="${param.success eq 'logout'}">You have been successfully logged out.</c:when>
                    <c:when test="${param.success eq 'registered'}">Registration successful! You can now login.</c:when>
                    <c:when test="${param.success eq 'reset'}">Password reset successfully. Please login.</c:when>
                    <c:otherwise>Operation completed successfully.</c:otherwise>
                </c:choose>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Login Form -->
        <form id="loginForm" action="${pageContext.request.contextPath}/auth/login" method="post" class="needs-validation" novalidate>
            <!-- Username -->
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                <label for="username"><i class="fas fa-user me-2"></i>Username</label>
                <div class="invalid-feedback">Please enter your username.</div>
            </div>
            <!-- Password with toggle -->
            <div class="input-group mb-4">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" class="form-control password-field" id="password" name="password" placeholder="Password" required>
                <span class="input-group-text password-toggle" id="togglePassword"><i class="fas fa-eye"></i></span>
                <div class="invalid-feedback">Please enter your password.</div>
            </div>
            <!-- Remember me -->
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                <label class="form-check-label" for="rememberMe">Remember me</label>
            </div>
            <!-- Submit -->
            <div class="d-grid mb-2">
                <button type="submit" class="btn btn-primary btn-login"><i class="fas fa-sign-in-alt me-2"></i>Login</button>
            </div>
        </form>

        <!-- Footer links -->
        <div class="text-center small">
            <a href="${pageContext.request.contextPath}/register.jsp" class="text-decoration-none">Create an account</a>
        </div>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/" class="text-muted text-decoration-none"><i class="fas fa-home me-1"></i>Back to Home</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Validation & toggle password -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const form = document.getElementById('loginForm');
        const togglePassword = document.getElementById('togglePassword');
        const passwordField = document.getElementById('password');

        // Bootstrap validation
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });

        // Toggle password visibility
        togglePassword.addEventListener('click', () => {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            togglePassword.firstElementChild.classList.toggle('fa-eye');
            togglePassword.firstElementChild.classList.toggle('fa-eye-slash');
        });
    });
</script>
</body>
</html>