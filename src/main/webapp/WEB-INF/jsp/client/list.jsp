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
        <title>Client Listing</title>
    </head>
    <body>
        <div class="container">
	        <h1 class="page-header">Client Listing</h1>     
	        <p><a class="btn" href="${pageContext.request.contextPath}/client/create">Create New Client</a> 
	        	<a class="btn" href="${pageContext.request.contextPath}/person/list">Manage People</a></p>
	        <c:choose>
	            <c:when test="${fn:length(clients) gt 0}">
	                <table class="table">
	                    <thead class="thead-inverse">
	                        <tr>
	                            <th>Company Name</th>
	                            <th>Phone Number</th>
	                            <th>Website</th>
	                            <th>Actions</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach items="${clients}" var="client">
	                            <tr>
	                                <td>${client.companyName}</td>
	                                <td>${client.phoneNumber}</td>
	                                <td>${client.website}</td>
	                                <td>
	                                    <a class="btn" href="${pageContext.request.contextPath}/client/edit/${client.clientId}">Edit Client</a>
	                                    <a class="btn" href="${pageContext.request.contextPath}/client/delete/${client.clientId}">Delete Client</a>
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
