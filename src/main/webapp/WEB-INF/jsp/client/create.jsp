<%-- 
    Document   : create
    Created on : Apr 22, 2011, 3:24:13 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
   	    <link href="<c:url value="/resources/css/bootstrap/css/bootstrap.css" />" rel="stylesheet">
   	    <script src="<c:url value="/resources/css/bootstrap/js/bootstrap.js" />"></script>
   		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
   	    <script src="<c:url value="/resources/js/client/validateClient.js" />"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Client</title>
    </head>
    <body>
		<div class="container">
	        <h1 class="inverse h1Center">Create Client</h1>
	        <div class="hero-unit">
		        <form id="clientForm" action="${pageContext.request.contextPath}/client/create" method="POST">
					<ul id="errorList">
			        </ul>
		            <br/>
		            <label for="companyName">Company Name:</label>
		            <input id="companyName" type="text" name="companyName" value="${client.companyName}"/>
		            <br/>
		            <label for="website">Website:</label>
		            <input id="website" type="text" name="website" value="${client.website}"/>
		            <br/>
		            <label for="phoneNumber">Phone Number:</label>
		            <input id="phoneNumber" type="text" name="phoneNumber" value="${client.phoneNumber}"/>
		            <br/><br/>
		            <div id="physical">
			            <label class="addressHeader">Physical Address:</label>
			            <br/>
			            <label for="streetAddress">Street Address:</label>
			            <input id="streetAddress" type="text" name="streetAddress" value="${client.streetAddress}"/>
			            <br/>
			            <label for="city">City:</label>
			            <input id="city" type="text" name="city" value="${client.city}"/>
			            <br/>
			            <label for="state">State:</label>
			            <input id="state" type="text" name="state" value="${client.state}"/>
			            <br/>
			            <label for="zipCode">Zip Code:</label>
			            <input id="zipCode" type="text" name="zipCode" value="${client.zipCode}"/>
			            <br/><br/>
		            </div>
		            <div id="mailing">
			            <label class="addressHeader">Mailing Address:</label>
			            <br/>
			            <label for="mailingAddress">Street Address:</label>
			            <input id="mailingAddress" type="text" name="mailingAddress" value="${client.mailingAddress}"/>
			            <br/>
			            <label for="mailingCity">City:</label>
			            <input id="mailingCity" type="text" name="mailingCity" value="${client.mailingCity}"/>
			            <br/>
			            <label for="mailingState">State:</label>
			            <input id="mailingState" type="text" name="mailingState" value="${client.mailingState}"/>
			            <br/>
			            <label for="mailingZipCode">Zip Code:</label>
			            <input id="mailingZipCode" type="text" name="mailingZipCode" value="${client.mailingZipCode}"/>
			            <br/><br/>
			        </div>
		            <input class='btn' type="submit" name="Submit" value="Submit"/>
		            <input class='btn' type="button" name="cancel" value="Cancel" onclick="location.href='${pageContext.request.contextPath}/client/list'">
			</form>
	 	</div>	
     </div>   	
    </body>
</html>
