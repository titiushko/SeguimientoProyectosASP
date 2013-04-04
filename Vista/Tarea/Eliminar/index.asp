<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Tarea.asp"-->
<%
	dim tm_tarea
	tm_tarea = buscarTarea(request.form("codigo_tarea"))
	eliminarTarea(request.form("codigo_tarea"))
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
			<h2>ELIMINAR TAREA</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Nombre:</th><td><input name="nombre" type="text" value="<%= tm_tarea(1) %>" disabled="disabled"/></td></tr>
                <tr><th align="right">Descripcion:</th><td><textarea disabled="disabled"><%= tm_tarea(2) %></textarea></td></tr>
				<tr><th align="right">Proyecto:</th><td><input name="fin" type="text" value="<%= tm_tarea(3) %>" disabled="disabled"/></td></tr>
			</table>
			<p>Se elimino el proyecto exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Tareas">Volver</a>
		</div>
	</body>
</html>