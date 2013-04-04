<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<%
dim consulta_sql

'consulta para alimentar el paginador
consulta_sql = "SELECT a.codigo_tarea, a.nombre_tarea, a.descripcion_tarea, b.nombre_proyecto FROM tm_tarea a, tm_proyecto b WHERE a.codigo_proyecto = b.codigo_proyecto ORDER BY nombre_tarea"

'funcion que realiza la accion de insertar un nuevo registro en la tabla tm_tarea
function agregarTarea(nombre, descripcion, proyecto)
	dim insert_tm_tarea
	
	conexion.open parametros_conexion
	
	insert_tm_tarea = "INSERT INTO tm_tarea(codigo_tarea, nombre_tarea, descripcion_tarea, codigo_proyecto) VALUES((SELECT MAX(codigo_tarea)+1 FROM tm_tarea), '"&nombre&"', '"&descripcion&"', '"&proyecto&"')"
	conexion.execute(insert_tm_tarea)
	
	conexion.close
end function

'funcion que realiza la accion de eliminar un registro de la tabla tm_tarea
function eliminarTarea(codigo)
	dim delete_tarea
	
	conexion.open parametros_conexion
	
	delete_tarea = "DELETE FROM tm_tarea WHERE codigo_tarea = '"&codigo&"'"
	conexion.execute(delete_tarea)
	
	conexion.close
end function

'funcion que devuelve un vector con los datos de un registro que se desea consultar de la tabla tm_tarea
function buscarTarea(codigo)
	dim select_tm_tarea, tm_tarea(3), registros_tm_tarea
	
	conexion.open parametros_conexion
	
	set registros_tm_tarea = server.createobject("ADODB.recordset")		
	select_tm_tarea = "SELECT a.codigo_tarea, a.nombre_tarea, a.descripcion_tarea, b.nombre_proyecto FROM tm_tarea a, tm_proyecto b WHERE a.codigo_proyecto = b.codigo_proyecto AND codigo_tarea = '"&cint(codigo)&"'"
	registros_tm_tarea.open select_tm_tarea, conexion, 1, 2
	
	do while not registros_tm_tarea.eof
        tm_tarea(0) = registros_tm_tarea("codigo_tarea")
		tm_tarea(1) = registros_tm_tarea("nombre_tarea")
		tm_tarea(2) = registros_tm_tarea("descripcion_tarea")
		tm_tarea(3) = registros_tm_tarea("nombre_proyecto")
		
		registros_tm_tarea.movenext
	loop
	
	registros_tm_tarea.close
	set registros_tm_tarea = nothing
	
	conexion.close
	
	buscarTarea = tm_tarea
end function

'funcion que realiza la accion de modificar un registro de la tabla tm_tarea
function modificarTarea(codigo, nombre, descripcion, proyecto)
	dim update_tarea
	
	conexion.open parametros_conexion
	
	update_tarea = "UPDATE tm_tarea SET nombre_tarea = '"&nombre&"', descripcion_tarea = '"&descripcion&"', codigo_proyecto = '"&proyecto&"' WHERE codigo_tarea = '"&codigo&"'"
	conexion.execute(update_tarea)
	
	conexion.close
end function
%>