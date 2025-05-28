<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Styles communs pour les pages doctor -->
<style>
    /* Base Layout Fixes */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    /* Sidebar Styles */
    .sidebar {
        min-height: 100vh;
        background-color: #2c3e50;
        color: #fff;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        z-index: 100;
        padding: 0;
        box-shadow: 2px 0 5px rgba(0, 0, 0, .1);
        width: 250px;
    }

    .sidebar-sticky {
        position: sticky;
        top: 0;
        height: calc(100vh - 48px);
        padding-top: 1rem;
        overflow-x: hidden;
        overflow-y: auto;
    }

    .sidebar .nav-link {
        font-weight: 500;
        color: rgba(255, 255, 255, .75);
        padding: 0.75rem 1rem;
        border-radius: 0;
        transition: all 0.3s ease;
    }

    .sidebar .nav-link:hover {
        color: #fff;
        background-color: rgba(255, 255, 255, .1);
    }

    .sidebar .nav-link.active {
        color: #fff;
        background-color: rgba(255, 255, 255, .2);
    }

    .sidebar .nav-link i {
        margin-right: 10px;
        width: 20px;
        text-align: center;
    }

    .sidebar-heading {
        font-size: 0.75rem;
        text-transform: uppercase;
        letter-spacing: 0.1rem;
        color: rgba(255, 255, 255, .5);
        padding: 0.5rem 1rem;
        margin-top: 1rem;
        margin-bottom: 0.5rem;
    }

    /* Main Content Area */
    main {
        margin-left: 250px;
        padding-top: 90px; /* Increased to account for navbar height */
        min-height: 100vh;
        background-color: #f8f9fa;
        padding-left: 1rem;
        padding-right: 1rem;
    }

    /* Navbar Styles */
    .navbar {
        position: fixed;
        top: 0;
        left: 250px;
        right: 0;
        z-index: 1030;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .1);
        background-color: #3498db !important;
        height: 70px;
        padding: 0 1rem;
    }

    .navbar-brand {
        color: white !important;
        font-weight: 600;
    }

    .navbar-nav .nav-link {
        color: rgba(255, 255, 255, .9) !important;
    }

    .navbar-nav .nav-link:hover {
        color: white !important;
    }

    /* Dropdown Menu Fixes */
    .navbar .dropdown-menu {
        position: absolute;
        top: 100%;
        right: 0;
        left: auto;
        z-index: 1050;
        min-width: 300px;
        padding: 0.5rem 0;
        margin: 0.125rem 0 0;
        background-color: #fff;
        border: 1px solid rgba(0,0,0,.15);
        border-radius: 0.5rem;
        box-shadow: 0 0.5rem 1rem rgba(0,0,0,.175);
    }

    .navbar .dropdown-item {
        padding: 0.5rem 1rem;
        font-size: 0.9rem;
        color: #212529;
        text-decoration: none;
        background-color: transparent;
        border: 0;
        transition: all 0.2s ease;
    }

    .navbar .dropdown-item:hover {
        background-color: #f8f9fa;
        color: #3498db;
    }

    .navbar .dropdown-header {
        padding: 0.5rem 1rem;
        margin-bottom: 0;
        font-size: 0.875rem;
        color: #6c757d;
        background-color: #f8f9fa;
        border-bottom: 1px solid #dee2e6;
    }

    .navbar .dropdown-divider {
        height: 0;
        margin: 0.5rem 0;
        overflow: hidden;
        border-top: 1px solid #dee2e6;
    }

    /* Card Styles */
    .card {
        margin-bottom: 20px;
        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        border: 1px solid rgba(0, 0, 0, .125);
        border-radius: 0.5rem;
    }

    .card-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid rgba(0, 0, 0, .125);
    }

    /* Statistics Cards */
    .stats-section {
        margin-bottom: 2rem;
    }

    .card-stats {
        background: #fff;
        border: none;
        border-radius: 0.75rem;
        padding: 1.5rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .card-stats::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 4px;
        height: 100%;
        background: var(--accent-color, #3498db);
    }

    .card-stats.border-primary {
        --accent-color: #3498db;
    }

    .card-stats.border-success {
        --accent-color: #2ecc71;
    }

    .card-stats:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }

    /* Patient Cards */
    .patient-card {
        transition: all 0.3s ease;
        border: 1px solid #e3e6f0;
        border-radius: 0.75rem;
        overflow: hidden;
        background: #fff;
        margin-bottom: 1.5rem;
    }

    .patient-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        border-color: #3498db;
    }

    .patient-card .card-body {
        padding: 1.5rem;
    }

    .patient-card .card-footer {
        background-color: #f8f9fa;
        border-top: 1px solid #e3e6f0;
        padding: 1rem 1.5rem;
    }

    /* Avatar Styles */
    .avatar-circle {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 1.5rem;
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
        margin-right: 1rem;
    }

    /* Form Controls */
    .form-control, .form-select {
        border: 1px solid #e3e6f0;
        border-radius: 0.5rem;
        padding: 0.75rem 1rem;
        transition: all 0.3s ease;
        font-size: 0.9rem;
    }

    .form-control:focus, .form-select:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.15);
    }

    .input-group-text {
        background: #f8f9fa;
        border: 1px solid #e3e6f0;
        color: #6c757d;
    }

    /* Button Styles */
    .btn {
        border-radius: 0.5rem;
        padding: 0.5rem 1rem;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .btn-primary {
        background: linear-gradient(135deg, #3498db, #2980b9);
        border: none;
        box-shadow: 0 2px 8px rgba(52, 152, 219, 0.3);
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #2980b9, #1f5f8b);
        transform: translateY(-1px);
        box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
    }

    .btn-outline-primary {
        border: 2px solid #3498db;
        color: #3498db;
        background: transparent;
    }

    .btn-outline-primary:hover {
        background: #3498db;
        color: white;
        transform: translateY(-1px);
    }

    .btn-outline-success {
        border: 2px solid #2ecc71;
        color: #2ecc71;
    }

    .btn-outline-success:hover {
        background: #2ecc71;
        color: white;
    }

    .btn-outline-info {
        border: 2px solid #17a2b8;
        color: #17a2b8;
    }

    .btn-outline-info:hover {
        background: #17a2b8;
        color: white;
    }

    /* Alert Styles */
    .alert {
        border: none;
        border-radius: 0.75rem;
        padding: 1rem 1.5rem;
        margin-bottom: 1.5rem;
    }

    .alert-success {
        background: linear-gradient(135deg, #d4edda, #c3e6cb);
        color: #155724;
        border-left: 4px solid #28a745;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        main {
            margin-left: 0;
            padding-top: 20px;
        }

        .navbar .dropdown-menu {
            min-width: 250px;
            right: 1rem;
        }

        .patient-card .card-body {
            padding: 1rem;
        }

        .avatar-circle {
            width: 50px;
            height: 50px;
            font-size: 1.2rem;
        }

        .btn-group {
            flex-direction: column;
            width: 100%;
        }

        .btn-group .btn {
            border-radius: 0.5rem !important;
            margin-bottom: 0.25rem;
            border-left: 2px solid #3498db !important;
        }

        .btn-group .btn:last-child {
            margin-bottom: 0;
        }
    }

    /* Container Fluid Fix */
    .container-fluid {
        padding: 0;
        margin: 0;
        width: 100%;
    }

    /* Row Fix */
    .row {
        margin: 0;
    }

    /* Column Fix for Sidebar */
    .col-md-3.col-lg-2 {
        padding: 0;
        flex: 0 0 250px;
        max-width: 250px;
    }

    /* Column Fix for Main Content */
    .col-md-9.ms-sm-auto.col-lg-10 {
        flex: 1;
        max-width: calc(100% - 250px);
        padding: 0 1rem;
    }

    /* Header Section */
    .d-flex.justify-content-between {
        padding: 1rem 0;
        border-bottom: 1px solid #e3e6f0;
        margin-bottom: 1.5rem;
    }

    /* Info Items */
    .patient-info {
        margin-top: 1rem;
    }

    .info-item {
        display: flex;
        align-items: center;
        padding: 0.5rem 0;
        font-size: 0.9rem;
        color: #6c757d;
        border-bottom: 1px solid #f1f3f4;
    }

    .info-item:last-child {
        border-bottom: none;
    }

    .info-item i {
        width: 20px;
        text-align: center;
        margin-right: 0.75rem;
        color: #3498db;
    }

    .info-item span {
        color: #495057;
        font-weight: 500;
    }

    /* Loading Animation */
    .loading {
        display: inline-block;
        width: 20px;
        height: 20px;
        border: 3px solid rgba(255,255,255,.3);
        border-radius: 50%;
        border-top-color: #fff;
        animation: spin 1s ease-in-out infinite;
    }

    @keyframes spin {
        to { transform: rotate(360deg); }
    }

    /* Smooth Scrolling */
    html {
        scroll-behavior: smooth;
    }

    /* Custom Scrollbar */
    ::-webkit-scrollbar {
        width: 8px;
    }

    ::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb {
        background: linear-gradient(135deg, #3498db, #2980b9);
        border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: linear-gradient(135deg, #2980b9, #1f5f8b);
    }

    /* Button Group Improvements */
    .btn-group .btn {
        padding: 0.5rem 1rem;
        font-size: 0.875rem;
        font-weight: 500;
        border-radius: 0;
        transition: all 0.2s ease;
    }

    .btn-group .btn:first-child {
        border-radius: 0.5rem 0 0 0.5rem;
    }

    .btn-group .btn:last-child {
        border-radius: 0 0.5rem 0.5rem 0;
    }

    .btn-group .btn:not(:first-child) {
        border-left: 1px solid rgba(255,255,255,0.2);
    }

    /* Search and Filter Section */
    .search-filters {
        background: #fff;
        border-radius: 0.75rem;
        padding: 1.5rem;
        margin-bottom: 2rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        border: 1px solid #e3e6f0;
    }

    /* Page Header */
    .page-header {
        background: #fff;
        border-radius: 0.75rem;
        padding: 1.5rem;
        margin-bottom: 2rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        border: 1px solid #e3e6f0;
    }

    .page-header h1 {
        margin: 0;
        color: #2c3e50;
        font-weight: 600;
    }

    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 3rem 1rem;
        background: #fff;
        border-radius: 0.75rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .empty-state i {
        font-size: 4rem;
        color: #e3e6f0;
        margin-bottom: 1rem;
    }
</style>
