<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Placement Buddy</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row justify-content-center">
		<img src="images/dlithelogo.png" alt="dlithe" class="col-lg-3 col-sm-6">
		<h1 class="col-lg-9 col-sm-6 text-center align-self-center text-primary text-uppercase"> DLithe Placement Buddy </h1>
	</div>
	<h5 class="text-danger">${requestScope.info}</h5>
		<!-- <hr class="my-4"> -->
		<div class="row justify-content-center mt-3">
			<div id="dlithe" class="carousel slide carousel-fade col-md-8 col-sm-12" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#dlithe" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#dlithe" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#dlithe" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="images/dslide1.jpg" style="height:460px" class="d-block w-100" alt="slide1">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Skill Development</h5>
			        <p>Train people with industry standard</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="images/dslide2.jpg" style="height:460px" class="d-block w-100" alt="slide2">
			    </div>
			    <div class="carousel-item">
			      <img src="images/dslide3.jpg" style="height:460px" class="d-block w-100" alt="slide3">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#dlithe" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#dlithe" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			<form class="form col-md-4 col-sm-12 p-3 shadow-lg rounded align-self-center" action="authenticate" method="post">
				<h1 class="text-center text-primary">Log Here</h1>
				<div class="form-group">
					<label for="user">User Name</label>
					<input type="text" name="user" placeholder="Enter the username" class="form-control">
				</div>
				<div class="form-group">
					<label for="pass">Password</label>
					<input type="password" name="pass" placeholder="Enter the password" class="form-control">
				</div>
				<div class="mt-4 row justify-content-around">
					<button type="submit" class="col-3 btn btn-outline-success ">Login</button>
					<button type="reset" class="col-3 btn btn-outline-secondary ">Clear</button>
				</div>
			</form>
		</div>
</div>
</body>
</html>