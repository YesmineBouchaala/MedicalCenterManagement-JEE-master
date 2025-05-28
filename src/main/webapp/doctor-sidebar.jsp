<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<style>
    /* Sidebar base style */
    #sidebar {
        background-color: #f8f9fa;
        min-height: 100vh;
        padding-top: 1rem;
        border-right: 1px solid #dee2e6;
    }

    /* Sidebar sticky */
    .sidebar-sticky {
        position: sticky;
        top: 60px; /* height of fixed navbar */
        padding-left: 0.5rem;
        padding-right: 0.5rem;
    }

    /* Nav link style */
    #sidebar .nav-link {
        color: #495057;
        font-weight: 500;
        padding: 0.75rem 1rem;
        border-radius: 0.375rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
        transition: background-color 0.2s ease, color 0.2s ease;
    }

    #sidebar .nav-link:hover {
        background-color: #e9ecef;
        color: #0d6efd;
    }

    /* Active nav link */
    #sidebar .nav-link.active {
        color: #0d6efd;
        background-color: #d0e2ff;
        font-weight: 600;
    }

    /* Sidebar heading */
    .sidebar-heading {
        font-size: 0.85rem;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        font-weight: 600;
    }

    /* Smaller icon size */
    #sidebar .nav-link i {
        min-width: 20px;
        font-size: 1.1rem;
    }
</style>

<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
    <div class="sidebar-sticky">

        <ul class="nav flex-column mb-4">
            <li class="nav-item">
                <a class="nav-link ${activePage == 'dashboard' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/doctor/dashboard" aria-current="${activePage == 'dashboard' ? 'page' : ''}">
                    <i class="fas fa-tachometer-alt"></i>
                    Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'appointments' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/doctor/appointments" aria-current="${activePage == 'appointments' ? 'page' : ''}">
                    <i class="fas fa-calendar-alt"></i>
                    Rendez-vous
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'patients' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/doctor/patients" aria-current="${activePage == 'patients' ? 'page' : ''}">
                    <i class="fas fa-users"></i>
                    Mes patients
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'prescription-renewal' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/doctor/prescription-renewals" aria-current="${activePage == 'prescription-renewal' ? 'page' : ''}">
                    <i class="fas fa-sync-alt"></i>
                    Renouvellements
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${activePage == 'profile' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/doctor/profile" aria-current="${activePage == 'profile' ? 'page' : ''}">
                    <i class="fas fa-user-md"></i>
                    Mon profil
                </a>
            </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mb-3 text-muted">
            <span>Accès rapide</span>
        </h6>

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link"
                   href="${pageContext.request.contextPath}/doctor/appointments/new">
                    <i class="fas fa-calendar-plus"></i>
                    Nouveau rendez-vous
                </a>
            </li>

        </ul>

    </div>
</nav>