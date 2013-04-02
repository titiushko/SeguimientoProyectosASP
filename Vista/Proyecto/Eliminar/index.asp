<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Proyecto.asp"-->
<%
	dim tm_proyecto
	tm_proyecto = buscarProyecto(request.form("codigo_proyecto"))
	eliminarProyecto(request.form("codigo_proyecto"))
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
			<h2>ELIMINAR PROYECTO</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Responsable:</th><td><input name="responsable" type="text" value="<%= tm_proyecto(0) %>" disabled="disabled"></td></tr>
				<tr><th align="right">Nombre:</th><td><input name="nombre" type="text" value="<%= tm_proyecto(1) %>" disabled="disabled"></td></tr>
				<tr><th align="right">Descripcion:</th><td><input name="descripcion" type="text" value="<%= tm_proyecto(2) %>" disabled="disabled"></td></tr>
				<tr><th align="right">Fecha de Inicio:</th><td><input name="inicio" type="text" value="<%= tm_proyecto(3) %>" disabled="disabled"></td></tr>
				<tr><th align="right">Fecha de Finalizacion:</th><td><input name="fin" type="text" value="<%= tm_proyecto(4) %>" disabled="disabled"></td></tr>
			</table>
			<p>Se elimino el proyecto exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Proyectos">Volver</a>
		</div>
	</body>
</html>