$(document).ready(function() {
	$("#errorList").hide()
	$('#createForm').submit(function(event){
	    validateForm(event);   
	});
	if($("#clientId").val() != ""){
		$("#client").val($('#clientId').val());
		$("#client").prop('disabled', true);
	}
	$("#cancel").click(function(){
		cancel();
	})
});	

function cancel(){
	if($("#clientId").val() != ""){
		window.location.href = "/crud-app/client/edit/" + $("#clientId").val();
	} else {
		window.location.href = "/crud-app/person/list/";
	}
}