/* W.I.P. (Warning Idiot Programmer): Codigo Elavorado por Titiushko */
function mostrarProyectosXUsuarios(codigo_usuario){
	//location.href = "ListaProyectos.asp?busqueda="+codigo_usuario;
	window.open('ListaProyectos.asp?busqueda='+codigo_usuario,'lista_proyectos');
}

function mostrarTareasXProyecto(codigo_proyecto) {
	window.open('ListaTareas.asp?busqueda=' + codigo_proyecto, 'lista_tareas');
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

function cambiarTypeTextPassword(F) {
    // password: nombre del campo tipo password
    // cambiar: nombre del checkbox
    var input_formulario = F.password;
    if (F.cambiar.checked) { input_formulario.setAttribute("type", "text"); }
    else { input_formulario.setAttribute("type", "password"); }
}