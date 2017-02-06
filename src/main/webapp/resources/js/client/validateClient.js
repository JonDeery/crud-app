$(document).ready(function() {
	$("#errorList").hide()
	$('#clientForm').submit(function(event){
	    validateForm(event);   
	});
});	

function validateForm(event){
	var values = {"Company Name": $('#companyName').val(),"Website": $('#website').val()
	    				  ,"Phone Number": $('#phoneNumber').val(),"Street Address": $('#streetAddress').val()
	    				  ,"City": $('#city').val() ,"State": $('#state').val(),"Zip Code": $('#zipCode').val()
	    				  ,"Mailing Street Address": $('#mailingAddress').val()
	    				  ,"Mailing City": $('#mailingCity').val() ,"Mailing State": $('#mailingState').val()
	    				  ,"Mailing Zip Code": $('#mailingZipCode').val()}
	    
	    $('.text-error').remove();
	    var errorCount = 0;
	    for(val in values){
	    	var stringLength = 50;
	    	if(val.indexOf("State") > 0){
	    		stringLength = 2;
	    	}
	    	var value = values[val];
	    	if(!value || value == '' || value.length > stringLength){
	    		var text = val + ' is required with maximum length of ' + stringLength;
	    		$("#errorList").append("<li class='text-error'>" + text + "</li>");
	    		errorCount++;
	    	}
	    }
	
		if(errorCount > 0){
			$("#errorList").before("<p class='text-error'>Please correct the following errors in your submission:</p>");
			event.preventDefault();  
			$("#errorList").show()
			$(this).scrollTop(0);
			return false;
		}	  
}