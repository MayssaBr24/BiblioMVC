<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ajouter Livre - Admin</title>
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
        .form-container {
            max-width: 600px;
            margin: 0 auto;
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">
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
                    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/ajouter-livre">
                        <i class="fas fa-plus me-2"></i>Ajouter Livre
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto content">
            <div class="row g-4">
                <div class="form-container">
                    <h2 class="text-center text-primary mb-4">Ajouter un nouveau livre</h2>

                    <form action="${pageContext.request.contextPath}/admin/ajouter-livre" method="POST">
                        <div class="mb-3">
                            <label for="titre" class="form-label">Titre du livre</label>
                            <input type="text" class="form-control" id="titre" name="titre" required>
                        </div>

                        <div class="mb-3">
                            <label for="auteur" class="form-label">Auteur</label>
                            <input type="text" class="form-control" id="auteur" name="auteur" required>
                        </div>

                        <div class="mb-3">
                            <label for="categorieId" class="form-label">Catégorie</label>
                            <select class="form-select" id="categorieId" name="categorieId" required>
                                <option value="">-- Sélectionner une catégorie --</option>
                                <c:forEach items="${categories}" var="categorie">
                                    <option value="${categorie.id}">${categorie.titre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-success px-5">
                                <i class="fas fa-plus me-2"></i>Ajouter
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/livres" class="btn btn-secondary px-5 ms-2">
                                <i class="fas fa-arrow-left me-2"></i>Annuler
                            </a>
                        </div>
                    </form>
                </div>
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