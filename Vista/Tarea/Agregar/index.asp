<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Tarea.asp"-->
<%	
	dim tm_proyecto
	tm_proyecto = listaProyectos()
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
			<h2>AGREGAR TAREA</h2>
			<form name="formulario" action="AgregarTarea.asp" method="POST">
			<table border="0" class="tabla">
				<tr><th align="right">Nombre:</th><td><input name="nombre" type="text"/></td></tr>
				<tr><th align="right">Descripcion:</th><td><textarea name="descripcion"></textarea></td></tr>
				<tr>
					<th align="right">Proyecto:</th>
					<td>
						<select name="proyecto">
							<option selected></option>
							<% for i = lbound(tm_proyecto) to ubound(tm_proyecto) %>
							<option value="<%= tm_proyecto(i,0) %>"><%= tm_proyecto(i,1) %></option>
							<% next %>
						</select>
					</td>
				</tr>
				<tr><td align="center"><input type="submit" value="Guardar"/></td><td align="center"><input type="button" value="Cancelar" onClick="location.href = '../Consultar'" title="Volver al Catalogo de Tareas"/></td></tr>
			</table>
			</form>
		</div>
	</body>
</html>