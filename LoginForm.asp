<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>SYNDICAT - Olablanca 2</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="img/Logo.png">

    <!-- Google Web Fonts -->
    <link href="fonts/fonts.css" rel="stylesheet">
    <link href="fonts/font-awesome.css" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="css/all.min.css" rel="stylesheet">
    
    <link href="css/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style type="text/css">
        input
        {
            width:95%;
            border-radius:7px;
            padding-left:7px;"
            background-color:#06bbcc;
            border:2px solid #06bbcc;
            color:navy;
        }
        input[type=text]:focus, input[type=password]:focus 
        {
            background-color: #AAFFCC;
            border:2px solid #06bbcc;
            color:navy;
        }
    </style>


    <script src="js/com.js"></script> 
    <script type="text/javascript">
        function VerifConnexion()
        {
            var login, passwd, captcha, msg = '' ;
            login = document.getElementById("TLog1").value ;
            passwd = document.getElementById("TPass1").value ;
            captcha = document.getElementById("TCaptcha1").value ;

            if(login.length == 0)
            {
                msg = msg + "\n - Login" ;
            }
            if(passwd.length == 0)
            {
                msg = msg + "\n - Mot de passe" ;
            }
            if(captcha.length != 6)
            {
                msg = msg + "\n - Code de securité" ;
            }
            if(msg.length > 0)
            {
                msg = "Veuillez saisir correctement les informations suivantes : " + msg ;
                alert(msg) ;
                return ;
            }
            document.getElementById("ConnexionForm").submit() ;
        }
    </script>
</head>

