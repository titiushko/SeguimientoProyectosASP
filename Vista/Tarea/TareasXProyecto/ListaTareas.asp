<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<!--#include file="../../../ModeloControlador/Conexion.asp"-->
<!--#include file="../../../ModeloControlador/Tarea.asp"-->
<%
	dim consulta_sql
    consulta_sql = sqlTareasXProyecto(request.querystring("busqueda"))
%>
<html>
	<head>
		<title>Seguimiento de Proyectos</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="../../_Recursos/CSS/patron.css" type="text/css"/>
		<script type="text/javascript" src="../../_Recursos/JS/funciones.js"></script>
	</head>
	<body id="medio_formato">
		<div id="medio_cuerpo">
			<!--#include file="../../_Recursos/ASP/Paginador_parte1.asp"-->
			<table border="1" class="cuadricula tabla">
				<thead>
					<tr>
						<th>Nombre Tarea</th>
                        <th>Descripcion Tarea</th>
                        <th>Nombre Proyecto</th>
					</tr>
				</thead>
				<tbody>
					<%
					cuantos_registros = 0
					do while not registros.eof and cuantos_registros < tam_pagina
					%>
					<tr>
						<td><%= registros.fields("nombre_tarea") %></td>
						<td><%= registros.fields("descripcion_tarea") %></td>
						<td><%= registros.fields("nombre_proyecto") %></td>
					</tr>
					<%
						cuantos_registros = cuantos_registros + 1
						registros.movenext
					loop
					%>
				</tbody>
			</table>
			<!--#include file="../../_Recursos/ASP/Paginador_parte2.asp"-->
		</div>
	</body>
</html>