<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Usuario.asp"-->
<%
	dim tm_usuario
	tm_usuario = buscarUsuario(request.form("codigo_usuario"))
	eliminarUsuario(request.form("codigo_usuario"))
%>
<html>
	<head>
		<title>Seguimiento de Proyectos</title>
		<link rel="shortcut icon" href="../../_Recursos/Imagenes/proyecto.png"></link>
		<link rel="stylesheet" href="../../_Recursos/CSS/patron.css" type="text/css"/>
	</head>
	<body id="formato">
		<div id="cabeza">
			<h1>SEGUIMIENTO DE PROYECTOS</h1>
		</div>
		<div id="cuerpo">
			<h2>ELIMINAR USUARIO</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Usuario:</th><td><input name="codigo" type="text" value="<%= tm_usuario(0) %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Nombres:</th><td><input name="nombres" type="text" value="<%= tm_usuario(1) %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Apellidos:</th><td><input name="apellidos" type="text" value="<%= tm_usuario(2) %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Fecha de Nacimiento:</th><td><input name="nacimiento" type="text" value="<%= tm_usuario(3) %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Password:</th><td><input name="password" type="text" value="<%= tm_usuario(4) %>" disabled="disabled"/></td></tr>
			</table>
			<p>Se elimino el usuario exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Usuarios">Volver</a>
		</div>
	</body>
</html>