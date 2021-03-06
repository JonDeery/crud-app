<%-- 
    Document   : list
    Created on : Apr 22, 2011, 2:25:22 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
   	    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
   	    <link href="<c:url value="/resources/css/bootstrap/css/bootstrap.css" />" rel="stylesheet">
   	    <script src="<c:url value="/resources/css/bootstrap/js/bootstrap.js" />"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Person Listing</title>
    </head>
    <body>
        <div class="container">
     		<h1 class="page-header">Person Listing</h1>     
       		 <p><a class="btn" href="${pageContext.request.contextPath}/person/create">Create New Person</a>
       		 	<a class="btn" href="${pageContext.request.contextPath}/client/list">Manage Clients</a></p>
	        <c:choose>
	            <c:when test="${fn:length(persons) gt 0}">
	                <table class="table">
	                    <thead class="thead-inverse">
	                        <tr>
	                            <th>First Name</th>
	                            <th>Last Name</th>
	                            <th>Email Address</th>
	                            <th>Actions</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach items="${persons}" var="person">
	                            <tr>
	                                <td>${person.firstName}</td>
	                                <td>${person.lastName}</td>
	                                <td>${person.emailAddress}</td>
	                                <td>
	                                    <a class='btn' href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit Person</a>
	                                    <a class='btn' href="${pageContext.request.contextPath}/person/delete/${person.personId}">Delete Person</a>
	                                </td>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
	            </c:when>
	            <c:otherwise>
	                <p>No results found.</p>
	            </c:otherwise>
	        </c:choose>
        </div>
    </body>
</html>
