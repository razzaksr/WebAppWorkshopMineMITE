<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enrolling new one to placement buddy</title>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
	<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expiry", "0");
	if(session.getAttribute("logged")!=null){ %>
		<p class="display-7 text-danger">${info}</p>
	<p class="display-1">${sessionScope.logged}</p>
	<!-- <div class="justify-conetnt-center"> -->
		<a href="home.jsp" class="btn btn-outline-success">Home</a>
		<a href="logout" class="btn btn-outline-danger">Logout</a>
			<h1 class="display-4 text-primary text-center">Placement buddy enrollment</h1>
			<div class="row justify-content-center">
				<form class="form text-primary p-3 border border-light shadow-lg rounded" action="feed" method="post">
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
							<input type="radio" name="gender" value="male" class="form-control" style="margin:4px; margin-left: 30px">Male
							<input type="radio" name="gender" value="female" class="form-control" style="margin-left: 30px">Female
							<input type="radio" name="gender" value="other" class="form-control" style="margin-left: 30px">Other
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
							<input type="radio" name="interest" value="it" class="form-control" style="margin:4px; margin-left: 30px">IT
							<input type="radio" name="interest" value="core" class="form-control" style="margin-left: 30px">Core
							<input type="radio" name="interest" value="higher_studies" class="form-control" style="margin-left: 30px">Higher Studies
							<input type="radio" name="interest" value="not_interested" class="form-control" style="margin-left: 30px">Not Interested
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
					<div class="my-4 row justify-content-around">
						<input type="submit" value="Enroll" class="btn btn-outline-dark">
						<input style="margin-left: 300px;" type="reset" value="Clean" class="btn btn-outline-secondary">
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