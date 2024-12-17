var col1 = '#FFFFCC';  
var col2 = '#FFCCFF';

function ChangeColors(obj) {
    //obj.style.backgroundColor = 'navy' ;
    //obj.style.color = 'yellow' ;
}


function GetCaptcha(IdCaptcha) {
    var TR;
    var head = document.head || document.getElementsByTagName('head')[0];
    var styleElem = document.createElement('style');
    styleElem.type = 'text/css';

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
            TR = xmlhttp.responseText.split('#*:*#');
            if (styleElem.styleSheet) {
                styleElem.styleSheet.cssText = TR[0];
            }
            else {
                styleElem.appendChild(document.createTextNode(TR[0]));
            }
            head.appendChild(styleElem);
            document.getElementById('TdCaptcha1').innerHTML = TR[1];
            document.getElementById('TdCaptcha1').value = 'Code de sécurité';
            document.getElementById('TdCaptcha2').innerHTML = TR[1];
            document.getElementById('TdCaptcha2').value = 'Code de sécurité';
            document.getElementById('TdCaptcha3').innerHTML = TR[1];
            document.getElementById('TdCaptcha3').value = 'Code de sécurité';
            //document.getElementById(IdCaptcha).style.background = col1;
        }
    }
    xmlhttp.open("GET", "Captcha/GetCaptcha.asp", true);
    xmlhttp.send();
}





