/* W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko */
function mostrarProyectosXUsuario(codigo_usuario){
	//location.href = "ListaProyectos.asp?busqueda="+codigo_usuario;
	window.open('ListaProyectos.asp?busqueda='+codigo_usuario,'lista_proyectos');
}

function mostrarTareasXProyectoXUsuario(codigo) {
	window.open('ListaTareas.asp?busqueda=' + codigo, 'lista_tareas');
}

function soloFlechas(elEvento){
	var evento = elEvento || window.event;
	var codigoCaracter = evento.charCode || evento.keyCode;
	
	if(!((codigoCaracter >= 37 && codigoCaracter <= 40) || codigoCaracter == 9)){
		return false;
	}
	
	return true;
}

function movimientoVertical(elEvento,i){
	var evento = elEvento || window.event;
	var codigoCaracter = evento.charCode || evento.keyCode;
	var elemento;
	
	if(codigoCaracter == 38){elemento = eval("document.forms[0].user"+(i-1)); elemento.focus();}
	if(codigoCaracter == 40){elemento = eval("document.forms[0].user"+(i+1)); elemento.focus();}
}