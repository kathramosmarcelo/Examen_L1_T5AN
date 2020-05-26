<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Registra Cliente</title>
</head>
<body>  
<div class="container">
<h1>Registra Cliente</h1>
	
	<c:if test="${sessionScope.MENSAJE != null }">
			<div class="alert alert-success" id="success-alert">
	 		   <button type="button" class="close" data-dismiss="alert">x</button>
				${sessionScope.MENSAJE}				
			</div>
	</c:if>
	<c:remove var="MENSAJE"/>
	<form action="registraCliente" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nom_cliente">Nombres</label>
				<input class="form-control" type="text" id="id_nom_cliente" name="cliente.nom_cliente" placeholder="Ingrese Nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ape_cliente">Apellido</label>
				<input class="form-control" type="text" id="id_ape_cliente" name="cliente.ape_cliente" placeholder="Ingrese Apellido">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dni_cliente">DNI</label>
				<input class="form-control" type="text" id="id_dni_cliente" name="cliente.dni_cliente" placeholder="Ingrese DNI ">
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_fec_nac_cliente">Fecha de Nacimiento</label>
				<input class="form-control" type="text" id="id_fec_nac_cliente" name="cliente.fec_nac_cliente" placeholder="Ingrese la Fecha de Nacimiento">
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_tipo">Tipo</label>
				<select id="id_tipo" name="cliente.tipo.cod_tipo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Registrar Cliente</button>
			</div> 
	</form>
</div>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});


</script>

<script type="text/javascript">
	$.getJSON("cargaTipo",{}, function(data,q,txt){
		$.each(data.lstTipo, function(key,value){
			$("#id_tipo").append("<option value='" + value.cod_tipo +  "'>" + value.nombre + "</option>")
		})
	});
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nom_cliente: {
        		selector :"#id_nom_cliente",
        		validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 3 a 40 Letras',
                    	min : 3,
                    	max : 40
                    }
                }
            },
            ape_cliente: {
        		selector :"#id_ape_cliente",
        		validators: {
                    notEmpty: {
                        message: 'El Apellido es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El Apellido es de 3 a 40 Letras',
                    	min : 3,
                    	max : 40
                    }
                }
            },
         
            
            dni_cliente:{
        		selector : '#id_dni_cliente',
        		validators :{
        			notEmpty :{
        				message : 'El DNI es obligatorio'
        			},
                    regexp: {
                        regexp: /^[0-9]{8}$/,
                        message: 'El DNI es de 8 digitos'
                    }
        		}        		
        	},
            
        	fec_nac_cliente:{
        		selector : '#id_fec_nac_cliente',
        		validators :{
        			notEmpty :{
        				message :"La fecha de Nacimiento es un campo obligatorio"
        			},
        			date: {
                    	format: 'YYYY-MM-DD',
		                message: "la fecha de Ingreso es año-mes-dia"
		            }		   
        		}
        	},
        	
            tipo: {
            	selector :"#id_tipo",
                validators: {
                    notEmpty: {
                        message: 'El Tipo es un campo obligatorio'
                    }
                }
            },
          
        }   
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>




