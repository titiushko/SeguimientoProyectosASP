<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Proyecto.asp"-->
<%
	dim tm_proyecto, tm_usuario
	tm_proyecto = buscarProyecto(request.form("codigo_proyecto"))
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
			<h2>MODIFICAR PROYECTO</h2>
			<form name="formulario" action="ModificarProyecto.asp" method="POST">
			<table border="0" class="tabla">
				<input name="codigo" type="text" value="<%= request.form("codigo_proyecto") %>" style="display: none">
				<tr>
					<th align="right">Responsable:</th>
					<td>
						<select name="responsable">
							<%
							for i = lbound(tm_usuario) to ubound(tm_usuario)
								if tm_proyecto(0) = tm_usuario(i) then
							%>
							<option selected><%= tm_usuario(i) %></option>
							<%
								else
							%>
							<option><%= tm_usuario(i) %></option>
							<%
								end if
							next
							%>
						<select>
					</td>
				</tr>
				<tr><th align="right">Nombre:</th><td><input name="nombre" type="text" value="<%= tm_proyecto(1) %>"></td></tr>
				<tr><th align="right">Descripcion:</th><td><textarea name="descripcion"><%= tm_proyecto(2) %></textarea></td></tr>
				<tr><th align="right">Fecha de Inicio:</th><td><input name="inicio" type="text" value="<%= tm_proyecto(3) %>" onClick="displayCalendar(document.formulario.inicio,'yyyy-mm-dd',this)" readonly="readonly"/></td></tr>
				<tr><th align="right">Fecha de Finalizacion:</th><td><input name="fin" type="text" value="<%= tm_proyecto(4) %>" onClick="displayCalendar(document.formulario.fin,'yyyy-mm-dd',this)" readonly="readonly"/></td></tr>
				<tr><td align="center"><input type="submit" value="Guardar"/></td><td align="center"><input type="button" value="Cancelar" onClick="location.href = '../Consultar'" title="Volver al Catalogo de Proyectos"/></td></tr>
			</table>
			</form>
		</div>
	</body>
</html>