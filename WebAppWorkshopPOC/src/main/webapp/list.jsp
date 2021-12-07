<%@page import="core.mod.Candidates"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidates summary</title>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
<!-- Scriptlet tag -->
<% Vector<Candidates> all=(Vector<Candidates>)request.getAttribute("every"); %> 
<div class="container-fluid">
	<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expiry", "0");
	if(session.getAttribute("logged")!=null){ %>
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">
			<a href="#" class="navbar-brand"><img style="height:80px;width:150px" src="images/logo.png" alt="logo"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#place">
			<span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="place">
				<ul class="navbar-nav ml-auto">
					<li class="navbar-item active" id="menu-gap">
						<a href="#" class="navbar-link btn btn-light badge-pill">Home</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="corporateList" class="navbar-link btn btn-light badge-pill">Corp Home</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="enroll.jsp" class="navbar-link btn btn-light badge-pill">Enroll Candidate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="find.jsp" class="navbar-link btn btn-light badge-pill">Find Candidate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="viewall" class="navbar-link btn btn-light badge-pill">List Candidates</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="logout" class="navbar-link btn btn-light badge-pill">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<h2 class="text-center text-warning">${info }</h2>
	<p class="display-1">${sessionScope.logged}</p>
	<h1 class="display-4 text-center">List of Candidates</h1>
	<table class="table table-hover text-light bg-secondary rounded">
		<thead class="text-light">
			<tr>
				<th>REgister Number</th><th>Name</th><th>Department</th><th>Year of Passedout</th>
				<th>Address</th><th>Gender</th><th>Contact</th><th>Email</th><th>CGPA</th>
				<th>HSC</th><th>Diploma</th><th>SSLC</th><th>Interest</th><th>Status</th>
				<th>List of placed companies</th><th>Skills</th><th>Action</th>
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
						<td>
							<a href="edit?id=<%=tmp.getRegno() %>" class="btn btn-outline-success">Edit</a>
							<a href="delete?id=<%=tmp.getRegno() %>" class="btn btn-outline-danger">Delete</a>
						</td>
					</tr>					
				<% }%>
		</tbody>
	</table>
	<%-- <a href="print?collect<%=all%>" class="col-12 btn btn-outline-dark badge-pill">Print Report</a> --%>
	<div class="row text-center justify-content-center">
		<form action="printing.jsp">
			<%pageContext.setAttribute("tobe", all, PageContext.APPLICATION_SCOPE);%>
			<input type="submit" class="btn btn-outline-dark badge-pill" value="Print Report">
		</form>
	</div>
	<%}else{
	response.sendRedirect("index.jsp");
	}%>
</div>
</body>
</html>