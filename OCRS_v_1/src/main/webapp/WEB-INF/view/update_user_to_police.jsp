<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<c:url value="/css/templatemo_style.css" />"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="<c:url value="/css/coda-slider.css" />"
	type="text/css" media="screen" charset="utf-8" />

<script type="text/javascript"
	src="<c:url value="/js/jquery-1.2.6.js" />">
	
</script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.scrollTo-1.3.3.js" />">
	
</script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.localscroll-1.2.5.js" />">
	
</script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.serialScroll-1.2.1.js" />">
	
</script>
<script type="text/javascript"
	src="<c:url value="/js/coda-slider.js" />">
	
</script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.easing.1.3.js" />">
	
</script>

</head>
<body>
	<div id="templatemo_body_wrapper">
		<div id="slider">

			<div id="templatemo_sidebar">
				<div id="templatemo_header">
					<a href="#"><img src="images/templatemo_logo.png"
						alt="Mini Social" /></a>
				</div>
				<!-- end of header -->
				<div class="table_div" class="home">
					<table class="table_div">
						<tr>
							<td><security:authorize access="hasRole('POLICE')">
									<p>
										<a href="${pageContext.request.contextPath}/publicComplaints">public
											complaints</a>
									</p>
								</security:authorize></td>
							<td>
								<p>
									<a href="${pageContext.request.contextPath}/complaintDetails">Complaint
										Details</a>
								</p>

							</td>
							<td><security:authorize access="hasRole('ADMIN')">
									<p>
										<a href="${pageContext.request.contextPath}/manageUser">Manage
											User</a>
									</p>
								</security:authorize></td>
							<td><security:authorize access="hasRole('ADMIN')">
									<p>
										<a href="${pageContext.request.contextPath}/managePolice">Manage
											Police</a>
									</p>
								</security:authorize></td>
						</tr>
					</table>
				</div>

			</div>
			<!-- end of sidebar -->

			<div id="templatemo_main">

				<ul id="social_box">
				
					<li><a href="logout"><img
							src="images/logout.png" alt="myspace" /></a></li>
					<li><a href="${pageContext.request.contextPath}/personDetails?userName=<security:authentication property="principal.username" />"><img
							src="images/templatemo_aboutus.png" alt="twitter" /></a></li>
							
					<li><a href="${pageContext.request.contextPath}/"><img
							src="images/templatemo_home_hover.png" /></a></li>
				</ul>


				<div id="content">

					<!-- scroll -->


					<div class="scroll">
						<div class="scrollContainer">

							<div class="panel" id="home">

								<div>
									<div>
										<form:form
											action="${pageContext.request.contextPath}/searchUser"
											method="POST">
											<input type="text" name="user_pattern">
											<input type="submit" value="search user">
										</form:form>
									</div>

									<c:if test="${users !=null}">
										<div align="center">
											<table border="1" cellpadding="5">
												<caption>
													<h2>List of users</h2>
												</caption>
												<tr>
													<th>User Name</th>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Gender</th>
													<th>Email</th>
													<th>Select police_station</th>
												</tr>
												<c:forEach var="user" items="${users}">
													<tr>
														<td><c:out value="${user.getUserName()}" /></td>
														<td><c:out value="${user.getFirstName()}" /></td>
														<td><c:out value="${user.getLastName()}" /></td>
														<td><c:out value="${user.getGender()}" /></td>
														<td><c:out value="${user.getEmail()}" /></td>
														<td><form:form
																action="${pageContext.request.contextPath}/updateUserToPolice"
																method="POST">
																<%
																	ResourceBundle resource = ResourceBundle.getBundle("police_station_codes");
																%>
																<%
																	String codes[] = resource.getString("code").split(",");
																%>
																<select id="p_id" name="p_id">
																	<%
																		for (String code : codes) {
																	%>
																	<option value="<%=code%>"><%=code%></option>
																	<%
																		}
																	%>
																</select>

																<input type="hidden" name="user_name"
																	value="${user.getUserName()}">
																<input type="submit" value="Make as Police">
															</form:form>
														<td>
															<%-- <td><a
								href="${pageContext.request.contextPath}/updateUserToPolice?user_name=${user.getUserName()}">Make
									as Police</a>
									
									</td> --%>
													</tr>
												</c:forEach>
											</table>
										</div>
									</c:if>
									<c:if test="${users ==null }">
	No reords found
	</c:if>
									
								</div>
</div>
						</div>

					</div>
				</div>
				<!-- end of scroll -->

			</div>
			<!-- end of content -->

			<div id="templatemo_footer">

				Copyright � 2048 <a href="#">Your Company Name</a>

			</div>
			<!-- end of templatemo_footer -->

		</div>
		<!-- end of main -->
	</div>
</body>
</html>