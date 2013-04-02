<%
dim pagina_actual, paginas_totales, tam_pagina, cuantos_registros, registros

'cantidad de registros por pagina
tam_pagina = 10

'se lee que pagina mostrar, la primera vez es la pagina inicial
if request.form("pagina") = "" then
	pagina_actual = 1
else
	pagina_actual = cint(request.form("pagina"))
end if

'crear el objeto y definir las propiedades del recordset
set registros = server.createobject("ADODB.recordset")

'definicion del tamaño de las paginas
registros.pagesize = tam_pagina
registros.cachesize = tam_pagina

'abrir la conexion a la base de datos
conexion.open parametros_conexion

'abrir el recordset
registros.open consulta_sql, conexion, 1, 2

'cantidad de paginas
paginas_totales = registros.pagecount

'comprobar que la pagina actual esta en el rango
if pagina_actual < 1 then 
	pagina_actual = 1
end if
if pagina_actual > paginas_totales then
	pagina_actual = paginas_totales
end if

'generar la paginacion, primero comprobar que la consulta devolvio datos y luego paginamos
'con cuantos_registros se lleva la cuenta del numero de filas que se han sacado, cuando se lleven tam_pagina filas se detiene
if paginas_totales = 0 then
	response.write "<p class='error'>No hay registror que mostrar.</p><br/>"
else
	registros.absolutepage = pagina_actual
%>