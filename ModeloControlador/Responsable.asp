<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<%
'funcion que devuelve un string con la sentencia select de los registros que se encuentran en la tabla tm_responsable para alimentar el paginador
function sqlResponsable()
	sqlResponsable = "SELECT a.codigo_responsable, b.nombre_tarea, c.codigo_usuario FROM tm_responsable a JOIN tm_tarea b ON(a.codigo_tarea = b.codigo_tarea) JOIN tm_usuario c ON(a.codigo_usuario = c.codigo_usuario) ORDER BY a.codigo_responsable"
end function

'funcion que devuelve un vector con los datos de un registro que se desea consultar de la tabla tm_responsable
function buscarResponsable(codigo)
	dim select_tm_responsable, tm_responsable(2), registros_tm_responsable
	
	conexion.open parametros_conexion
	
	set registros_tm_responsable = server.createobject("ADODB.recordset")
	select_tm_responsable = "SELECT a.codigo_responsable, b.nombre_tarea, c.codigo_usuario FROM tm_responsable a JOIN tm_tarea b ON(a.codigo_tarea = b.codigo_tarea) JOIN tm_usuario c ON(a.codigo_usuario = c.codigo_usuario) WHERE a.codigo_responsable = '"&cint(codigo)&"'"
	registros_tm_responsable.open select_tm_responsable, conexion, 1, 2
	
	do while not registros_tm_responsable.eof
		tm_responsable(0) = registros_tm_responsable("codigo_responsable")
		tm_responsable(1) = registros_tm_responsable("nombre_tarea")
		tm_responsable(2) = registros_tm_responsable("codigo_usuario")
		
		registros_tm_responsable.movenext
	loop
	
	registros_tm_responsable.close
	set registros_tm_responsable = nothing
	
	conexion.close
	
	buscarResponsable = tm_responsable
end function

'funcion que realiza la accion de modificar un registro de la tabla tm_responsable
function modificarResponsable(codigo, tarea, usuario)
	dim update_responsable
	
	conexion.open parametros_conexion
	
	update_responsable = "UPDATE tm_responsable SET codigo_tarea = '"&tarea&"', codigo_usuario = '"&usuario&"' WHERE codigo_responsable = '"&cint(codigo)&"'"
	conexion.execute(update_responsable)
	
	conexion.close
end function

'funcion que devuelve una matriz con todos los registros que se encuentran en la tabla tm_responsable
function consulResponsables()
	dim select_tm_responsable, cantidad_responsables, tm_responsable(), registros_tm_responsable
	
	conexion.open parametros_conexion
	
	set registros_tm_responsable = server.createobject("ADODB.recordset")
	select_tm_responsable = sqlResponsable()
	registros_tm_responsable.open select_tm_responsable, conexion, 1, 2
	
	cantidad_responsables = 0
	redim tm_responsable(registros_tm_responsable.recordcount-1,2)
	do while not registros_tm_responsable.eof
		tm_responsable(cantidad_responsables,0) = registros_tm_responsable("codigo_responsable")
		tm_responsable(cantidad_responsables,1) = registros_tm_responsable("codigo_tarea")
		tm_responsable(cantidad_responsables,2) = registros_tm_responsable("codigo_usuario")
		cantidad_responsables = cantidad_responsables + 1
		
		registros_tm_responsable.movenext
	loop
	
	registros_tm_responsable.close
	set registros_tm_responsable = nothing
	
	conexion.close
	
	consultarResponsables = tm_responsable
end function
%>