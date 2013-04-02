<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<!--#include file="Conexion.asp"-->
<%
dim consulta_sql

'consulta para alimentar el paginador
consulta_sql = "SELECT a.codigo_tarea, a.nombre_tarea, a.descripcion_tarea, b.nombre_proyecto FROM tm_tarea a, tm_proyecto b WHERE a.codigo_proyecto = b.codigo_proyecto ORDER BY codigo_tarea"


%>