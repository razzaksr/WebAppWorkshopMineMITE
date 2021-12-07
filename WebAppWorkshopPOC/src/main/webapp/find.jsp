<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searching Candidates</title>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
	<%
	response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expiry", "0");
	if(session.getAttribute("logged")!=null){ %>
	<a href="home.jsp" class="btn btn-outline-success">Home</a>
	<a href="logout" class="btn btn-outline-danger">Logout</a>
	<p class="display-5 text-center text-danger">${info}</p>
	<div class="row justify-content-center">
		<div class="col-6">
			<h1 class="text-primary text-center mt-5">Finding candidate</h1>
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
						<select class="form-control" name="dept">
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
						<select class="form-control" name="status">
							<option>Select One</option>
							<option>Placed</option>
							<option>Not placed</option>
						</select>
					</div>
				</div>
				<div class="my-4 row justify-content-around">
					<input type="submit" value="Find" class="btn btn-primary">
					<input type="reset" value="Clean" class="btn btn-dark" style="margin-left:300px;">
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
