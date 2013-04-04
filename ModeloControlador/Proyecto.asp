<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<%
'funcion que devuelve un string con la sentencia select de los registros que se encuentran en la tabla tm_proyecto para alimentar el paginador
function sqlProyecto()
	sqlProyecto = "SELECT codigo_proyecto, nombre_proyecto, descripcion_proyecto, inicio_proyecto, fin_proyecto, responsable_proyecto FROM tm_proyecto ORDER BY nombre_proyecto"
end function

'funcion que devuelve una matriz con todos los registros que se encuentran en la tabla tm_proyecto
function consultarProyectos()
	dim select_tm_proyecto, cantidad_proyectos, tm_proyecto(), registros_tm_proyecto
	
	conexion.open parametros_conexion
	
	set registros_tm_proyecto = server.createobject("ADODB.recordset")		
	select_tm_proyecto = sqlProyecto()
	registros_tm_proyecto.open select_tm_proyecto, conexion, 1, 2
	
	cantidad_proyectos = 0
	redim tm_proyecto(registros_tm_proyecto.recordcount-1,5)
	do while not registros_tm_proyecto.eof
		tm_proyecto(cantidad_proyectos,0) = registros_tm_proyecto("codigo_proyecto")
		tm_proyecto(cantidad_proyectos,1) = registros_tm_proyecto("responsable_proyecto")
		tm_proyecto(cantidad_proyectos,2) = registros_tm_proyecto("nombre_proyecto")
		tm_proyecto(cantidad_proyectos,3) = registros_tm_proyecto("descripcion_proyecto")
		tm_proyecto(cantidad_proyectos,4) = registros_tm_proyecto("inicio_proyecto")
		tm_proyecto(cantidad_proyectos,5) = registros_tm_proyecto("fin_proyecto")
		cantidad_proyectos = cantidad_proyectos + 1
		
		registros_tm_proyecto.movenext
	loop
	
	registros_tm_proyecto.close
	set registros_tm_proyecto = nothing
	
	conexion.close
	
	consultarProyectos = tm_proyecto
end function

'funcion que realiza la accion de insertar un nuevo registro en la tabla tm_proyecto
function agregarProyecto(nombre, descripcion, inicio, fin, responsable)
	dim insert_tm_proyecto
	
	conexion.open parametros_conexion
	
	insert_tm_proyecto = "INSERT INTO tm_proyecto(codigo_proyecto, nombre_proyecto, descripcion_proyecto, inicio_proyecto, fin_proyecto, responsable_proyecto) VALUES((SELECT MAX(codigo_proyecto)+1 FROM tm_proyecto), '"&nombre&"', '"&descripcion&"', '"&inicio&"', '"&fin&"', '"&responsable&"')"
	conexion.execute(insert_tm_proyecto)
	
	conexion.close
end function

'funcion que devuelve un vector con los datos de un registro que se desea consultar de la tabla tm_proyecto
function buscarProyecto(codigo)
	dim select_tm_proyecto, tm_proyecto(4), registros_tm_proyecto
	
	conexion.open parametros_conexion
	
	set registros_tm_proyecto = server.createobject("ADODB.recordset")		
	select_tm_proyecto = "SELECT nombre_proyecto, descripcion_proyecto, inicio_proyecto, fin_proyecto, responsable_proyecto FROM tm_proyecto WHERE codigo_proyecto = '"&cint(codigo)&"'"
	registros_tm_proyecto.open select_tm_proyecto, conexion, 1, 2
	
	do while not registros_tm_proyecto.eof
		tm_proyecto(0) = registros_tm_proyecto("nombre_proyecto")
		tm_proyecto(1) = registros_tm_proyecto("descripcion_proyecto")
		tm_proyecto(2) = registros_tm_proyecto("inicio_proyecto")
		tm_proyecto(3) = registros_tm_proyecto("fin_proyecto")
		tm_proyecto(4) = registros_tm_proyecto("responsable_proyecto")
		
		registros_tm_proyecto.movenext
	loop
	
	registros_tm_proyecto.close
	set registros_tm_proyecto = nothing
	
	conexion.close
	
	buscarProyecto = tm_proyecto
end function

'funcion que realiza la accion de modificar un registro de la tabla tm_proyecto
function modificarProyecto(codigo, responsable, nombre, descripcion, inicio, fin)
	dim update_proyecto
	
	conexion.open parametros_conexion
	
	update_proyecto = "UPDATE tm_proyecto SET responsable_proyecto = '"&responsable&"', nombre_proyecto = '"&nombre&"', descripcion_proyecto = '"&descripcion&"', inicio_proyecto = '"&inicio&"', fin_proyecto = '"&fin&"' WHERE codigo_proyecto = '"&codigo&"'"
	conexion.execute(update_proyecto)
	
	conexion.close
end function

'funcion que realiza la accion de eliminar un registro de la tabla tm_proyecto
function eliminarProyecto(codigo)
	dim delete_responsable, delete_tarea, delete_proyecto
	
	conexion.open parametros_conexion
	
	delete_responsable = "DELETE FROM tm_responsable WHERE codigo_tarea IN(SELECT codigo_tarea FROM tm_tarea WHERE codigo_proyecto = '"&codigo&"')"
	conexion.execute(delete_responsable)
	
	delete_tarea = "DELETE FROM tm_tarea WHERE codigo_proyecto = '"&codigo&"'"
	conexion.execute(delete_tarea)
    
    delete_proyecto = "DELETE FROM tm_proyecto WHERE codigo_proyecto = '"&codigo&"'"
	conexion.execute(delete_proyecto)
	
	conexion.close
end function

'funcion que devuelve un string con la sentencia select de los registros que se encuentran en la tabla tm_proyecto que pertenezcan a un responsable_proyecto que se desea consultar
function sqlProyectosXUsuario(responsable)
	dim select_tm_proyecto
	
	if responsable = "todos" then
		busqueda = "ORDER BY nombre_proyecto"
	else
		busqueda = "WHERE responsable_proyecto = '"&responsable&"' ORDER BY nombre_proyecto"
	end if
	select_tm_proyecto = "SELECT codigo_proyecto, nombre_proyecto, descripcion_proyecto, inicio_proyecto, fin_proyecto, responsable_proyecto FROM tm_proyecto "&busqueda
	
	sqlProyectosXUsuario = select_tm_proyecto
end function

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

'se elimina el objeto conexion
'set conexion = nothing
%>