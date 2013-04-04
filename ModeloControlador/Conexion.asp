<!-- W.I.P. (Warning Idiot Programmer): Codigo Elvadorado por Titiushko -->
<%
	dim servidor, basedatos, usuario, password, conexion, parametros_conexion
	controlador_local  = "{SQL Server}"
    controlador_remoto = "{SQL Server Native Client 10.0}"
    servidor  = "DELL-PC11\SQLEXPRESS"
	basedatos = "seguimiento_proyecto"
	usuario   = "practica_asp"
	password  = "practica_asp"
	
	'se crea el objeto de la conexion
	set conexion = server.createobject("ADODB.Connection")
	
	'se especifica la ubicacion de la base de datos sql server
	parametros_conexion = "DRIVER="&controlador_remoto&";SERVER="&servidor&";DATABASE="&basedatos&";UID="&usuario&";PWD="&password
%>