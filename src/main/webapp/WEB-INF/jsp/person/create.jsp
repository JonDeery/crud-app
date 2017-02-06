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
   	    <script src="<c:url value="/resources/js/person/createPerson.js" />"></script>
   	    <script src="<c:url value="/resources/js/person/validatePerson.js" />"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Person</title>
    </head>
    <body>
   		<div class="container">
	        <h1 class="inverse h1Center">Create Person</h1>
	        <div class="hero-unit">
		        <form id="createForm" action="${pageContext.request.contextPath}/person/create" method="POST">
					<ul id="errorList">
			        </ul>
		        	<input id="clientId" type="hidden" name="clientId" value="${person.client}"/>
		            <br/>
			        <label for="firstName">First Name:</label>
			        <input id="firstName" type="text" name="firstName" value="${person.firstName}"/>
			        <br/>
		            <label for="lastName">Last Name:</label>
		            <input id="lastName" type="text" name="lastName" value="${person.lastName}"/>
		            <br/>
		            <label for="emailAddress">Email Address:</label>
		            <input id="emailAddress" type="text" name="emailAddress" value="${person.emailAddress}"/>
		            <br/>
		            <label for="streetAddress">Street Address:</label>
		            <input id="streetAddress" type="text" name="streetAddress" value="${person.streetAddress}"/>
		            <br/>
		            <label for="city">City:</label>
		            <input id="city" type="text" name="city" value="${person.city}"/>
		            <br/>
		            <label for="state">State:</label>
		            <input id="state" type="text" name="state" value="${person.state}"/>
		            <br/>
		            <label for="zipCode">Zip Code:</label>
		            <input id="zipCode" type="text" name="zipCode" value="${person.zipCode}"/>
		            <br/>
		            <label for="client">Client:</label>
		            <select id="client" name="client">
					  	<option value="-1"></option>
		            <c:forEach items="${clients}" var="client">	
					  	<option value="${client.clientId}">${client.companyName}</option>
					</c:forEach>
					</select>
		            <br/><br/>
		            <input class='btn' type="submit" name="Submit" value="Submit"/>
		            <input class='btn' id="cancel" type="button" name="cancel" value="Cancel">
		        </form>
	        </div>
        </div>
    </body>
</html>
