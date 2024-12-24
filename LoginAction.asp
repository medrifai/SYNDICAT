<%
	Function IsOk(str)
		if((str = 0) OR (str = "0") OR (str = "Faux") OR (str = "False") OR (str = false)) Then
			IsOk = false
		elseIf( (str = 1) OR (str = "1")  OR (str = "Vrai") OR (str = "True") OR (str = true)) Then
			IsOk = true
		else
			IsOk = false 
		end if
	End Function


	Dim  Log1, Pass1, Captcha1

	Log1 = Replace(Request.Form("TLog1"), "'", "''")
	Pass1 = Replace(Request.Form("TPass1"), "'", "''")
	Captcha1 = Replace(Request.Form("TCaptcha1"), "'", "''")

	If ( (Len(Session("Captcha")) = 0) OR (Captcha1 <> Session("Captcha"))) Then
		Session("MSG") = "Merci de Saisir correctement le code se securité"
		Response.Redirect "Message.asp"
	End If


	Req = "ps_proprio_verif   '" & Log1 & "','" & Pass1 & "'"
	
	'Response.write Application("PC")
	'Response.end
	'ON ERROR RESUME NEXT

	Set Cx = Server.CreateObject("ADODB.Connection")
	Cx.Open Application("PC")

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Cx, 3 , 3

	if (Rs.recordcount = 0) Then
		Rs.close()
		Set Rs = Nothing
		Cx.close()
		Set Cx = Nothing
		Session("MSG") = "Propriétaire inexistant"
		Response.Redirect "Message.asp"
	Else
		If (NOT IsOk(Rs("Actif"))) Then
			Rs.close()
			Set Rs = Nothing
			Cx.close()
			Set Cx = Nothing
			Session("MSG") = "Ce compte est desactivé" 
			Response.Redirect "Message.asp"
		End If

		Session("IdProprio") = Rs("IdProprio")
		Rs.close()
		Set Rs = Nothing
		Cx.close()
		Set Cx = Nothing
		Response.Redirect "TableauBordProprio.asp"
	End If

%>