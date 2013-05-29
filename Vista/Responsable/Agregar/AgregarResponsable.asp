<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Responsable.asp"-->
<!--#include file="../../../ModeloControlador/Tarea.asp"-->
<%
	dim tm_tarea
	tm_tarea = buscarTarea(request.form("tarea"))
	agregarResponsable request.form("tarea"),request.form("usuario")

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
			<h2>AGREGAR RESPONSABLE</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Tarea:</th><td><input type="text" value="<%= tm_tarea(1) %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Usuario:</th><td><input type="text" value="<%= request.form("usuario") %>" disabled="disabled"/></td></tr>
			</table>
			<p>Se agrego el responsable exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Responsables">Volver</a>
		</div>
	</body>
</html>