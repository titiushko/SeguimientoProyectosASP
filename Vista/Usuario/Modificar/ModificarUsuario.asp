<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Usuario.asp"-->
<%
	modificarUsuario request.form("codigo"),request.form("identificador"),request.form("nombres"),request.form("apellidos"),request.form("nacimiento"),request.form("password")
%>
<html>
	<head>
		<title>Seguimiento de Proyectos</title>
		<link rel="stylesheet" href="../../_Recursos/CSS/patron.css" type="text/css"/>
	</head>
	<body id="formato">
		<div id="cabeza">
			<h1>SEGUIMIENTO DE PROYECTOS</h1>
		</div>
		<div id="cuerpo">
			<h2>MODIFICAR USUARIO</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Usuario:</th><td><input type="text" value="<%= request.form("identificador") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Nombres:</th><td><input type="text" value="<%= request.form("nombres") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Apellidos:</th><td><input type="text" value="<%= request.form("apellidos") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Fecha de Nacimiento:</th><td><input type="text" value="<%= request.form("nacimiento") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Password:</th><td><input type="password" value="<%= request.form("password") %>" disabled="disabled"/></td></tr>
			</table>
			<p>Se guardaron los cambios exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Usuarios">Volver</a>
		</div>
	</body>
</html>