<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register · Medical Center</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom inline styles (for demo; move to CSS file in production) -->
    <style>
        :root {
            --mc-primary: #0d6efd;
            --mc-light: #f8f9fa;
        }
        body {
            background: linear-gradient(135deg, var(--mc-primary) 0%, #4f9efd 100%) no-repeat fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
        }
        .card-register {
            max-width: 650px;
            width: 100%;
            border: none;
            border-radius: 1rem;
            box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, .15);
            overflow: hidden;
        }
        .card-header {
            background: var(--mc-primary);
            color: #fff;
            text-align: center;
            padding: 2rem 1rem;
        }
        .card-header img {
            width: 72px;
            height: 72px;
        }
        .card-body {
            background: #fff;
            padding: 2rem 2.5rem;
        }
        .hidden { display: none; }
    </style>
</head>
<body>
<div class="card card-register">
    <!-- Header -->
    <div class="card-header">
        <img src="${pageContext.request.contextPath}/resources/images/medical-logo.svg" alt="Medical Center Logo"
             onerror="this.onerror=null; this.src='https://cdn-icons-png.flaticon.com/512/4320/4320371.png';">
        <h2 class="h4 mt-3 mb-1">Create Your Account</h2>
        <p class="text-white-50 mb-0">Fill out the form below to get started</p>
    </div>

    <!-- Body / Form -->
    <div class="card-body">
        <form id="registrationForm" action="${pageContext.request.contextPath}/auth/register" method="post" class="row gy-3 needs-validation" novalidate>
            <!-- First & Last Name -->
            <div class="col-md-6">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
                <div class="invalid-feedback">Please enter your first name.</div>
            </div>
            <div class="col-md-6">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
                <div class="invalid-feedback">Please enter your last name.</div>
            </div>

            <!-- Username -->
            <div class="col-12">
                <label for="username" class="form-label">Username</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-user"></i></span>
                    <input type="text" class="form-control" id="username" name="username" aria-describedby="inputGroupPrepend" required>
                    <div class="invalid-feedback">Please choose a username.</div>
                </div>
            </div>

            <!-- Email -->
            <div class="col-12">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>

            <!-- Password -->
            <div class="col-md-6">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" minlength="8" required>
                <div class="invalid-feedback">Password must be at least 8 characters long.</div>
            </div>
            <div class="col-md-6">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                <div class="invalid-feedback">Passwords do not match.</div>
            </div>

            <!-- Role -->
            <div class="col-md-6">
                <label for="role" class="form-label">Register as</label>
                <select class="form-select" id="role" name="role" required>
                    <option value="" selected disabled>Select role</option>
                    <option value="patient">Patient</option>
                    <option value="doctor">Doctor</option>
                </select>
                <div class="invalid-feedback">Please select a role.</div>
            </div>

            <!-- Specialty (Doctor only) -->
            <div id="specialtyField" class="col-md-6 hidden">
                <label for="specialty" class="form-label">Specialty</label>
                <select class="form-select" id="specialty" name="specialty">
                    <option value="" selected disabled>Select specialty</option>
                    <option value="cardiology">Cardiology</option>
                    <option value="neurology">Neurology</option>
                    <option value="pediatrics">Pediatrics</option>
                    <option value="orthopedics">Orthopedics</option>
                    <option value="dermatology">Dermatology</option>
                    <option value="general-practice">General Practice</option>
                </select>
                <div class="invalid-feedback">Please select a specialty.</div>
            </div>

            <!-- Terms -->
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="on" id="terms" name="terms" required>
                    <label class="form-check-label" for="terms">I agree to the <a href="#">Terms of Service</a> &amp; <a href="#">Privacy Policy</a></label>
                    <div class="invalid-feedback">You must agree before submitting.</div>
                </div>
            </div>

            <!-- Submit -->
            <div class="col-12 d-grid gap-2 mt-3">
                <button class="btn btn-primary" type="submit">Register</button>
                <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-outline-secondary">Already have an account? Login</a>
            </div>

            <!-- Errors -->
            <c:if test="${not empty sessionScope.registrationErrors}">
                <div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
                    <strong>Registration failed!</strong>
                    <ul class="mb-0 mt-2">
                        <c:forEach var="error" items="${sessionScope.registrationErrors}">
                            <li>${error.value}</li>
                        </c:forEach>
                    </ul>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="registrationErrors" scope="session" />
            </c:if>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Validation & dynamic fields -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const form = document.getElementById("registrationForm");
        const password = document.getElementById("password");
        const confirmPassword = document.getElementById("confirmPassword");
        const roleSelect = document.getElementById("role");
        const specialtyField = document.getElementById("specialtyField");
        const specialtySelect = document.getElementById("specialty");
        const terms = document.getElementById("terms")

        if(terms.value === 'on') {
            terms.setAttribute("terms", "on");
        }
        // Password match check
        function validatePasswords() {
            if (password.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity("Passwords do not match");
            } else {
                confirmPassword.setCustomValidity("");
            }
        }

        password.addEventListener("input", validatePasswords);
        confirmPassword.addEventListener("input", validatePasswords);

        // Show/Hide specialty based on role
        roleSelect.addEventListener("change", () => {
            if (roleSelect.value === "doctor") {
                specialtyField.classList.remove("hidden");
                specialtySelect.setAttribute("required", "true");
            } else {
                specialtyField.classList.add("hidden");
                specialtySelect.removeAttribute("required");
                specialtySelect.value = "";
            }
        });

        // Bootstrap validation
        form.addEventListener("submit", event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add("was-validated");
        });
    });
</script>
</body>
</html>
