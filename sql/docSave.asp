<%

Dim SQL 
Dim RecSet

Dim conn
Dim connString

Dim html

connString = "Provider=SQLOLEDB; Data Source=DESKTOP-SOSJBEB; Initial Catalog=Docs; User ID=JoaoL; Password=123456789;"

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connString

html = request("html")
' Response.Write html

SQL = "INSERT INTO documentos (id,html) VALUES (1,'" & html & "')"
conn.execute(SQL)

' Definir o tipo de conteúdo como JSON
Response.ContentType = "application/json"


%>