<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Proyecto.asp"-->
<%
	agregarProyecto request.form("nombre"),request.form("descripcion"),request.form("inicio"),request.form("fin"),request.form("responsable")
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
			<h2>AGREGAR PROYECTO</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Nombre:</th><td><input type="text" value="<%= request.form("nombre") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Descripcion:</th><td><textarea disabled="disabled"><%= request.form("descripcion") %></textarea></td></tr>
				<tr><th align="right">Fecha de Inicio:</th><td><input type="text" value="<%= request.form("inicio") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Fecha de Finalizacion:</th><td><input type="text" value="<%= request.form("fin") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Responsable:</th><td><input type="text" value="<%= request.form("responsable") %>" disabled="disabled"/></td></tr>
			</table>
			<p>Se agrego el proyecto exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Proyectos">Volver</a>
		</div>
	</body>
</html>