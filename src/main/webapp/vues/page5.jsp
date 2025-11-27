<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <c:set var="cxt" value="${pageContext.request.contextPath}" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gestion Bibliothèque</title>
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
    <a class="navbar-brand fw-bold text-primary" href="${cxt}/user/home">
        <i class="fas fa-book me-2"></i>Bibliothèque ESSAT
    </a>
    <div class="ms-auto">
        <a class="btn btn-outline-danger" href="${cxt}/logout">
            <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
        </a>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block sidebar p-3">
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${cxt}/user/home">
                        <i class="fas fa-home me-2"></i>Dashboard
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${cxt}/user/categories">
                        <i class="fas fa-book me-2"></i>Livres par catégorie
                    </a>
                </li>
                <!-- Dans la sidebar, corriger le lien actif -->
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${cxt}/user/emprunt">
                        <i class="fas fa-list me-2"></i>Mes emprunts
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto content">
            <h2 class="mb-4 text-center text-primary">Liste des Livres</h2>

            <div class="row g-4">
                <c:forEach var="livre" items="${tab}">
                    <div class="col-md-4">
                        <div class="card book-card h-100 card-hover">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${livre.titre}</h5>
                                <c:if test="${not empty livre.auteur}">
                                    <p class="card-text"><strong>Auteur:</strong> ${livre.auteur}</p>
                                </c:if>
                                <c:if test="${not empty livre.cat}">
                                    <p class="card-text"><strong>Catégorie:</strong> ${livre.cat.titre}</p>
                                </c:if>
                                <a href="${cxt}/emprunt/${livre.id}" class="btn btn-primary mt-auto">
                                    <i class="fas fa-book-reader me-2"></i>Emprunter
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Message si aucun livre -->
                <c:if test="${empty tab}">
                    <div class="col-12">
                        <div class="alert alert-info text-center">
                            <i class="fas fa-info-circle me-2"></i>
                            Aucun livre disponible pour le moment.
                        </div>
                    </div>
                </c:if>
            </div>

            <!-- Bouton retour -->
            <div class="mt-4 text-center">
                <a href="${pageContext.request.contextPath}/user/categories" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Retour aux catégories
                </a>
            </div>
        </main>
    </div>
</div>

<!-- Footer -->
<footer class="bg-light text-center text-muted py-3 mt-4 border-top">
    &copy; 2025 - Application Bibliothèque ESSAT
</footer>

<!-- Bootstrap & Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>