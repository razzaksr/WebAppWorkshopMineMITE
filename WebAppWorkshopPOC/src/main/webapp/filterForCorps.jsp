<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Vector"%>
<%@page import="core.mod.Companies"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Candidates</title>
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
						<a href="corpenroll.jsp" class="navbar-link btn btn-light badge-pill">Enroll Corporate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="corpfind.jsp" class="navbar-link btn btn-light badge-pill">Find Corporate</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="#" class="navbar-link btn btn-light badge-pill">Shortlist</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="logout" class="navbar-link btn btn-light badge-pill">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

<%
List<Companies> all=new Vector<Companies>();
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/place_buddy","root","");
	String qry="select * from companies where taken = 0";
	PreparedStatement ps=con.prepareStatement(qry);
	ResultSet rs = ps.executeQuery();
	Companies com=null;
	while(rs.next())
	{
		com=new Companies();com.setDate(rs.getDate("date"));com.setOrg(rs.getString("org"));
		com.setRequired(rs.getInt("required"));com.setRole(rs.getString("role"));
		com.setSalary(rs.getDouble("salary"));com.setTaken(rs.getInt("taken"));
		all.add(com);
	}
}
catch(ClassNotFoundException ce){}
catch(SQLException sq){}
%>
<div class="container-fluid">
	<div class="row my-4 justify-content-center text-center">
		<div class="col-md-8 col-sm-12 rounded shadow border p-3">
			<h1 class="display-4 text-center">Filter candidates for companies</h1>
                <%-- <div class="form-group">
                    <label for="org">Select Organization to filter</label>
                    <select name="org" class="form-select">
                        <option>Select Org</option>
                        <%for(Companies com : all){ %>
                        <option><a href="fetchcorp?date=<%=com.getDate()%>" class="btn btn-outline-warning"><%=com.getOrg() %></a></option>
                        <%} %>
                    </select>
                </div> --%>
                
                <div class="d-flex flex-row flex-nowrap overflow-auto">
                	<%for(Companies com : all) {%>
                		<div class="card col-lg-3 col-md-4 col-sm-6 col-xs-12 bg-info">
                			<a href="fetchcorp?date=<%=com.getDate()%>" class="link text-light text-decoration-none">
                				<h1 class="card-title"><%=com.getOrg() %></h1>
                			</a>
                			<div class="card-body">
                				<h2 class="card-text"><%=com.getSalary() %></h2>
                				<p class="card-text float-end"><%=com.getDate() %></p>
                				<p class="card-text float-start"><%=com.getRole()%></p>
                			</div>                		
                		</div>
                	<%} %>
                </div>
		</div>
	</div>
</div>
<%}else{
	response.sendRedirect("index.jsp");
	}%>
</body>
</html>