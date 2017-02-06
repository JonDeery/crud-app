<%-- 
    Document   : edit
    Created on : Apr 22, 2011, 3:04:46 PM
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
        <title>Edit Client</title>
    </head>
    <body>
    <div class="container">
        <h1 class="inverse h1Center">Edit Client</h1>
	    <div class="hero-unit">
       		 <form action="${pageContext.request.contextPath}/client/edit" method="POST">
			    <ul id="errorList">
		        </ul>
		        <input id="clientId" type="hidden" name="clientId" value="${client.clientId}"/>
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
		        </div>
				<label for="personWithoutClient">Add Existing Person:</label>
		        <select id="person" name="personWithoutClient">
				 <option value="-1"></option>
		         <c:forEach items="${peopleWithoutClient}" var="noClient">	
				 	<option value="${noClient.personId}">${noClient.lastName}, ${noClient.firstName}</option>
				</c:forEach>
				</select>
	            <c:choose>
	          	  <c:when test="${fn:length(people) gt 0}">
		            <table  class="table">
		                    <thead class="thead-inverse">
		                        <tr>
		                            <th>First Name</th>
		                            <th>Last Name</th>
		                            <th>Email Address</th>
	                          	    <th>Actions</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <c:forEach items="${people}" var="person">
		                            <tr>
		                                <td>${person.firstName}</td>
		                                <td>${person.lastName}</td>
		                                <td>${person.emailAddress}</td>
		                                <td><a class='btn' href="${pageContext.request.contextPath}/client/removePerson/${person.personId}/${client.clientId}">Remove Person</a></td>
		                            </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
	            	</c:when>
		            <c:otherwise>
		                <p>No People found for Client.</p>
		            </c:otherwise>
	            </c:choose>
	            <br/><br/>
	            <input class="btn" type="submit" name="Submit" value="Submit"/>
	            <input class="btn" type="button" name="addPerson" value="Add New Person" onclick="location.href='${pageContext.request.contextPath}/person/create/${client.clientId}'">
	            <input class="btn" type="button" name="cancel" value="Cancel" onclick="location.href='${pageContext.request.contextPath}/client/list'">
        	</form>
        </div>
     </div>
    </body>
</html>
