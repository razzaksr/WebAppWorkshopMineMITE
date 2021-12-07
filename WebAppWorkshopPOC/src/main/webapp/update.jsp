<%@page import="core.mod.Candidates"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating in placement buddy</title>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
<%Candidates can=(Candidates)request.getAttribute("single");%>
<div class="container-fluid">
	<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expiry", "0");
	if(session.getAttribute("logged")!=null){ %>
	<a href="home.jsp" class="btn btn-outline-success">Home</a>
	<a href="logout" class="btn btn-outline-danger">Logout</a>
	<div class="justify-conetnt-center">
		<div class="padding"><!-- <div class="col-xs-12 col-sm-12 col-md-6"> -->
			<h1 class="display-4 text-primary">Placement buddy updation</h1>
			<form class="form text-primary" action="update" method="post">
				<div class="form group">
					<label for="regno">Register Number</label>
					<input type="number" name="regno" class="form-control" 
					placeholder="REgister Number"
					value="<%=can.getRegno() %>">
				</div>
				<div class="form group">
					<label for="name">Name of Candidate</label>
					<input type="text" name="name" class="form-control" placeholder="Name"
					value="<%=can.getName() %>">
				</div>
				<div class="form group">
					<label for="gender">Gender</label>
					<input type="text" name="gender" class="form-control" placeholder="gender"
					value="<%=can.getGender() %>">
				</div>
				<div class="form group">
					<label for="dept">Department</label>
					<input type="text" name="dept" class="form-control" placeholder="Department"
					value="<%=can.getDept() %>">
				</div>
				<div class="form group">
					<label for="batch">Batch year</label>
					<input type="number" name="batch" class="form-control" placeholder="Batch"
					value="<%=can.getBatch() %>">
				</div>
				<div class="form group">
					<label for="contact">Contact</label>
					<input type="number" name="contact" class="form-control" placeholder="Contact Number"
					value="<%=can.getContact() %>">
				</div>
				<div class="form group">
					<label for="email">Email</label>
					<input type="email" name="email" class="form-control" placeholder="Email"
					value="<%=can.getEmail() %>">
				</div>
				<div class="form group">
					<label for="add">Address</label>
					<input type="text" name="address" class="form-control" placeholder="Address"
					value="<%=can.getAddress() %>">
				</div>
				<div class="form group">
					<label for="cgpa">CGPA</label>
					<input type="number" name="cgpa" class="form-control" placeholder="CGPA"
					value="<%=can.getCgpa() %>">
				</div>
				<div class="form group">
					<label for="hsc">Higher Secondary</label>
					<input type="number" name="hsc" class="form-control" placeholder="Higher secondary"
					value="<%=can.getHsc() %>">
				</div>
				<div class="form group">
					<label for="diploma">Diploma</label>
					<input type="number" name="diploma" class="form-control" placeholder="Diploma mark"
					value="<%=can.getDiploma() %>">
				</div>
				<div class="form group">
					<label for="sslc">SSLC</label>
					<input type="number" name="sslc" class="form-control" placeholder="SSLC mark"
					value="<%=can.getSslc() %>">
				</div>
				<div class="form group row">
					<div class="form-inline col">
						<label for="interest">Select Interest</label>
						<select class="form-control" name="interest">
							<option>Select One</option>
							<option>it</option>
							<option>core</option>
							<option>higher_studies</option>
							<option>not_innterested</option>
						</select>
					</div>
				</div>
				<div class="form group row">
					<div class="form-inline col">
						<label for="status">Status</label>
						<select class="form-control" name="status">
							<option>Select Status</option>
							<option>Placed</option>
							<option>Not Placed</option>
						</select>
					</div>
				</div>
				<div class="form group">
					<label for="skills">Skills</label>
					<input type="text" name="skills" class="form-control" placeholder="Skills"
					value="<%=can.getSkills() %>">
				</div>
				<div class="form group">
					<label for="placed">Placed concerns</label>
					<input type="text" name="placed" class="form-control" placeholder="Placed concerns"
					value="<%=can.getPlaced() %>">
				</div>
				
				<div class="my-4 row justify-content-around">
					<input type="submit" value="Update" class="btn btn-outline-dark">
					<input style="margin-left: 300px;" type="reset" value="Clean" class="btn btn-outline-secondary">
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