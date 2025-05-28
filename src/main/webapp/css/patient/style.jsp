<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
 .sidebar {
     min-height: 100vh;
     background-color: #27ae60;
     color: #fff;
     position: fixed;
     top: 0;
     bottom: 0;
     left: 0;
     z-index: 100;
     padding: 0;
     box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
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
}

.sidebar .nav-link:hover {
    color: #fff;
}

.sidebar .nav-link.active {
    color: #fff;
    background-color: rgba(255, 255, 255, .1);
}

.sidebar .nav-link i {
    margin-right: 10px;
}

main {
    padding-top: 70px;
}

.navbar {
    box-shadow: 0 2px 4px rgba(0, 0, 0, .1);
    background-color: #2ecc71 !important;
}

.card {
    margin-bottom: 20px;
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

@media (max-width: 767.98px) {
    .sidebar {
        position: static;
        height: auto;
        min-height: auto;
    }

    main {
        padding-top: 20px;
    }
}
</style>