<body onload="GetCaptcha();">
    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="Default.asp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary"><img src="img/Logo.png" style="margin-top:-5px;">la Blanca 2</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="Default.asp" class="nav-item nav-link">Accueil</a>
                <a href="Evenements.asp" class="nav-item nav-link">Evenements</a>
                <a href="ContactForm.asp" class="nav-item nav-link">Contact</a>
                <a href="LoginForm.asp" class="nav-item nav-link active">Connexion</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->
    <br>
    <center>
        <div class="container-fluid">
            <div class="row g-4">
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="text-center pt-0" style="border: 2px solid #06bbcc; background:#06bbcc; color:white; border-radius:25px;">
                        <div style="border:3px solid white; border-radius:25px;">
                            <h5 class="p-3 mt-3" style="color:white">Connexion à l'application</h5>
                            <form name="ConnexionForm" id="ConnexionForm" action="LoginAction.asp" method="post">
                                <table border="0" align="center" cellspacing="0" cellpadding="0" id="TabForm" style="color:navy;">
                                    <tr style="height:1px; font-size:1px">
                                        <td align="center" valign="center" width="160"></td>
                                        <td align="center" valign="center" width="20"></td>
                                        <td align="center" valign="center" width="230"></td>
                                        <td align="center" valign="center" width="50"></td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Login
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TLog1" id="TLog1" maxlength="10" style="color:navy;" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Mot de passe
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="password" name="TPass1" id="TPass1" maxlength="10" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="28">
                                        <td align="right" valign="center">
                                            Code sécurité
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="center"   valign="center" id="TdCaptcha1" style="background:url('img/captcha.png');">&nbsp;</td>
                                        <td align="left"   valign="center"><img src="img/Refresh.gif" style="cursor:hand;padding-left:1px;" title="Générer un nouveau code de sécurité" alt="Générer un nouveau code de sécurité" onclick="GetCaptcha();"/></td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Saisie du code
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2"><input type="text" name="TCaptcha1" id="TCaptcha1" value="" title="Saisir le code de sécurité" alt="Saisir le code de sécurité" onclick="ChangeColors(this);this.value='';" /></td>
                                    </tr>
                                    <tr style="height:20px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="center" valign="center" colspan="4">
                                            <input type="button" name="BTConnexion"  id="BTConnexion" value="Se connecter à l'application" alt="Se Connecter à l'application" title="Se Connecter à l'application" style="width:230px;height:30px;cursor:hand;" onclick="VerifConnexion();">
                                        </td>
                                    </tr>
                                    <tr style="height:20px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                <!--------------------------------->
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="text-center pt-0" style="border: 2px solid #06bbcc; background:#06bbcc; color:white; border-radius:25px;">
                        <div style="border:3px solid white; border-radius:25px;">
                            <h5 class="p-3 mt-3" style="color:white">Mot de passe oublié</h5>
                            <form name="PasswordForm" id="PasswordForm" action="CompteAction.asp" method="post">
                                <table border="0" align="center" cellspacing="0" cellpadding="0" id="TabForm" style="color:navy;">
                                    <tr style="height:1px; font-size:1px">
                                        <td align="center" valign="center" width="160"></td>
                                        <td align="center" valign="center" width="20"></td>
                                        <td align="center" valign="center" width="230"></td>
                                        <td align="center" valign="center" width="50"></td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Login
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TLog2" id="TLog2" maxlength="10" style="color:navy;" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Email
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TEmail2" id="TEmail2" maxlength="50" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Code sécurité
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="center"   valign="center" id="TdCaptcha2" style="background:url('img/captcha.png');"></td>
                                        <td align="left"   valign="center"><img src="img/Refresh.gif" style="cursor:hand;padding-left:1px;" title="Générer un nouveau code de sécurité" alt="Générer un nouveau code de sécurité" onclick="GetCaptcha();"/></td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Saisie du code
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2"><input type="text" name="TCaptcha2" id="TCaptcha2" value="" title="Saisir le code de sécurité" alt="Saisir le code de sécurité" onclick="ChangeColors(this);this.value='';" /></td>
                                    </tr>
                                    <tr style="height:20px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="center" valign="center" colspan="4">
                                            <input type="button" name="BTPassword"  id="BTPassword" value="Récupérer mon mot de passe" alt="récupérer le mot de passe" title="Récupérer le mot de passe" style="width:230px;height:30px;cursor:hand;" onclick="">
                                        </td>
                                    </tr>
                                    <tr style="height:20px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                <!--------------------------------->
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="text-center pt-0" style="border: 2px solid #06bbcc; background:#06bbcc; color:white; border-radius:25px;">
                        <div style="border:3px solid white; border-radius:25px;">
                            <h5 class="p-3 mt-3" style="color:white">Demande d'activation du compte</h5>
                            <center><font color="yellow">Pour effectuer cette demande, le login et le mot de passe doivent vous être communiqués au préalable par votre syndic</font></center>
                            <form name="ActivationForm" id="ActivationForm" action="CompteAction.asp" method="post">
                                <table border="0" align="center" cellspacing="0" cellpadding="0" id="TabForm" style="color:navy;">
                                    <tr style="height:1px; font-size:1px">
                                        <td align="center" valign="center" width="160"></td>
                                        <td align="center" valign="center" width="20"></td>
                                        <td align="center" valign="center" width="230"></td>
                                        <td align="center" valign="center" width="50"></td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center" title="Le login doit être fourni au préalable par votre syndic">
                                            Login
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TLog3" id="TLog3" maxlength="10"  placeholder="fourni par votre syndic"  style="color:navy;" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Mot de passe
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="password" name="TPass3" id="TPass3" maxlength="10" placeholder="fourni par votre syndic" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Nom
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TNom3" id="TNom3" maxlength="50" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Prénom
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TPrenom3" id="TPrenom3" maxlength="50" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Email
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TEmail3" id="TEmail3" maxlength="50" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Téléphone
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2">
                                            <input type="text" name="TTel3" id="TTel3" maxlength="20" onclick="ChangeColors(this);">
                                        </td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Code sécurité
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="center"   valign="center" id="TdCaptcha3" style="background:url('img/captcha.png');"></td>
                                        <td align="left"   valign="center"><img src="img/Refresh.gif" style="cursor:hand;padding-left:1px;" title="Générer un nouveau code de sécurité" alt="Générer un nouveau code de sécurité" onclick="GetCaptcha();"/></td>
                                    </tr>
                                    <tr style="height:10px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="right" valign="center">
                                            Saisie du code
                                        </td>
                                        <td align="center" valign="center">:</td>
                                        <td align="left" valign="center" colspan="2"><input type="text" name="TCaptcha3" id="TCaptcha3" value="" title="Saisir le code de sécurité" alt="Saisir le code de sécurité" onclick="ChangeColors(this);this.value='';" /></td>
                                    </tr>
                                    <tr style="height:20px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr height="25">
                                        <td align="center" valign="center" colspan="4">
                                            <input type="button" name="BTInscription"  id="BTInscription" value="Envoyer la demande" alt="Envoyer la demande" title="Envoyer la demande" style="width:230px;height:30px;cursor:hand;" onclick="">
                                        </td>
                                    </tr>
                                    <tr style="height:20px; font-size:1px">
                                        <td align="center" valign="center" colspan="4">&nbsp;</td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </center>

    <!-- JavaScript Libraries -->
    
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/bootstrap.bundle.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>