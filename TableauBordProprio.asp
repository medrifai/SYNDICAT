<%@ Language=VBScript %>
<%
' Initialisation des objets
Dim Cx, CmdUsers, CmdBiens, CmdBudget
Dim RsUsers, RsBiens, RsBudget

' Fonction pour formater les nombres
Function FormatNumber(num)
    If IsNull(num) Then
        FormatNumber = "0"
    Else
        FormatNumber = FormatCurrency(num, 0)
    End If
End Function

' Fonction pour calculer le pourcentage
Function CalculateCotisationPercentage(cotisations, budget)
    If IsNull(budget) Or budget = 0 Then
        CalculateCotisationPercentage = 0
    Else
        CalculateCotisationPercentage = (cotisations / budget) * 100
    End If
End Function

' Création de la connexion
Set Cx = Server.CreateObject("ADODB.Connection")
Cx.Open Application("PC")

' Configuration de la commande pour les utilisateurs
Set CmdUsers = Server.CreateObject("ADODB.Command")
CmdUsers.ActiveConnection = Cx
CmdUsers.CommandText = "PS_GetUserStats"
CmdUsers.CommandType = 4 ' adCmdStoredProc

' Configuration de la commande pour les biens
Set CmdBiens = Server.CreateObject("ADODB.Command")
CmdBiens.ActiveConnection = Cx
CmdBiens.CommandText = "PS_GetBiensStats"
CmdBiens.CommandType = 4 ' adCmdStoredProc

' Configuration de la commande pour le budget
Set CmdBudget = Server.CreateObject("ADODB.Command")
CmdBudget.ActiveConnection = Cx
CmdBudget.CommandText = "PS_GetBudgetStats"
CmdBudget.CommandType = 4 ' adCmdStoredProc

' Exécution des procédures stockées avec gestion d'erreur
On Error Resume Next

Set RsUsers = CmdUsers.Execute
If Err.Number <> 0 Then
    Session("MSG") = "Erreur lors de l'exécution de la requête utilisateurs : " & Err.Description
    Response.Redirect "Message.asp"
End If

Set RsBiens = CmdBiens.Execute
If Err.Number <> 0 Then
    Session("MSG") = "Erreur lors de l'exécution de la requête biens : " & Err.Description
    Response.Redirect "Message.asp"
End If

Set RsBudget = CmdBudget.Execute
If Err.Number <> 0 Then
    Session("MSG") = "Erreur lors de l'exécution de la requête budget : " & Err.Description
    Response.Redirect "Message.asp"
End If

