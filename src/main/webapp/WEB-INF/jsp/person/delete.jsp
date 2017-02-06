<%-- 
    Document   : delete
    Created on : Apr 22, 2011, 3:55:55 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Person</title>
    </head>
    <body>
    <div class="container">
	        <h1 class="inverse h1Center">Delete Person</h1>
	        <div class="hero-unit">
		        <p id="delete">You are about to delete the person ${person.firstName} ${person.lastName}:  Are you sure?</p>
		        <form action="${pageContext.request.contextPath}/person/delete" method="post">
		            <input type="hidden" name="personId" value="${person.personId}"/>
		            <input class="btn" type="submit" name="command" value="Delete"/>
		            <input class="btn" type="submit" name="command" value="Cancel"/>
		        </form>
		    </div>
	</div>
    </body>
</html>
