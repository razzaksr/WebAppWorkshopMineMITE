<%@page import="java.util.List"%>
<%@page import="core.mod.Candidates"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corporate Filters</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
<% List<Candidates> all=(List<Candidates>)request.getAttribute("one"); %>
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">
			<a href="#" class="navbar-brand"><img style="height:80px;width:150px" src="images/logo.png" alt="logo"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#place">
			<span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="place">
				<ul class="navbar-nav ml-auto">
					<li class="navbar-item active" id="menu-gap">
						<a href="home.jsp" class="navbar-link btn btn-light badge-pill">Home</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="corporateList" class="navbar-link btn btn-light badge-pill">Corp Home</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="corpenroll.jsp" class="navbar-link btn btn-light badge-pill">Enroll Corporate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="corpfind.jsp" class="navbar-link btn btn-light badge-pill">Find Corporate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="filterForCorps.jsp" class="navbar-link btn btn-light badge-pill">Shortlist</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="logout" class="navbar-link btn btn-light badge-pill">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<p class="display-1">${sessionScope.logged}</p>
	<h1 class="display-4 text-center">List of Candidates</h1>
	<table class="table table-hover text-light bg-secondary rounded">
		<thead class="text-light">
			<tr>
				<th>REgister Number</th><th>Name</th><th>Department</th><th>Year of Passedout</th>
				<th>Address</th><th>Gender</th><th>Contact</th><th>Email</th><th>CGPA</th>
				<th>HSC</th><th>Diploma</th><th>SSLC</th><th>Interest</th><th>Status</th>
				<th>List of placed companies</th><th>Skills</th>
			</tr>
		</thead>
		<tbody>
			<% 
				for(Candidates tmp:all)
				{%>
					<tr>
						<td><%=tmp.getRegno() %></td><td><%=tmp.getName() %></td>
						<td><%=tmp.getDept() %></td><td><%=tmp.getBatch() %></td>
						<td><%=tmp.getAddress() %></td>
						<td><%=tmp.getGender() %></td><td><%=tmp.getContact() %></td>
						<td><%=tmp.getEmail() %></td><td><%=tmp.getCgpa() %></td>
						<td><%=tmp.getHsc() %></td><td><%=tmp.getDiploma() %></td>
						<td><%=tmp.getSslc() %></td><td><%=tmp.getCareer() %></td>
						<td><%=tmp.getStatus() %></td><td><%=tmp.getPlaced() %></td>
						<td><%=tmp.getSkills() %></td>
					</tr>					
				<% }%>
		</tbody>
	</table>
	<%-- <a href="print?collect<%=all%>" class="col-12 btn btn-outline-dark badge-pill">Print Report</a> --%>
	<div class="row text-center justify-content-center">
		<form action="corpmail.jsp">
			<%pageContext.setAttribute("tomail", all, PageContext.APPLICATION_SCOPE);%>
			<input type="submit" class="btn btn-outline-dark badge-pill" value="Send Notification">
		</form>
	</div>
	
</body>
</html>