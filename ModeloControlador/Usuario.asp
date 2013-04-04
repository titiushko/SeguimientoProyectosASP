<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<%
'funcion que devuelve un string con la sentencia select de los registros que se encuentran en la tabla tm_usuario para alimentar el paginador
function sqlUsuario()
	sqlUsuario = "SELECT codigo_usuario, nombres_usuario, apellidos_usuario, nacimiento_usuario, password_usuario FROM tm_usuario ORDER BY codigo_usuario"
end function

'funcion que devuelve una matriz con todos los registros que se encuentran en la tabla tm_usuario
function consultarUsuarios()
	dim select_tm_usuario, cantidad_usuarios, tm_usuario(), registros_tm_usuario
	
	conexion.open parametros_conexion
	
	set registros_tm_usuario = server.createobject("ADODB.recordset")		
	select_tm_usuario = sqlUsuario()
	registros_tm_usuario.open select_tm_usuario, conexion, 1, 2
	
	cantidad_usuarios = 0
	redim tm_usuario(registros_tm_usuario.recordcount-1,5)
	do while not registros_tm_usuario.eof
		tm_usuario(cantidad_usuarios,0) = registros_tm_usuario("codigo_usuario")
		tm_usuario(cantidad_usuarios,1) = registros_tm_usuario("nombres_usuario")
		tm_usuario(cantidad_usuarios,2) = registros_tm_usuario("apellidos_usuario")
		tm_usuario(cantidad_usuarios,3) = registros_tm_usuario("nacimiento_usuario")
		tm_usuario(cantidad_usuarios,4) = registros_tm_usuario("password_usuario")
		cantidad_usuarios = cantidad_usuarios + 1
		
		registros_tm_usuario.movenext
	loop
	
	registros_tm_usuario.close
	set registros_tm_usuario = nothing
	
	conexion.close
	
	consultarUsuarios = tm_usuario
end function

'funcion que realiza la accion de insertar un nuevo registro en la tabla tm_usuario
function agregarUsuario(codigo, nombres, apellidos, nacimiento, password)
	dim insert_tm_usuario
	
	conexion.open parametros_conexion
	
	insert_tm_usuario = "INSERT INTO tm_usuario(codigo_usuario, nombres_usuario, apellidos_usuario, nacimiento_usuario, password_usuario) VALUES('"&codigo&"', '"&nombres&"', '"&apellidos&"', '"&nacimiento&"', '"&password&"')"
	conexion.execute(insert_tm_usuario)
	
	conexion.close
end function

'funcion que devuelve un vector con los datos de un registro que se desea consultar de la tabla tm_usuario
function buscarUsuario(codigo)
	dim select_tm_usuario, tm_usuario(4), registros_tm_usuario
	
	conexion.open parametros_conexion
	
	set registros_tm_usuario = server.createobject("ADODB.recordset")		
	select_tm_usuario = "SELECT codigo_usuario, nombres_usuario, apellidos_usuario, nacimiento_usuario, password_usuario FROM tm_usuario WHERE codigo_usuario = '"&codigo&"'"
	registros_tm_usuario.open select_tm_usuario, conexion, 1, 2
	
	do while not registros_tm_usuario.eof
		tm_usuario(0) = registros_tm_usuario("codigo_usuario")
		tm_usuario(1) = registros_tm_usuario("nombres_usuario")
		tm_usuario(2) = registros_tm_usuario("apellidos_usuario")
		tm_usuario(3) = registros_tm_usuario("nacimiento_usuario")
		tm_usuario(4) = registros_tm_usuario("password_usuario")
		
		registros_tm_usuario.movenext
	loop
	
	registros_tm_usuario.close
	set registros_tm_usuario = nothing
	
	conexion.close
	
	buscarUsuario = tm_usuario
end function

'funcion que realiza la accion de modificar un registro de la tabla tm_usuario
function modificarUsuario(codigo, identificador, nombres, apellidos, nacimiento, password)
	dim update_usuario
	
	conexion.open parametros_conexion
	
	update_usuario = "UPDATE tm_usuario SET codigo_usuario = '"&identificador&"', nombres_usuario = '"&nombres&"', apellidos_usuario = '"&apellidos&"', nacimiento_usuario = '"&nacimiento&"', password_usuario = '"&password&"' WHERE codigo_usuario = '"&codigo&"'"
	conexion.execute(update_usuario)
	
	conexion.close
end function

'funcion que realiza la accion de eliminar un registro de la tabla tm_usuario
function eliminarUsuario(codigo)
	dim delete_responsable, delete_tarea, delete_proyecto, delete_usuario
	
	conexion.open parametros_conexion

    delete_responsable = "DELETE FROM tm_responsable WHERE codigo_tarea IN(SELECT codigo_tarea FROM tm_tarea WHERE codigo_proyecto IN(SELECT codigo_proyecto FROM tm_proyecto WHERE responsable_proyecto = '"&codigo&"')) OR  codigo_usuario = '"&codigo&"'"
	conexion.execute(delete_responsable)

	delete_tarea = "DELETE FROM tm_tarea WHERE codigo_proyecto IN(SELECT codigo_proyecto FROM tm_proyecto WHERE responsable_proyecto = '"&codigo&"')"
	conexion.execute(delete_tarea)
	
	delete_proyecto = "DELETE FROM tm_proyecto WHERE responsable_proyecto = '"&codigo&"'"
	conexion.execute(delete_proyecto)
	
	delete_usuario = "DELETE FROM tm_usuario WHERE codigo_usuario = '"&codigo&"'"
	conexion.execute(delete_usuario)
	
	conexion.close
end function

'funcion que devuelve un vector con el listado de todos los usuarios que existen en la tabla tm_usuario
function listaUsuarios()
	dim select_tm_usuario, cantidad_usuarios, tm_usuario(), registros_tm_usuario
	
	conexion.open parametros_conexion
	
	set registros_tm_usuario = server.createobject("ADODB.recordset")		
	select_tm_usuario = "SELECT codigo_usuario FROM tm_usuario ORDER BY codigo_usuario"
	registros_tm_usuario.open select_tm_usuario, conexion, 1, 2
	
	cantidad_usuarios = 0
	redim tm_usuario(registros_tm_usuario.recordcount-1)
	do while not registros_tm_usuario.eof
		tm_usuario(cantidad_usuarios) = registros_tm_usuario("codigo_usuario")
		cantidad_usuarios = cantidad_usuarios + 1
		
		registros_tm_usuario.movenext
	loop
	
	registros_tm_usuario.close
	set registros_tm_usuario = nothing
	
	conexion.close
	
	listaUsuarios = tm_usuario
end function

'se elimina el objeto conexion
'set conexion = nothing
%>