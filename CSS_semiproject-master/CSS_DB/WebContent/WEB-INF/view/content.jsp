<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		  <link href="css/content.css" rel="stylesheet" type="text/css">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
		  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="../include/header.jsp"></jsp:include>
	
		<!-- content -->
		
		<!--  region -->
		<div class="container">
		    <div class="row">
		        <div class="col-sm-12">
		        	 <img src="images/map.jpg" alt="Random Name" width="100%" height="100%">
		        </div>
		    </div>
		</div>
		
		<!--  theme -->
		<div class="row container" id = "theme">
		    <div class="col-sm-4">
		      <a href="#demo">
		        <img src="images/working.png" alt="Random Name" width="100%" height="255">
		      </a><br>
		      <p class="text-center"><strong>운동</strong></p>
		    </div>
		    <div class="col-sm-4">
			  <a href="#demo2">
		        <img src="images/night.png" alt="Random Name" width="100%" height="255">
		      </a><br>
		      <p class="text-center"><strong>야경</strong></p>
		    </div>
		    <div class="col-sm-4">
		      <a href="#demo3" data-toggle="collapse">
		        <img src="images/themapark.png" alt="Random Name" width="100%" height="255">
		      </a><br>
		      <p class="text-center"><strong>놀이동산</strong></p>
		    </div>
		    <div class="col-sm-4">
		      <a href="#demo3" data-toggle="collapse">
		        <img src="images/rastaurant.png" alt="Random Name" width="100%" height="255">
		      </a><br>
		      <p class="text-center"><strong>식당</strong></p>
		    </div>
		    <div class="col-sm-4">
		      <a href="#demo3" data-toggle="collapse">
		        <img src="images/festival.png" alt="Random Name" width="100%" height="255">
		      </a><br>
		      <p class="text-center"><strong>꽃놀이</strong></p>
		    </div>
		    <div class="col-sm-4">
		      <a href="#demo3" data-toggle="collapse">
		        <img src="images/climing.png" alt="Random Name" width="100%" height="255">
		      </a><br>
		      <p class="text-center"><strong>등산</strong></p>
		    </div>
		</div>
		
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>