<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!-- Sidebar -->
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
    <div class="sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link ${activePage == 'dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/patient/dashboard">
                    <i class="fas fa-tachometer-alt"></i> Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/patient/dashboard">
                    <i class="fas fa-tachometer-alt"></i> Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'appointments' ? 'active' : ''}" href="${pageContext.request.contextPath}/patient/appointments">
                    <i class="fas fa-calendar-alt"></i> Mes rendez-vous
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'medical-record' ? 'active' : ''}" href="${pageContext.request.contextPath}/patient/medical-record">
                    <i class="fas fa-file-medical"></i> Mon dossier médical
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'prescriptions' ? 'active' : ''}" href="${pageContext.request.contextPath}/patient/prescriptions">
                    <i class="fas fa-prescription"></i> Mes ordonnances
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'profile' ? 'active' : ''}" href="${pageContext.request.contextPath}/profile">
                    <i class="fas fa-user"></i> Mon profil
                </a>
            </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>Accès rapide</span>
        </h6>
        <ul class="nav flex-column mb-2">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/patient/appointment-create">
                    <i class="fas fa-calendar-plus"></i> Prendre rendez-vous
                </a>
            </li>
        </ul>
    </div>
</nav>
