<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Proyecto.asp"-->
<%
	dim consulta_sql
	consulta_sql = sqlProyecto()
%>
<html>
	<head>
		<title>Seguimiento de Proyectos</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="../../_Recursos/CSS/patron.css" type="text/css"/>
        <script type="text/javascript" src="../../_Recursos/JS/funciones.js"></script>
	</head>
	<body id="medio_formato" onLoad="document.forms[0].user0.focus()">
		<div id="medio_cuerpo">
			<!--#include file="../../_Recursos/ASP/Paginador_parte1.asp"-->
			<form>
			<table border="1" class="cuadricula tabla">
				<thead>
					<tr>
						<th>Nombre Proyecto</th>
						<th>Descripcion Proyecto</th>
						<th>Fecha de Inicio</th>
						<th>Fecha de Finalizacion</th>
						<th>Responsable Proyecto</th>
					</tr>
				</thead>
				<tbody>
				<%
				cuantos_registros = 0
				do while not registros.eof and cuantos_registros < tam_pagina
				%>
				<tr>
					<td><input size="13" name="user<%= cuantos_registros %>" onKeyPress="return soloFlechas(event), movimientoVertical(event,<%= cuantos_registros %>)" onFocus="mostrarTareasXProyecto('<%= registros.fields("codigo_proyecto") %>')" onClick="mostrarTareasXProyecto('<%= registros.fields("codigo_proyecto") %>')" type="text" value="<%= registros.fields("nombre_proyecto") %>"/></td>
					<td><%= registros.fields("descripcion_proyecto") %></td>
					<td><%= registros.fields("inicio_proyecto") %></td>
					<td><%= registros.fields("fin_proyecto") %></td>
					<td><%= registros.fields("responsable_proyecto") %></td>
				</tr>
				<%
					cuantos_registros = cuantos_registros + 1
					registros.movenext
				loop
				%>
				</tbody>
			</table>
			</form>
			<!--#include file="../../_Recursos/ASP/Paginador_parte2.asp"-->
		</div>
	</body>
</html>