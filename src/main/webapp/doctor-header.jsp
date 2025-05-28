<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!-- Navbar supérieure -->
<nav class="navbar navbar-expand-lg bg-white shadow-sm py-3 fixed-top border-bottom">
    <div class="container-fluid px-4">
        <!-- Brand -->
        <a class="navbar-brand d-flex align-items-center fw-bold text-primary" href="${pageContext.request.contextPath}/doctor/dashboard">
            <img src="${pageContext.request.contextPath}/resources/images/medical-logo.svg" alt="Centre Médical" width="32" height="32" class="me-2"
                 onerror="this.onerror=null; this.src='https://cdn-icons-png.flaticon.com/512/4320/4320371.png';">
            <span class="fs-5">Centre Médical – Espace Médecin</span>
        </a>

        <!-- Mobile toggle -->
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#doctorNavbar"
                aria-controls="doctorNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar content -->
        <div class="collapse navbar-collapse" id="doctorNavbar">
            <ul class="navbar-nav ms-auto align-items-center">
                <!-- Notifications -->
                <li class="nav-item dropdown me-3 position-relative">
                    <a class="nav-link dropdown-toggle position-relative" href="#" id="notifDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-bell fs-5 text-dark"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow-sm" aria-labelledby="notifDropdown">
                        <li><h6 class="dropdown-header">Notifications</h6></li>
                        <li><a class="dropdown-item" href="#">Nouveau rendez‑vous demandé</a></li>
                        <li><a class="dropdown-item" href="#">Patient en attente</a></li>
                        <li><a class="dropdown-item" href="#">Rappel : réunion à 16 h</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-center" href="#">Voir toutes les notifications</a></li>
                    </ul>
                </li>

                <!-- User menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-md fs-5 text-dark me-2"></i>
                        <span class="d-none d-sm-inline text-dark fw-semibold">
                            Dr.&nbsp;
                            <c:choose>
                                <c:when test="${not empty doctor.lastName}">${doctor.lastName}</c:when>
                                <c:when test="${not empty sessionScope.username}">${sessionScope.username}</c:when>
                                <c:otherwise>Docteur</c:otherwise>
                            </c:choose>
                        </span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow-sm" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/doctor/profile"><i class="fas fa-user me-2"></i>Mon profil</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/doctor/calendar"><i class="fas fa-calendar me-2"></i>Mon agenda</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-2"></i>Déconnexion</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- Spacer to prevent content hidden behind fixed navbar -->
<style>
    body {
        padding-top: 60px; /* height of navbar */
    }
</style>
