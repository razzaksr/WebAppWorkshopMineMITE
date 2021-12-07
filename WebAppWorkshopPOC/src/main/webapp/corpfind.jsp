<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find Corporate</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
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
						<a href="#" class="navbar-link btn btn-light badge-pill">Find Corporate</a>
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
<div class="container-fluid">
	<div class="row my-4 justify-content-center">
		<div class="col-md-6 col-sm-12 rounded shadow border p-3">
			<h1 class="text-primary display-4 text-center mt-5">Finding companies</h1>
			<form class="form text-dark" action="searchcorps" method="post">
				<div class="form-group">
					<label>Mention the company name</label>
					<input type="text" placeholder="Company name" class="form-control" name="org">
				</div>
				<hr class="my-4">
				<p class="text-secondary text-center display-7">OR</p>
				<div class="form-group">
					<label >Mention the date</label>
					<input type="text" placeholder="date yyyy-mm-dd" class="form-control" name="date">
				</div>
				<hr class="my-4">
				<p class="text-secondary text-center display-7">OR</p>
				<div class="form-group">
					<label >Mention the skill set</label>
					<input type="text" placeholder="Skill set" class="form-control" name="skills">
				</div>
				<p class="text-secondary text-center display-7">OR</p>
				<div class="form-group">
					<label >Mention the count</label>
					<input type="number" placeholder="Hired count" class="form-control" name="count">
				</div>
				<div class="row justify-content-around mt-4">
					<button class="col-lg-4 btn btn-outline-primary">Find</button>
                    <button class="col-lg-4 btn btn-outline-danger">Reset</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>