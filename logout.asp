' --- logout.asp ---
<%@ Language=VBScript %>
<%
' Suppression de toutes les variables de session
Session.Abandon

' Redirection vers la page de connexion
Response.Redirect "LoginForm.asp"
%>