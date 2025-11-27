<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mes Emprunts - Bibliothèque ESSAT</title>
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
        .table th {
            background-color: #0d6efd;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4">
    <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/user/home">
        <i class="fas fa-book me-2"></i>Bibliothèque ESSAT
    </a>
    <div class="ms-auto">
        <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout">
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/home">
                        <i class="fas fa-home me-2"></i>Dashboard
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/categories">
                        <i class="fas fa-book me-2"></i>Livres par catégorie
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/user/emprunt">
                        <i class="fas fa-list me-2"></i>Mes emprunts
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto content">
            <h2 class="text-center text-primary mb-4">Mes livres empruntés</h2>

            <c:if test="${not empty liste}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle bg-white shadow-sm">
                        <thead class="table-primary">
                        <tr>
                            <th>Titre</th>
                            <th>Auteur</th>
                            <th>Catégorie</th>
                            <th>Date d'emprunt</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${liste}" var="emp">
                            <tr>
                                <td>${emp.lv.titre}</td>
                                <td>${emp.lv.auteur}</td>
                                <td>${emp.lv.cat.titre}</td>
                                <td>${emp.date_emprunt}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/retourner/${emp.id}"
                                       class="btn btn-outline-danger btn-sm"
                                       onclick="return confirm('Êtes-vous sûr de vouloir retourner ce livre ?')">
                                        <i class="fas fa-undo me-1"></i> Retourner
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <c:if test="${empty liste}">
                <div class="alert alert-info text-center">
                    <i class="fas fa-info-circle me-2"></i>
                    Vous n'avez aucun livre emprunté pour le moment.
                </div>
            </c:if>

            <!-- Boutons de navigation -->
            <div class="mt-4 text-center">
                <a href="${pageContext.request.contextPath}/user/categories" class="btn btn-outline-primary me-2">
                    <i class="fas fa-book me-2"></i>Voir les catégories
                </a>
                <a href="${pageContext.request.contextPath}/user/home" class="btn btn-outline-secondary">
                    <i class="fas fa-home me-2"></i>Retour au dashboard
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