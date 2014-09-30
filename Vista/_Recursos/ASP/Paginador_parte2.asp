<!-- W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko -->
<%
	registros.close
	set registros = nothing

	conexion.close
	set conexion = nothing
end if
%>
<hr/>
<center>
	<form name="formulario" method="post">
		<input type="text" name="pagina" class="oculto" value="">
		<%
		if pagina_actual > 1 then
			response.write "<input type='submit' value='<<' onclick='seleccionarPagina("&pagina_actual-1 &")'/>"
		else
			response.write "<input type='submit' value='<<' disabled/>"
		end if
		response.write " Pagina <select>"
		for i = 1 to paginas_totales
			if i = pagina_actual then
				response.write "<option selected>"&i&"</option>"
			else
				response.write "<option onclick='saltarPagina("&i&")'>"&i&"</option>"
			end if
		next
		response.write "</select> de "&paginas_totales
		if pagina_actual < paginas_totales then
			response.write "<input type='submit' value='>>' onclick='seleccionarPagina("&pagina_actual+1 &")'/>"
		else
			response.write "<input type='submit' value='>>' disabled/>"
		end if
		%>
	</form>
</center>
<hr/>
<script type="text/javascript">
	function saltarPagina(numero_pagina){
		document.formulario.pagina.value = numero_pagina;
		document.formulario.submit();
	}
	
	function seleccionarPagina(numero_pagina){
		document.formulario.pagina.value = numero_pagina;
		//location.href = "index.asp";
	}	
</script>