<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String cp = request.getContextPath(); %>
<%--ContextPath 선언 --%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<title>TEST</title>
</head>
<body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"
		type="text/javascript"></script>
	<script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<button type="button" class="btn btn-default" aria-label="Left Align">
		<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>
	</button>

	<button type="button" class="btn btn-default btn-lg">
		<span class="glyphicon glyphicon-star" aria-hidden="true"></span> Star
	</button>


</body>
</html>