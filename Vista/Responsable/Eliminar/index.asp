<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Responsable.asp"-->
<%
	dim tm_responsable
	tm_responsable = buscarResponsable(request.form("codigo_responsable"))
	eliminarResponsable(request.form("codigo_responsable"))
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
			<h2>ELIMINAR RESPONSABLE</h2>
			<table border="0" class="tabla">
				<tr><th align="right">Tarea:</th><td><input name="nombre" type="text" value="<%= tm_responsable(1) %>" disabled="disabled"/></td></tr>
				<tr><th align="right">Usuario:</th><td><input name="nombre" type="text" value="<%= tm_responsable(2) %>" disabled="disabled"/></td></tr>
			</table>
			<p>Se elimino el responsable exitosamente.</p>
			<a href="../Consultar/" title="Volver al Catalogo de Responsables">Volver</a>
		</div>
	</body>
</html>