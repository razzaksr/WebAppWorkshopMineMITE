<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searching Candidates</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
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
						<a href="home.jsp" class="navbar-link btn btn-light badge-pill">Home</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="corporateList" class="navbar-link btn btn-light badge-pill">Corp Home</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="enroll.jsp" class="navbar-link btn btn-light badge-pill">Enroll Candidate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="#" class="navbar-link btn btn-light badge-pill">Find Candidate</a>
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
	
	<p class="display-5 text-center text-danger">${info}</p>
	<div class="row justify-content-center">
		<div class="col-6">
			<h1 class="text-primary text-center mt-3">Finding candidate</h1>
			<form class="form text-dark p-3 shadow-lg rounded border border-light" action="search" method="post" onsubmit="">
				<div class="form group">
					<label for="regno">Mention the registration Number</label>
					<input type="number" placeholder="Registration number" class="form-control" name="regno">
				</div>
				<hr class="my-4">
				<p class="text-secondary text-center display-7">OR</p>
				<div class="form group">
					<label for="skills">Mention the skill set</label>
					<input type="text" placeholder="Skill set" class="form-control" name="skills">
				</div>
				<p class="text-secondary text-center display-7">OR</p>
				<div class="form group row">
					<div class="form-inline col">
						<label for="dept">Select Department</label>
						<select class="form-select" name="dept">
							<option>Select One</option>
							<option>ece</option>
							<option>eee</option>
							<option>it</option>
							<option>cse</option>
							<option>mech</option>
						</select>
					</div>
				</div>
				<p class="text-secondary text-center display-7">OR</p>
				<div class="form group row">
					<div class="form-inline col">
						<label for="status">Select status</label>
						<select class="form-select" name="status">
							<option>Select One</option>
							<option>Placed</option>
							<option>Not placed</option>
						</select>
					</div>
				</div>
				<div class="mt-4 row justify-content-around">
					<button type="submit" class="col-4 btn btn-primary">Find</button>
					<button type="reset" class="col-4 btn btn-dark">Clean</button>
				</div>
			</form>
		</div>
	</div>
	<%}else{
	response.sendRedirect("index.jsp");
	}%>
</div>
</body>
</html>
