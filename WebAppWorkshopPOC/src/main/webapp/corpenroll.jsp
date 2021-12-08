<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corporate enrollment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expiry", "0");
	if(session.getAttribute("logged")!=null){ %>
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">
			<a href="#" class="navbar-brand">
			<img src="images/dlithelogo.png" alt="logo"></a>
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
						<a href="#" class="navbar-link btn btn-light badge-pill">Enroll Corporate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="corpfind.jsp" class="navbar-link btn btn-light badge-pill">Find Corporate</a>
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
<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-sm-12 p-3 rounded border shadow">
			<h1 class="display-4 text-primary text-center text-uppercase">Placement buddy corporate enrollment</h1>
			<form class="form" action="corpfeed" method="post">
				<div class="form-group">
					<label for="org">Company name</label>
					<input type="text" name="org" class="form-control" placeholder="Corporate Name">
				</div>
				<div class="form-group">
					<label for="date">Company visiting Date</label>
					<input type="text" name="date" class="form-control" placeholder="Corporate Visiting date yyyy-mm-dd">
				</div>
				<div class="form-group">
					<label role="required">Company required count</label>
					<input type="text" name="required" class="form-control" placeholder="Corporate REquired Count">
				</div>
				<div class="form-group">
					<label for="role">Company role for hiring</label>
					<input type="text" name="role" class="form-control" placeholder="Corporate reuired role">
				</div>
				<div class="form-group">
					<label for="salary">Company package</label>
					<input type="text" name="salary" class="form-control" placeholder="PAckage offered">
				</div>
				<div class="row justify-content-around mt-4">
					<button class="col-lg-4 btn btn-outline-primary">Welcome</button>
                    <button class="col-lg-4 btn btn-outline-danger">Refuse</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%}else{
	response.sendRedirect("index.jsp");
	}%>
</body>
</html>