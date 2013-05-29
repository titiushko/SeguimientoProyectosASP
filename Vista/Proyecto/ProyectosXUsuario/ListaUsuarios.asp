<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Usuario.asp"-->
<%
	dim consulta_sql
	consulta_sql = sqlUsuario()
%>
<html>
	<head>
		<title>Seguimiento de Proyectos</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="shortcut icon" href="../../_Recursos/Imagenes/proyecto.png"></link>
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
						<th>Usuario</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Fecha de Nacimiento</th>
					</tr>
				</thead>
				<tbody>
					<%
					cuantos_registros = 0
					do while not registros.eof and cuantos_registros < tam_pagina
					%>
					<tr>
						<td><input size="13" name="user<%= cuantos_registros %>" onKeyPress="return soloFlechas(event), movimientoVertical(event,<%= cuantos_registros %>)" onFocus="mostrarProyectosXUsuario('<%= registros.fields("codigo_usuario") %>')" onClick="mostrarProyectosXUsuario('<%= registros.fields("codigo_usuario") %>')" type="text" value="<%= registros.fields("codigo_usuario") %>"></td>
						<td><%= registros.fields("nombres_usuario") %></td>
						<td><%= registros.fields("apellidos_usuario") %></td>
						<td><%= registros.fields("nacimiento_usuario") %></td>
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