/*

 

function FormatText(msg)
{
    var ch  = msg, car, cc, s = '', pos, taille = ch.length  ;

    for (pos = 0 ; pos < taille ; pos++)
    {
        car = ch.charAt(pos) ;
        cc  = ch.charCodeAt(pos) ;
        if (cc == 10)
            s = s + '<br>' ;
        else if (car == '<')
            s = s + '&lt;' ;
        else
            s = s +  car ;
    }
        
    return s ;
}

function IsAlias(str)
{ 
    var i, car, nbc = str.length ;
    str = str.toLowerCase() ;
                
    if(nbc == 0)
        return false ;
                    
    for(i = 0 ; i < nbc ; i++)
    {
        car = str.charCodeAt(i) ;   
        if(((car != '-'.charCodeAt(0)) && (car != '.'.charCodeAt(0))  && (car < '0'.charCodeAt(0))) ||  ((car > '9'.charCodeAt(0)) && (car < 'a'.charCodeAt(0)) && (car != '_'.charCodeAt(0))) || (car > 'z'.charCodeAt(0))) 
        {
            return false ;
        }
    }
    return true ;
}
            
function IsDomaine(str)
{
    var i, car, nbc = str.length ;
    str = str.toLowerCase() ;
            
    if(nbc < 2)
        return false ;
 
    for(i = 0 ; i < nbc ; i++)
    {
        car = str.charCodeAt(i) ;   
        if(((car != '-'.charCodeAt(0)) && (car < '0'.charCodeAt(0))) ||  ((car > '9'.charCodeAt(0)) && (car < 'a'.charCodeAt(0))) || (car > 'z'.charCodeAt(0)) || (str.indexOf('--') != -1) || (str.indexOf('-') == 0)  || (str.lastIndexOf('-') == nbc-1)) 
        {
            return false ;
        }
    }
    return true ;   
}
 
function IsExt(str)
{
    var i, j, car, nbb, T ;
    str = str.toLowerCase() ;
    T = str.split('.') ;
    nbb = T.length ;
                
    if(nbb > 2)
        return false ;
                    
    for(i = 0 ; i < nbb ; i++)
    {
        if(T[i].length < 2)
        {
            return false ;
        }
                        
        for(j = 0 ; j < T[i].length ; j++)
        {
            car = T[i].charCodeAt(j) ;  
            if((car < 'a'.charCodeAt(0)) ||  (car > 'z'.charCodeAt(0)))
            {
                return false ;
            }
        }
    }
    return true ;
}
 
function IsEmail(email)
{
    var alias, domaine, sext, ext, pos1_a, pos2_a, pos1_p, pos2_p, pos3_p ;
    var nbc = email.length ;
                
    if(nbc < 7)
    {
        return false ;
    }       
    pos1_a = email.indexOf('@') ;
    pos2_a = email.lastIndexOf('@') ;
                
    if((pos1_a < 1) || (pos1_a != pos2_a))
    {
        return false ;
    }       
    if(!IsAlias(email.substring(0, pos1_a)))
    {
        return false ;
    }       
    pos1_p = email.indexOf('.', pos1_a +1) ;        
    if(pos1_p - pos1_a < 3)
    {
        return false ;
    }       
    if(!IsDomaine(email.substring(pos1_a +1, pos1_p)))
    {
        return false ;
    }       
    if(!IsExt(email.substr(pos1_p +1)))
    {
        return false ;
    }
    return true ;   
}

function IsPositifInt(str)
{
    var i, ls = str.length, car ;
    if(ls == 0)
        return false ;
        
    for(i = 0 ; i < ls ; i++)
    {
        car = str.charCodeAt(i) ;
        if((car < 48) || (car > 57))
        {
            return false ;
        }
    }
    return true ;
}

function IsTel(str)
{
    var i, ls = str.length, car ;
    if(ls == 0)
        return false ;
        
    for(i = 0 ; i < ls ; i++)
    {
        car = str.charCodeAt(i) ;
        if(((car < 48) && (car != 32)) || (car > 57))
        {
            return false ;
        }
    }
    return true ;
}

function AllTrim(str)
{
    while(str.indexOf('  ') != -1)
    {
        str = str.replace(/  /g, ' ') ;
    }
    if(str.indexOf(' ') == 0)
    {
        str = str.substr(1) ;
    }
    if(str.lastIndexOf(' ') == str.length-1)
    {
        str = str.substr(0, str.length-1) ;
    }
    return str ;
}

function Verif() {
    var Login = document.getElementById('TLogin');
    var Passwd = document.getElementById('TPasswd');
    var msg = '';
    if (Login.value.length < 4) {
        msg = msg + '\n - Login';
        ChangeBackColor(Login, col1);
    }
    if (Passwd.value.length < 7) {
        msg = msg + '\n - Mot de passe';
        ChangeBackColor(Passwd, col1);
    }
    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('LoginForm').submit();
}

function VerifLogin() {
    var Login = document.getElementById('TLog_in');
    if (Login.value.length < 4) {
        ChangeBackColor(Login, col1);
        alert('Veuillez saisir votre login');
        return;
    }
    document.getElementById('BTValider').disabled = true;
    document.getElementById('PassForm').submit();
}

function VerifCompte() {
    var Log     = document.getElementById('TLog');
    var Pass    = document.getElementById('TPass');
    var Nom     = document.getElementById('TNom');
    var Prenom  = document.getElementById('TPrenom');
    var Email   = document.getElementById('TEmail');
    var Tel     = document.getElementById('TTel');
    var Superf  = document.getElementById('TSuperficie');
    var NbrChbr = document.getElementById('TNbrChambres');
    var NbrSal  = document.getElementById('TNbrSalons');
    var Captcha = document.getElementById('TCaptcha');
    var msg = '';

    Log.value = AllTrim(Log.value);
    Nom.value = AllTrim(Nom.value);
    Prenom.value = AllTrim(Prenom.value);
    Email.value = AllTrim(Email.value);
    Tel.value = AllTrim(Tel.value);

    if (Log.value.length < 4) {
        msg = msg + '\n - Login';
        ChangeBackColor(Log, col1);
    }
    if (Pass.value.length < 7) {
        msg = msg + '\n - Mot de passe';
        ChangeBackColor(Pass, col1);
    }
    if (Nom.value.length < 2) {
        msg = msg + '\n - Nom';
        ChangeBackColor(Nom, col1);
    }
    if (Prenom.value.length < 2) {
        msg = msg + '\n - Prénom';
        ChangeBackColor(Prenom, col1);
    }
    if (!IsEmail(Email.value)) {
        msg = msg + '\n - Email';
        ChangeBackColor(Email, col1);
    }
    if (!IsTel(Tel.value)) {
        msg = msg + '\n - Téléphone';
        ChangeBackColor(Tel, col1);
    }
    if(Superf.value.length > 0)
    {
        if (!IsPositifInt(Superf.value)) {
            msg = msg + '\n - Superficie';
            ChangeBackColor(Superf, col1);
        }
    }
    if(NbrChbr.value.length > 0)
    {
        if (!IsPositifInt(NbrChbr.value)) {
            msg = msg + '\n - Nombre de chambres';
            ChangeBackColor(NbrChbr, col1);
        }
    }
    if(NbrSal.value.length > 0)
    {   
    if (!IsPositifInt(NbrSal.value)) {
            msg = msg + '\n - Nombre de salons';
            ChangeBackColor(NbrSal, col1);
        }
    }
    if (Captcha.value.length < 5) {
        msg = msg + '\n - Code se securité';
        ChangeBackColor(Captcha, col1);
    }
    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('BTValider').disabled = true;
    document.getElementById('CompteForm').submit(); 
}

function VerifInfos(ope) {
    var Nom     = document.getElementById('TNom');
    var Prenom  = document.getElementById('TPrenom');
    var Email   = document.getElementById('TEmail');
    var Tel     = document.getElementById('TTel');
    var Superf  = document.getElementById('TSuperficie');
    var NbrChbr = document.getElementById('TNbrChambres');
    var NbrSal  = document.getElementById('TNbrSalons');
    var msg = '';

    Nom.value = AllTrim(Nom.value);
    Prenom.value = AllTrim(Prenom.value);
    Email.value = AllTrim(Email.value);
    Tel.value = AllTrim(Tel.value);

    if (Nom.value.length < 2) {
        msg = msg + '\n - Nom';
        ChangeBackColor(Nom, col1);
    }
    if (Prenom.value.length < 2) {
        msg = msg + '\n - Prénom';
        ChangeBackColor(Prenom, col1);
    }
    if (!IsEmail(Email.value)) {
        msg = msg + '\n - Email';
        ChangeBackColor(Email, col1);
    }
    if (!IsTel(Tel.value)) {
        msg = msg + '\n - Téléphone';
        ChangeBackColor(Tel, col1);
    }
    if(Superf.value.length > 0)
    {
        if (!IsPositifInt(Superf.value)) {
            msg = msg + '\n - Superficie';
            ChangeBackColor(Superf, col1);
        }
    }
    if(NbrChbr.value.length > 0)
    {
        if (!IsPositifInt(NbrChbr.value)) {
            msg = msg + '\n - Nombre de chambres';
            ChangeBackColor(NbrChbr, col1);
        }
    }
    if(NbrSal.value.length > 0)
    {   
    if (!IsPositifInt(NbrSal.value)) {
            msg = msg + '\n - Nombre de salons';
            ChangeBackColor(NbrSal, col1);
        }
    }
    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('BTModifierInfos').disabled = true;
    document.getElementById('BTModifierPass').disabled = true;
    document.getElementById('TOpe').value = ope ;
    document.getElementById('CompteForm').submit();
}
*/

