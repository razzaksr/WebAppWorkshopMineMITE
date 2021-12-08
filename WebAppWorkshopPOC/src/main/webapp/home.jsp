<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zealous Placement Buddy Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
<%
response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.addHeader("Pragma", "no-cache");
response.addHeader("Expiry", "0");
if(session.getAttribute("logged")!=null){ %>
	
	
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">
			<a href="#" class="navbar-brand"><img style="height:80px;width:150px" src="images/dlithelogo.png" alt="logo"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#place">
			<span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="place">
				<ul class="navbar-nav ms-auto">
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
	<p class="display-1">${requestScope.info}</p>
	
	<div class="container-fluid mt-3">
	<div id="dlithes" class="carousel carousel-dark slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#dlithes" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#dlithes" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#dlithes" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#dlithes" data-bs-slide-to="3" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#dlithes" data-bs-slide-to="4" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="images/welcome.png" style="height:500px" class="d-block w-100" alt="slide1">
			    </div>
			    <div class="carousel-item">
			      <img src="images/why.png" style="height:500px" class="d-block w-100" alt="slide2">
			    </div>
			    <div class="carousel-item">
			      <img src="images/praise.png" style="height:500px" class="d-block w-100" alt="slide3">
			    </div>
			    <div class="carousel-item">
			      <img src="images/team.png" style="height:500px" class="d-block w-100" alt="slide4">
			    </div>
			    <div class="carousel-item">
			      <img src="images/contact.png" style="height:500px" class="d-block w-100" alt="slide5">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#dlithes" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#dlithes" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
	
	
	<!-- <a href="logout" class="btn btn-outline-danger">Logout</a>
	<a href="enroll.jsp" class="btn btn-outline-primary badge-pill">Enroll Candidate</a>
	<a href="find.jsp" class="btn btn-outline-success badge-pill">Find Candidate</a>
	<a href="viewall" class="btn btn-outline-warning badge-pill">List Candidate</a> -->
	
	
	
	<%}else{
	response.sendRedirect("index.jsp");
	}%>
</body>
</html>