<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<%
'funcion que devuelve un string con la sentencia select de los registros que se encuentran en la tabla tm_responsable para alimentar el paginador
function sqlResponsable()
	sqlresponsable = "SELECT a.codigo_responsable, b.nombre_tarea, c.codigo_usuario FROM tm_responsable a JOIN tm_tarea b ON(a.codigo_tarea = b.codigo_tarea) JOIN tm_usuario c ON(a.codigo_usuario = c.codigo_usuario) ORDER BY a.codigo_responsable"
end function
%>