/*
function VerifPass(ope) {
    var OldPass    = document.getElementById('TOldPass');
    var NewPass    = document.getElementById('TNewPass');
    var ConfPass   = document.getElementById('TConfPass');
    var msg = '';

    if (OldPass.value.length < 7) {
        msg = msg + '\n - L\'ancien mot de passe';
        ChangeBackColor(OldPass, col1);
    }
    if (NewPass.value.length < 7) {
        msg = msg + '\n - Le nouveau mot de passe';
        ChangeBackColor(NewPass, col1);
    }
    if (ConfPass.value.length < 7) {
        msg = msg + '\n - Le mot de passe de confirmation';
        ChangeBackColor(ConfPass, col1);
    }
    if (ConfPass.value !=  NewPass.value) {
        msg = msg + '\n - Le nouveau mot de passe est différent du mot de passe de confirmation';
        ChangeBackColor(ConfPass, col1);
        ChangeBackColor(NewPass, col1);
    }

    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('BTModifierInfos').disabled = true;
    document.getElementById('BTModifierPass').disabled = true;
    document.getElementById('TOpe').value = ope ;
    document.getElementById('CompteForm').submit();
}
*/

/*
function ChangeBackColor(obj, color) {
    obj.style.backgroundColor = color;
}
*/

/*
function VerifContact() {
    var Nom = document.getElementById('TNom');
    var Prenom = document.getElementById('TPrenom');
    var Email = document.getElementById('TEmail');
    var Tel = document.getElementById('TTel');
    var Message = document.getElementById('TMessage');
    var Captcha = document.getElementById('TCaptcha');
    var msg = '';

    Nom.value = AllTrim(Nom.value);
    Prenom.value = AllTrim(Prenom.value);
    Email.value = AllTrim(Email.value);
    Tel.value = AllTrim(Tel.value);
    Message.value = AllTrim(Message.value);

    if (Nom.value.length < 2) {
        msg = msg + '\n - Nom';
        ChangeBackColor(Nom, col1);
    }
    if (Prenom.value.length < 2) {
        msg = msg + '\n - Prénom';
        ChangeBackColor(Prenom, col1);
    }
    if (!IsEmail(Email.value)) {
        msg = msg + '\n - Email';
        ChangeBackColor(Email, col1);
    }
    if (!IsTel(Tel.value)) {
        msg = msg + '\n - Téléphone';
        ChangeBackColor(Tel, col1);
    }
    if (Message.value.length < 10) {
        msg = msg + '\n - Message';
        ChangeBackColor(Message, col1);
    }
    if (Captcha.value.length < 5) {
        msg = msg + '\n - Code se securité';
        ChangeBackColor(Captcha, col1);
    }
    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('TMsg').value = FormatText(Message.value);
    document.getElementById('BTValider').disabled = true;
    document.getElementById('ContactForm').submit(); 
}
*/