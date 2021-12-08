<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enrolling new one to placement buddy</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
	<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expiry", "0");
	if(session.getAttribute("logged")!=null){ %>
		<p class="display-7 text-danger">${info}</p>
	
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
						<a href="#" class="navbar-link btn btn-light badge-pill">Enroll Candidate</a>
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
			<h1 class="display-4 text-primary text-center text-uppercase">Placement buddy enrollment</h1>
			<div class="row justify-content-center">
				<form class="form text-primary col-lg-8 col-md-12 p-3 border border-light shadow-lg rounded" action="feed" method="post">
					<div class="form group">
						<label for="regno">Register Number</label>
						<input type="number" name="regno" class="form-control" placeholder="REgister Number">
					</div>
					<div class="form group">
						<label for="name">Name of Candidate</label>
						<input type="text" name="name" class="form-control" placeholder="Name">
					</div>
					<div class="form-checked">
						<div class="form-inline">
							<label for="gender">Select Gender</label>
							<input type="radio" name="gender" value="male" class="form-check-input" style="margin:4px; margin-left: 30px">Male
							<input type="radio" name="gender" value="female" class="form-check-input" style="margin-left: 30px">Female
							<input type="radio" name="gender" value="other" class="form-check-input" style="margin-left: 30px">Other
						</div>
					</div>
					<div class="form group">
						<label for="dept">Department</label>
						<input type="text" name="dept" class="form-control" placeholder="Department">
					</div>
					<div class="form group">
						<label for="batch">Batch year</label>
						<input type="number" name="batch" class="form-control" placeholder="Batch">
					</div>
					<div class="form group">
						<label for="contact">Contact</label>
						<input type="number" name="contact" class="form-control" placeholder="Contact Number">
					</div>
					<div class="form group">
						<label for="email">Email</label>
						<input type="email" name="email" class="form-control" placeholder="Email">
					</div>
					<div class="form group">
						<label for="add">Address</label>
						<input type="text" name="address" class="form-control" placeholder="Address">
					</div>
					<div class="form group">
						<label for="cgpa">CGPA</label>
						<input type="number" name="cgpa" class="form-control" placeholder="CGPA">
					</div>
					<div class="form group">
						<label for="hsc">Higher Secondary</label>
						<input type="number" name="hsc" class="form-control" placeholder="Higher secondary">
					</div>
					<div class="form group">
						<label for="diploma">Diploma</label>
						<input type="number" name="diploma" class="form-control" placeholder="Diploma mark">
					</div>
					<div class="form group">
						<label for="sslc">SSLC</label>
						<input type="number" name="sslc" class="form-control" placeholder="SSLC mark">
					</div>
					<div class="form-checked">
						<div class="form-inline">
							<label for="interest">Select your career</label>
							<input type="radio" name="interest" value="it" class="form-check-input" style="margin:4px; margin-left: 30px">IT
							<input type="radio" name="interest" value="core" class="form-check-input" style="margin-left: 30px">Core
							<input type="radio" name="interest" value="higher_studies" class="form-check-input" style="margin-left: 30px">Higher Studies
							<input type="radio" name="interest" value="not_interested" class="form-check-input" style="margin-left: 30px">Not Interested
						</div>
					</div>
					<div class="form group">
						<label for="skills">Skills</label>
						<input type="text" name="skills" class="form-control" placeholder="Skills">
					</div>
					<!-- <div class="form group">
						<label for="placed">Placed concerns</label>
						<input type="text" name="placed" class="form-control" placeholder="Placed concerns">
					</div> -->
					<div class="mt-4 row justify-content-around">
						<button type="submit" class="col-4 btn btn-outline-dark">Enroll</button>
						<button type="reset" class="col-4 btn btn-outline-secondary">Clear</button>
					</div>
				</form>
			</div>
		</div>
	<%}else{
	response.sendRedirect("index.jsp");
	}%>
<!-- </div> -->
</body>
</html>