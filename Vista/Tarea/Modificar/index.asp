<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Tarea.asp"-->
<!--#include file="../../../ModeloControlador/Proyecto.asp"-->
<%
	dim tm_tarea, tm_proyecto
	tm_tarea = buscarTarea(request.form("codigo_tarea"))
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
			<h2>MODIFICAR TAREA</h2>
			<form name="formulario" action="ModificarTarea.asp" method="POST">
			<table border="0" class="tabla">
				<input name="codigo" type="text" value="<%= request.form("codigo_tarea") %>" class="oculto"/>
				<tr><th align="right">Nombre:</th><td><input name="nombre" type="text" value="<%= tm_tarea(1) %>"/></td></tr>
				<tr><th align="right">Descripcion:</th><td><textarea name="descripcion"><%= tm_tarea(2) %></textarea></td></tr>
				<tr>
					<th align="right">Proyecto:</th>
					<td>
						<select name="proyecto">
							<option selected="selected"></option>
							<%
							for i = lbound(tm_proyecto) to ubound(tm_proyecto)
								if tm_tarea(3) = tm_proyecto(i,1) then
							%>
							<option value="<%= tm_proyecto(i,0) %>" selected="selected"><%= tm_proyecto(i,1) %></option>
							<%
								else
							%>
							<option value="<%= tm_proyecto(i,0) %>"><%= tm_proyecto(i,1) %></option>
							<%
								end if
							next
							%>
						</select>
					</td>
				</tr>
				<tr><td align="center"><input type="submit" value="Guardar"/></td><td align="center"><input type="button" value="Cancelar" onClick="location.href = '../Consultar'" title="Volver al Catalogo de Proyectos"/></td></tr>
			</table>
			</form>
		</div>
	</body>
</html>