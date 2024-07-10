<%
Dim RecSet
Dim RecAux
Dim SQL 

Dim c03id 

Dim conn
Dim connString

connString = "Provider=SQLOLEDB; Data Source=DESKTOP-SOSJBEB; Initial Catalog=Docs; User ID=JoaoL; Password=123456789;"

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connString



%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/principal.css">
    <link rel="stylesheet" href="../css/header.css">
    <script src="../js/dashboard.js" defer></script>
    <title></title>
</head>
<body>
    <!-- #include file="../cabecalho.html" -->
    <!-- para criar um bloco de notas novo no mobile eu quero que abra um bloco novo se a pessoa arrastar a tela para a esquerda -->
    <form name="frm">
    <input type="hidden" name="c03id" value="<%=c03id%>"/>
    </form>
    <div id="corpo-docs">
        <div class="documento-lay" id="novo-documento">
            <div></div>
            <p>Novo Documento</p>
        </div>
        <%
            Response.Write szDocumentos()
        %>
    </div>
</body>
</html>
<%
Function szDocumentos()
Dim SQL
Dim RecAux
Dim todosDocumentos
Dim i 

SQL = "SELECT * FROM documentos"
Set RecAux = conn.execute(SQL)

' i = 1
while Not RecAux.EOF 
    todosDocumentos = todosDocumentos _
    & "<div class='documento-lay' id='novo-documento'>" _ 
    & "<div></div>" _
    & "<p>" & RecAux("titulo") & "</p>" _ 
    & "</div>"
    RecAux.MoveNext 
wend 

szDocumentos = todosDocumentos
End Function 
%>