<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
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
	</head>
	<body id="formato">
		<div id="cabeza">
			<h1>SEGUIMIENTO DE PROYECTOS</h1>
		</div>
		<div id="cuerpo">
			<h2>MANTENIMIENTO DE PROYECTOS</h2>
			<a href="../Agregar/" title="Agregar Nuevo Proyecto">Agregar</a><br/><br/>
			<!--#include file="../../_Recursos/ASP/Paginador_parte1.asp"-->
			<table border="1" class="cuadricula tabla">
				<thead>
					<tr>
						<th>Responsable Proyecto</th>
						<th>Nombre Proyecto</th>
						<th>Descripcion Proyecto</th>
						<th>Fecha de Inicio</th>
						<th>Fecha de Finalizacion</th>
						<th colspan="2">Mantenimiento</th>
					</tr>
				</thead>
				<tbody>
				<%
				cuantos_registros = 0
				do while not registros.eof and cuantos_registros < tam_pagina
				%>
				<tr>
					<td><%= registros.fields("responsable_proyecto") %></td>
					<td><%= registros.fields("nombre_proyecto") %></td>
					<td><%= registros.fields("descripcion_proyecto") %></td>
					<td><%= registros.fields("inicio_proyecto") %></td>
					<td><%= registros.fields("fin_proyecto") %></td>
					<td class="mantenimiento"><form action="../Modificar/" method="post"><input type="text" name="codigo_proyecto" class="oculto" value="<%= registros.fields("codigo_proyecto") %>"/><input type="submit" value="Editar"/></form></td>
					<td class="mantenimiento"><form action="../Eliminar/" method="post"><input type="text" name="codigo_proyecto" class="oculto" value="<%= registros.fields("codigo_proyecto") %>"/><input type="submit" value="Eliminar"/></form></td>
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