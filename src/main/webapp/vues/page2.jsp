<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard Admin - Bibliothèque ESSAT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
        }
        .sidebar .nav-link {
            color: #ffffff;
        }
        .sidebar .nav-link.active {
            background-color: #0d6efd;
            color: white;
        }
        .sidebar .nav-link:hover {
            background-color: #495057;
        }
        .content {
            padding: 2rem;
        }
        .card-hover:hover {
            transform: scale(1.02);
            transition: all 0.2s;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4">
    <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/admin/home">
        <i class="fas fa-book me-2"></i>Bibliothèque ESSAT - Admin
    </a>
    <div class="ms-auto">
        <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout">
            <i class="fas fa-sign-out-alt me-2"></i> Déconnexion
        </a>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block sidebar p-3">
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/home">
                        <i class="fas fa-home me-2"></i>Dashboard
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/livres">
                        <i class="fas fa-book me-2"></i>Gestion Livres
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/emprunts">
                        <i class="fas fa-history me-2"></i>Gestion Emprunts
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/ajouter-livre">
                        <i class="fas fa-plus me-2"></i>Ajouter Livre
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto content">
            <h2 class="mb-4 text-primary">Dashboard Administrateur</h2>

            <div class="row g-4">
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card card-hover border-0 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-book me-2 text-primary"></i>Gestion des Livres</h5>
                            <p class="card-text">Gérer tous les livres de la bibliothèque.</p>
                            <a href="${pageContext.request.contextPath}/admin/livres" class="btn btn-outline-primary">Voir</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card card-hover border-0 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-history me-2 text-success"></i>Gestion des Emprunts</h5>
                            <p class="card-text">Voir et gérer tous les emprunts en cours.</p>
                            <a href="${pageContext.request.contextPath}/admin/emprunts" class="btn btn-outline-success">Voir</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card card-hover border-0 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-plus me-2 text-info"></i>Ajouter un Livre</h5>
                            <p class="card-text">Ajouter un nouveau livre à la bibliothèque.</p>
                            <a href="${pageContext.request.contextPath}/admin/ajouter-livre" class="btn btn-outline-info">Ajouter</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Footer -->
<footer class="bg-light text-center text-muted py-3 mt-4 border-top">
    &copy; 2025 - Application Bibliothèque ESSAT
</footer>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>