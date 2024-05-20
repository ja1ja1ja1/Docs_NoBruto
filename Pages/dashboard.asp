<%
Dim RecSet
Dim RecAux
Dim SQL 

Dim c03id 


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
    <footer id="footer-dashboard">
        <button type="submit">
            +
        </button>
    </footer>
</body>
</html>
<%
Function szDocumentos()
Dim SQL 
Dim todosDocumentos
Dim i 

' i = 1
For i = 1 To 5
    todosDocumentos = todosDocumentos _
    & "<div class='documento-lay' id='novo-documento'>" _ 
    & "<div></div>" _
    & "<p>Documento " & i & "</p>" _ 
    & "</div>"

    ' i = i + 1
Next
szDocumentos = todosDocumentos
End Function 
%>