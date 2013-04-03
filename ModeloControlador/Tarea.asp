<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<%
dim consulta_sql

'consulta para alimentar el paginador
consulta_sql = "SELECT a.codigo_tarea, a.nombre_tarea, a.descripcion_tarea, b.nombre_proyecto FROM tm_tarea a, tm_proyecto b WHERE a.codigo_proyecto = b.codigo_proyecto ORDER BY codigo_tarea"

'funcion que devuelve un vector con el listado de todos los proyectos que existen en la tabla tm_proyecto
function listaProyectos()
	dim select_tm_proyecto, cantidad_proyectos, tm_proyecto(), registros_tm_proyecto
	
	conexion.open parametros_conexion
	
	set registros_tm_proyecto = server.createobject("ADODB.recordset")		
	select_tm_proyecto = "SELECT codigo_proyecto, nombre_proyecto FROM tm_proyecto ORDER BY codigo_proyecto"
	registros_tm_proyecto.open select_tm_proyecto, conexion, 1, 2
	
	cantidad_proyectos = 0
	redim tm_proyecto(registros_tm_proyecto.recordcount-1,2)
	do while not registros_tm_proyecto.eof
		tm_proyecto(cantidad_proyectos,0) = registros_tm_proyecto("codigo_proyecto")
        tm_proyecto(cantidad_proyectos,1) = registros_tm_proyecto("nombre_proyecto")
		cantidad_proyectos = cantidad_proyectos + 1
		
		registros_tm_proyecto.movenext
	loop
	
	registros_tm_proyecto.close
	set registros_tm_proyecto = nothing
	
	conexion.close
	
	listaProyectos = tm_proyecto
end function

'funcion que realiza la accion de insertar un nuevo registro en la tabla tm_tarea
function agregarTarea(nombre, descripcion, proyecto)
	dim insert_tm_tarea
	
	conexion.open parametros_conexion
	
	insert_tm_tarea = "INSERT INTO tm_tarea(codigo_tarea, nombre_tarea, descripcion_tarea, codigo_proyecto) VALUES((SELECT MAX(codigo_tarea)+1 FROM tm_tarea), '"&nombre&"', '"&descripcion&"', '"&proyecto&"')"
	conexion.execute(insert_tm_tarea)
	
	conexion.close
end function

'funcion que realiza la accion de eliminar un registro de la tabla tm_tarea
function eliminarProyecto(codigo)
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
%>