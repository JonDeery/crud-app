function validateForm(event){
	var values = {"First Name": $('#firstName').val(),"Last Name": $('#lastName').val()
	    				  ,"Email Address": $('#emailAddress').val(),"Street Address": $('#streetAddress').val()
	    				  ,"City": $('#city').val() ,"State": $('#state').val(),"Zip Code": $('#zipCode').val() }
	    
	    $('text-error').remove();
	    var errorCount = 0;
	    for(val in values){
	    	var stringLength = 50;
	    	if(val == "State"){
	    		stringLength = 2;
	    	} else if(val == "Zip Code"){
	    		stringLength = 5;
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
			$("#errorList").show();
			$(this).scrollTop(0);
			return false;
		}	  
}