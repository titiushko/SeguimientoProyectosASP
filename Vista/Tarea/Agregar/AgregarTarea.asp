<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Tarea.asp"-->
<!--#include file="../../../ModeloControlador/Proyecto.asp"-->
<%
	dim tm_proyecto
	tm_proyecto = buscarProyecto(request.form("proyecto"))
	agregarTarea request.form("nombre"),request.form("descripcion"),request.form("proyecto")

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
			<h2>AGREGAR TAREA</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Nombre:</th><td><input type="text" value="<%= request.form("nombre") %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Descripcion:</th><td><textarea disabled="disabled"><%= request.form("descripcion") %></textarea></td></tr>
				<tr><th align="right">Proyecto:</th><td><input type="text" value="<%= tm_proyecto(1) %>" disabled="disabled"/></td></tr>
			</table>
			<p>Se agrego la tarea exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Tareas">Volver</a>
		</div>
	</body>
</html>