On Error GoTo 0
%>

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

        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            min-height: 100vh;
        }

        .navbar {
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            z-index: 900;
        }

        .card {
            border-radius: 10px;
            border: none;
            transition: transform 0.2s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }

        .border-left-primary { border-left: 4px solid #4e73df !important; }
        .border-left-success { border-left: 4px solid #1cc88a !important; }
        .border-left-info { border-left: 4px solid #36b9cc !important; }
        .text-gray-800 { color: #5a5c69 !important; }
        .shadow { box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15) !important; }
    </style>
</head>

<body>
    <!-- Sidebar Start -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            Tableau de Bord
        </div>

        <div class="section-title">Finances</div>
        <a href="#budget-annuel"><i class="bi bi-cash"></i> Budget annuel</a>
        <a href="#cotisations"><i class="bi bi-people"></i> Cotisations des membres</a>
        <a href="#operations-bancaires"><i class="bi bi-bank"></i> Opérations bancaires</a>

        <div class="section-title">Gestion interne</div>
        <a href="#gestion-biens"><i class="bi bi-house"></i> Gestion des biens</a>
        <a href="#gestion-prestations"><i class="bi bi-box-seam"></i> Gestion des prestations</a>

        <div class="section-title">Organisation</div>
        <a href="#rubriques-budgetaires"><i class="bi bi-clipboard-data"></i> Rubriques budgétaires</a>
        <a href="#gestion-votes"><i class="bi bi-graph-up"></i> Gestion des votes</a>

        <div class="mt-auto">
            <a href="/logout.asp"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
        </div>
    </div>

    <div class="d-flex flex-column w-100">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light sticky-top">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" onclick="toggleSidebar()">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="dashboard.asp">
                    <img src="img/logo.png" alt="Logo" style="height: 30px; margin-right: 10px;"> SYNDICAT
                </a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <span class="nav-link">
                                <i ></i> Bienvenue, Mr @NomProprio @PrenomProprio
                            </span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.asp">
                                <i class="bi bi-box-arrow-right"></i> Déconnexion
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="content">
            <div class="row">
                <!-- Card Users -->
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="h5 mb-0 font-weight-bold text-primary mb-1">
                                        <i class="bi bi-people-fill me-2"></i>Utilisateurs
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-12">
                                            <div class="h2 mb-3 font-weight-bold text-gray-800"><%=rsUsers("TotalUsers")%></div>
                                            <p class="text-muted">Utilisateurs Total</p>
                                        </div>
                                        <div class="col-6">
                                            <div class="h4 mb-0 text-success"><%=rsUsers("NombreAdmins")%></div>
                                            <small class="text-muted">Admins</small>
                                        </div>
                                        <div class="col-6">
                                            <div class="h4 mb-0 text-info"><%=rsUsers("NombreProprios")%></div>
                                            <small class="text-muted">Propriétaires</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card Biens -->
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="h5 mb-0 font-weight-bold text-success mb-1">
                                        <i class="bi bi-house-door-fill me-2"></i>Biens Immobiliers
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-12">
                                            <div class="h2 mb-3 font-weight-bold text-gray-800"><%=rsBiens("TotalBiens")%></div>
                                            <p class="text-muted">Total des Biens</p>
                                        </div>
                                        <div class="col-6">
                                            <div class="h4 mb-0 text-warning"><%=rsBiens("NombreAppartements")%></div>
                                            <small class="text-muted">Appartements</small>
                                        </div>
                                        <div class="col-6">
                                            <div class="h4 mb-0 text-danger"><%=rsBiens("NombreLocaux")%></div>
                                            <small class="text-muted">Locaux</small>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <div class="progress" style="height: 10px;">
                                                <% 
                                                Dim pourcentageAppartements, pourcentageLocaux
                                                pourcentageAppartements = (rsBiens("NombreAppartements") / rsBiens("TotalBiens")) * 100
                                                pourcentageLocaux = (rsBiens("NombreLocaux") / rsBiens("TotalBiens")) * 100
                                                %>
                                                <div class="progress-bar bg-warning" style="width: <%=pourcentageAppartements%>%"></div>
                                                <div class="progress-bar bg-danger" style="width: <%=pourcentageLocaux%>%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card Budget -->
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="h5 mb-0 font-weight-bold text-info mb-1">
                                        <i class="bi bi-cash-coin me-2"></i>Budget
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-12">
                                            <div class="h2 mb-3 font-weight-bold text-gray-800"><%=FormatNumber(rsBudget("BudgetAnnuel"))%> €</div>
                                            <p class="text-muted">Budget Annuel</p>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <%
                                            Dim pourcentageCotisations
                                            pourcentageCotisations = CalculateCotisationPercentage(rsBudget("CotisationsPercues"), rsBudget("BudgetAnnuel"))
                                            %>
                                            <div class="d-flex justify-content-between mb-1">
                                                <small>Cotisations Perçues</small>
                                                <small class="text-success"><%=FormatNumber(pourcentageCotisations)%>%</small>
                                            </div>
                                            <div class="progress" style="height: 8px;">
                                                <div class="progress-bar bg-success" style="width: <%=pourcentageCotisations%>%"></div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="h4 mb-0 text-success"><%=FormatNumber(rsBudget("TotalRecettes"))%> €</div>
                                            <small class="text-muted">Recettes</small>
                                        </div>
                                        <div class="col-6">
                                            <div class="h4 mb-0 text-danger"><%=FormatNumber(rsBudget("TotalDepenses"))%> €</div>
                                            <small class="text-muted">Dépenses</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Toggle Sidebar Script -->
    <script>
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('show');
        }
    </script>

    <%
' Fermeture propre des objets
If Not RsUsers Is Nothing Then
    If RsUsers.State = 1 Then RsUsers.Close
    Set RsUsers = Nothing
End If

If Not RsBiens Is Nothing Then
    If RsBiens.State = 1 Then RsBiens.Close
    Set RsBiens = Nothing
End If

If Not RsBudget Is Nothing Then
    If RsBudget.State = 1 Then RsBudget.Close
    Set RsBudget = Nothing
End If

If Not CmdUsers Is Nothing Then Set CmdUsers = Nothing
If Not CmdBiens Is Nothing Then Set CmdBiens = Nothing
If Not CmdBudget Is Nothing Then Set CmdBudget = Nothing

If Not Cx Is Nothing Then
    If Cx.State = 1 Then Cx.Close
    Set Cx = Nothing
End If
%>
</body>
</html>