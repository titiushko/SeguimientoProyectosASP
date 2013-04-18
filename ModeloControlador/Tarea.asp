<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<%
'funcion que devuelve un string con la sentencia select de los registros que se encuentran en la tabla tm_proyecto para alimentar el paginador
function sqlTarea()
	sqlTarea = "SELECT a.codigo_tarea, a.nombre_tarea, a.descripcion_tarea, b.nombre_proyecto FROM tm_tarea a, tm_proyecto b WHERE a.codigo_proyecto = b.codigo_proyecto ORDER BY nombre_tarea"
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

'funcion que devuelve un string con la sentencia select de los registros que se encuentran en la tabla tm_tarea que pertenezcan a un proyecto que se desea consultar
function sqlTareasXProyecto(proyecto)
	dim select_tm_tarea
	
	if responsable = "todos" then
		busqueda = "ORDER BY nombre_tarea"
	else
		busqueda = "WHERE b.codigo_proyecto = "&proyecto&" ORDER BY a.nombre_tarea"
	end if
	select_tm_tarea = "SELECT a.codigo_tarea, a.nombre_tarea, a.descripcion_tarea, b.nombre_proyecto FROM tm_tarea a JOIN tm_proyecto b ON(a.codigo_proyecto = b.codigo_proyecto) "&busqueda
	
	sqlTareasXUsuario = select_tm_tarea
end function

'funcion que devuelve una matriz con todos los registros que se encuentran en la tabla tm_tarea
function consulTareas()
	dim select_tm_tarea, cantidad_tareas, tm_tarea(), registros_tm_tarea
	
	conexion.open parametros_conexion
	
	set registros_tm_tarea = server.createobject("ADODB.recordset")		
	select_tm_tarea = sqlTarea()
	registros_tm_tarea.open select_tm_tarea, conexion, 1, 2
	
	cantidad_tareas = 0
	redim tm_tarea(registros_tm_tarea.recordcount-1,3)
	do while not registros_tm_tarea.eof
		tm_tarea(cantidad_tareas,0) = registros_tm_tarea("codigo_tarea")
		tm_tarea(cantidad_tareas,1) = registros_tm_tarea("nombre_tarea")
		tm_tarea(cantidad_tareas,2) = registros_tm_tarea("descripcion_tarea")
		tm_tarea(cantidad_tareas,3) = registros_tm_tarea("nombre_proyecto")
		cantidad_tareas = cantidad_tareas + 1
		
		registros_tm_tarea.movenext
	loop
	
	registros_tm_tarea.close
	set registros_tm_tarea = nothing
	
	conexion.close
	
	consultarTareas = tm_tarea
end function
%>