<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert new auction</title>
<link rel="stylesheet" href="../resources/styles.css" type="text/css" />
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="add-auction">
<form:form method="post" modelAttribute="afd" enctype="multipart/form-data">

	<p>
	<label id="auction.category">Category:
		<form:select path="auction.category">
			<form:option value="0" label="Select Category" />
			<form:options items="${categories}" itemValue="idCategory" itemLabel="name" />
		</form:select>
		<form:errors path="auction.category" cssClass="aError" />
	</label>
	</p>
	
	<p>
	<label id="title">Title:
		<form:input path="auction.title" maxlength="90" />
		<form:errors path="auction.title" cssClass="aError"/>
	</label>
	</p>
	
	<p>
		
	<label id="description">Description:<br /> 
		<form:textarea path="auction.description" rows="10" cols="80" maxlength="65533" />
	</label>
		<form:errors path="auction.description" cssClass="aError"/>
	</p>
	
	<p>
	<label id="picture">Image file:
		<form:input type="file" path="file" />
		<form:errors path="file" cssClass="aError"/>
	</label>
	</p>
	
	<p><input id="submitAuction" type="submit" name="submit" /></p>
</form:form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>