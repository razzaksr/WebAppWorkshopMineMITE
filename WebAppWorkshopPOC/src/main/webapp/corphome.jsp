<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.cj.jdbc.exceptions.SQLError"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="core.mod.Companies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corporates Home</title>
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

<%List<Companies> all=(List<Companies>)request.getAttribute("every"); %>
<div class="my-4 container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12 col-sm-12">
                <table class="table table-striped table-responsive-md table-responsive-sm table-bordered table-sm table-rounded">  
                    <thead class="thead-dark">
                        <tr>  
                            <th>Company name</th><th>Company Visiting date</th>
                            <th>Required resources</th><th>Role for Hiring</th>
                            <th>Package offered</th><th>Recruited Count</th>
                            <th>Actions</th>  
                        </tr>
                    </thead>  
                    <tbody>  
                        <%for(Companies tmp:all){ %>  
                                <tr>  
                                    <td><%=tmp.getOrg() %></td>
                                    <td><%=tmp.getDate() %></td>
                                    <td><%=tmp.getRequired() %></td>
                                    <td><%=tmp.getRole() %></td>
                                    <td><%=tmp.getSalary() %></td>
                                    <td><%=tmp.getTaken() %></td>
                                    <td>  
                                        <div class="row justify-content-around">
                                            <a href="editcorp?id=<%=tmp.getDate()%>&org=<%=tmp.getOrg() %>" class="btn btn-outline-success">Edit</a>
											<a href="deletecorp?id=<%=tmp.getDate()%>&org=<%=tmp.getOrg() %>" class="btn btn-outline-danger">Delete</a>
                                        </div>
                                    </td>  
                                </tr>  
                        <%} %>
                    </tbody>  
                </table>
               </div>
               </div>
               </div>
</body>
</html>