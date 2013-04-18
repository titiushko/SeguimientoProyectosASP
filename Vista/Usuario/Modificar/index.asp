<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Usuario.asp"-->
<%
	dim tm_usuario
	tm_usuario = buscarUsuario(request.form("codigo_usuario"))
%>
<html>
	<head>
		<title>Seguimiento de Proyectos</title>
		<link rel="stylesheet" href="../../_Recursos/CSS/patron.css" type="text/css"/>
		<link rel="stylesheet" href="../../_Recursos/Plugins/Calendario/calendario.css" type="text/css"/>
		<script type="text/javascript" src="../../_Recursos/Plugins/Calendario/calendario.js"></script>
	</head>
	<body id="formato">
		<div id="cabeza">
			<h1>SEGUIMIENTO DE PROYECTOS</h1>
		</div>
		<div id="cuerpo">
			<h2>MODIFICAR USUARIO</h2>
			<form name="formulario" action="ModificarUsuario.asp" method="POST">
			<table border="0" class="tabla">
				<input name="codigo" type="text" value="<%= tm_usuario(0) %>" class="oculto"/>
				<tr><th align="right">Usuario:</th><td><input name="identificador" type="text" value="<%= tm_usuario(0) %>"/></td></tr>
				<tr><th align="right">Nombres:</th><td><input name="nombres" type="text" value="<%= tm_usuario(1) %>"/></td></tr>
				<tr><th align="right">Apellidos:</th><td><input name="apellidos" type="text" value="<%= tm_usuario(2) %>"/></td></tr>
				<tr><th align="right">Fecha de Nacimiento:</th><td><input name="nacimiento" type="text" value="<%= tm_usuario(3) %>" onClick="displayCalendar(document.formulario.nacimiento,'yyyy-mm-dd',this)" readonly="readonly"/></td></tr>
				<tr><th align="right">Password:</th><td><input name="password" type="text" value="<%= tm_usuario(4) %>"/></td></tr>
				<tr><td align="center"><input type="submit" value="Guardar"/></td><td align="center"><input type="button" value="Cancelar" onClick="location.href = '../Consultar'" title="Volver al Catalogo de Usuarios"/></td></tr>
			</table>
			</form>
		</div>
	</body>
</html>