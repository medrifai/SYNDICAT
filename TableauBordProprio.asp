<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord - SYNDICAT</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            min-height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
        }

        /* Sidebar styles - Ajout de !important pour éviter les écrasements */
        .sidebar {
            width: 250px !important;
            background: #06bbcc !important;
            color: white !important;
            display: flex !important;
            flex-direction: column !important;
            padding: 15px 0 !important;
            position: fixed !important;
            height: 100vh !important;
            overflow-y: auto !important;
            z-index: 1000 !important;
        }

        /* Ajout d'une media query pour la version mobile */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s ease-in-out;
            }
            
            .sidebar.show {
                transform: translateX(0);
            }
            
            .content {
                margin-left: 0 !important;
            }
        }

        .sidebar a {
            color: white !important;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 5px 15px;
            display: block !important;
            font-size: 16px;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .sidebar .section-title {
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            padding: 15px 20px;
            margin-top: 20px;
            color: rgba(255, 255, 255, 0.9);
        }

        .sidebar .sidebar-header {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Main content styles */
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            min-height: 100vh;
        }

        /* Navbar styles */
        .navbar {
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            z-index: 900;
        }
    </style>
</head>

<body>
    <!-- Sidebar Start -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            Tableau de Bord
        </div>

        <!-- Section 1: Finances -->
        <div class="section-title">Finances</div>
        <a href="#budget-annuel"><i class="bi bi-cash"></i> Budget annuel</a>
        <a href="#cotisations"><i class="bi bi-people"></i> Cotisations des membres</a>
        <a href="#operations-bancaires"><i class="bi bi-bank"></i> Opérations bancaires</a>

        <!-- Section 2: Gestion interne -->
        <div class="section-title">Gestion interne</div>
        <a href="#gestion-biens"><i class="bi bi-house"></i> Gestion des biens</a>
        <a href="#gestion-prestations"><i class="bi bi-box-seam"></i> Gestion des prestations</a>

        <!-- Section 3: Organisation -->
        <div class="section-title">Organisation</div>
        <a href="#rubriques-budgetaires"><i class="bi bi-clipboard-data"></i> Rubriques budgétaires</a>
        <a href="#gestion-votes"><i class="bi bi-graph-up"></i> Gestion des votes</a>

        <!-- Logout -->
        <div class="mt-auto">
            <a href="/logout"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
        </div>
    </div>
    <!-- Sidebar End -->

    <div class="d-flex flex-column w-100">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg navbar-light sticky-top">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" onclick="toggleSidebar()">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="/dashboard">
                    <img src="/img/logo.png" alt="Logo" style="height: 30px; margin-right: 10px;"> SYNDICAT
                </a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/profile"><i class="bi bi-person"></i> Mon Profil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- Main Content Start -->
        <div class="content">
            <h1>Bienvenue dans le tableau de bord SYNDICAT</h1>
            <p>Utilisez la barre latérale pour naviguer entre les différentes sections.</p>
        </div>
        <!-- Main Content End -->
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Toggle Sidebar Script -->
    <script>
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('show');
        }
    </script>
</body>

</html>