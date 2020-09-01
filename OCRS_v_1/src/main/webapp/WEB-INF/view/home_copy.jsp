<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
<title>Home Page</title>
<link href="<c:url value="/css/test.css" />" rel="stylesheet">

</head>

<body>
	<h3>Welcome to home page!</h3>

	<hr>

	<!-- display user name and role -->
<img src="<c:url value="/images/index.jpg"/>"/>
<hr>
	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>

	<security:authorize access="hasRole('POLICE')">
		<p>
			<a href="${pageContext.request.contextPath}/publicComplaints">public
				complaints</a>
		</p>
	</security:authorize>

	<p>
		<a href="${pageContext.request.contextPath}/complaintDetails">Complaint
			Details</a>
	</p>

	<security:authorize access="hasRole('ADMIN')">
		<p>
			<a href="${pageContext.request.contextPath}/manageUser">Manage
				User</a>
		</p>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<p>
			<a href="${pageContext.request.contextPath}/managePolice">Manage
				Police</a>
		</p>
	</security:authorize>

	<hr>


	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" value="Logout" />

	</form:form>

</body>

</html>









