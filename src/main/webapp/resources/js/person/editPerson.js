$(document).ready(function() {
	$('#client').val($('#clientId').val());
	$("#errorList").hide()
	$('#editForm').submit(function(event){
	    validateForm(event);   
	});
});	

