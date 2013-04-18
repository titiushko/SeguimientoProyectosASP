<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Responsable.asp"-->
<!--#include file="../../../ModeloControlador/Tarea.asp"-->
<!--#include file="../../../ModeloControlador/Usuario.asp"-->
<%
	dim tm_responsable, tm_tarea, tm_usuario
	tm_responsable = buscarResponsable(request.form("codigo_responsable"))
	tm_tarea = listaTareas()
    tm_usuario = listaUsuarios()
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
			<h2>MODIFICAR RESPONSABLE</h2>
			<form name="formulario" action="ModificarResponsable.asp" method="POST">
			<table border="0" class="tabla">
				<input name="codigo" type="text" value="<%= request.form("codigo_responsable") %>" class="oculto"/>
				<tr>
					<th align="right">Tarea:</th>
					<td>
						<select name="tarea">
							<%
							for i = lbound(tm_tarea) to ubound(tm_tarea)
								if tm_responsable(1) = tm_tarea(i,1) then
							%>
							<option value="<%= tm_tarea(i,0) %>" selected="selected"><%= tm_tarea(i,1) %></option>
							<%
								else
							%>
							<option value="<%= tm_tarea(i,0) %>"><%= tm_tarea(i,1) %></option>
							<%
								end if
							next
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th align="right">Usuario:</th>
					<td>
						<select name="usuario">
							<%
							for i = lbound(tm_usuario) to ubound(tm_usuario)
								if tm_responsable(2) = tm_usuario(i) then
							%>
							<option selected="selected"><%= tm_usuario(i) %></option>
							<%
								else
							%>
							<option><%= tm_usuario(i) %></option>
							<%
								end if
							next
							%>
						</select>
					</td>
				</tr>
				<tr><td align="center" colspan="2"><input type="submit" value="Guardar"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Cancelar" onClick="location.href = '../Consultar'" title="Volver al Catalogo de Proyectos"/></td></tr>
			</table>
			</form>
		</div>
	</body>
</html>