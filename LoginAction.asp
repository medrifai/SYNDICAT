<%
Function IsOk(str)
    If ((str = 0) OR (str = "0") OR (str = "Faux") OR (str = "False") OR (str = false)) Then
        IsOk = False
    ElseIf ((str = 1) OR (str = "1") OR (str = "Vrai") OR (str = "True") OR (str = true)) Then
        IsOk = True
    Else
        IsOk = False
    End If
End Function

Dim Log1, Pass1, Captcha1, Cx, Cmd, Rs

' Récupération et nettoyage des valeurs du formulaire
Log1 = Replace(Request.Form("TLog1"), "'", "''")
Pass1 = Replace(Request.Form("TPass1"), "'", "''")
Captcha1 = Replace(Request.Form("TCaptcha1"), "'", "''")

' Validation du Captcha
If (Len(Session("Captcha")) = 0) OR (Captcha1 <> Session("Captcha")) Then
    Session("MSG") = "Merci de saisir correctement le code de sécurité."
    Response.Redirect "Message.asp"
End If

' Connexion à la base de données
Set Cx = Server.CreateObject("ADODB.Connection")
Cx.Open Application("PC")

Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Cx
Cmd.CommandText = "PS_TPROPRIO_TesterUtilisateurExiste"
Cmd.CommandType = 4 ' adCmdStoredProc

Cmd.Parameters.Append Cmd.CreateParameter("@LoginProprio", 200, 1, 255, Log1) ' adVarChar
Cmd.Parameters.Append Cmd.CreateParameter("@PassProprio", 200, 1, 255, Pass1) ' adVarChar

On Error Resume Next
Set Rs = Cmd.Execute
If Err.Number <> 0 Then
    Session("MSG") = "Erreur lors de l'exécution de la requête : " & Err.Description
    Response.Redirect "Message.asp"
End If
On Error GoTo 0

' Vérification si le recordset contient des données
If Rs Is Nothing Or Rs.State = 0 Or Rs.EOF Then
    Session("MSG") = "Propriétaire inexistant."
    Response.Redirect "Message.asp"
Else
    If Not IsOk(Rs("Actif")) Then
        Session("MSG") = "Ce compte est désactivé."
        Response.Redirect "Message.asp"
    End If

    ' Stocker l'identifiant du propriétaire dans la session
    Session("IdProprio") = Rs("IdProprio")
    Response.Redirect "TableauBordProprio.asp"
End If

' Nettoyage des objets
If Not Rs Is Nothing Then
    Rs.Close
    Set Rs = Nothing
End If

If Not Cx Is Nothing Then
    Cx.Close
    Set Cx = Nothing
End If
%>