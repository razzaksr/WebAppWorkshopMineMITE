<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Placement Buddy</title>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
	<h1 class="text-primary text-center display-4"> Zealous Placement Buddy </h1>
	<h5 class="text-danger">${requestScope.info}</h5>
	
		<!-- <hr class="my-4"> -->
		<div class="row justify-content-center my-5">
			<form class="form col-md-6 col-xm-12 p-3 shadow-lg rounded" action="authenticate" method="post">
				<div class="form-group">
					<label for="user">User Name</label>
					<input type="text" name="user" placeholder="Enter the username" class="form-control">
				</div>
				<div class="form-group">
					<label for="pass">Password</label>
					<input type="password" name="pass" placeholder="Enter the password" class="form-control">
				</div>
				<div class="my-4 row justify-content-around">
					<input type="submit" value="Login" class="btn btn-outline-success ">
					<input type="reset" value="Clear" class="btn btn-outline-secondary ">
				</div>
			</form>
		</div>
</div>
</body>
</html>