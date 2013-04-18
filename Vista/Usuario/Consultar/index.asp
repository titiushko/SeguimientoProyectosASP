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
		<link rel="stylesheet" href="../../_Recursos/CSS/patron.css" type="text/css"/>
	</head>
	<body id="formato">
		<div id="cabeza">
			<h1>SEGUIMIENTO DE PROYECTOS</h1>
		</div>
		<div id="cuerpo">
			<h2>MANTENIMIENTO DE PROYECTOS</h2>
			<a href="../Agregar/" title="Agregar Nuevo Usuario">Agregar</a><br/><br/>
			<!--#include file="../../_Recursos/ASP/Paginador_parte1.asp"-->
			<table border="1" class="cuadricula tabla">
				<thead>
					<tr>
						<th>Usuario</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Fecha de Nacimiento</th>
						<th colspan="2">Mantenimiento</th>
					</tr>
				</thead>
				<tbody>
				<%
				cuantos_registros = 0
				do while not registros.eof and cuantos_registros < tam_pagina
				%>
				<tr>
					<td><%= registros.fields("codigo_usuario") %></td>
					<td><%= registros.fields("nombres_usuario") %></td>
					<td><%= registros.fields("apellidos_usuario") %></td>
					<td><%= registros.fields("nacimiento_usuario") %></td>
					<td class="mantenimiento"><form action="../Modificar/" method="post"><input type="text" name="codigo_usuario" class="oculto" value="<%= registros.fields("codigo_usuario") %>"/><input type="submit" value="Editar"/></form></td>
					<td class="mantenimiento"><form action="../Eliminar/" method="post"><input type="text" name="codigo_usuario" class="oculto" value="<%= registros.fields("codigo_usuario") %>"/><input type="submit" value="Eliminar"/></form></td>
				</tr>
				<%
					cuantos_registros = cuantos_registros + 1
					registros.movenext
				loop
				%>
				</tbody>
			</table>
			<!--#include file="../../_Recursos/ASP/Paginador_parte2.asp"-->
			<br/><a href="../../../" title="Volver a la Pagina de Inicio">Volver</a>
		</div>
	</body>
</html>