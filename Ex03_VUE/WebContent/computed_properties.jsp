<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Vuejs</title>
	<link href="css/styles.css" rel="stylesheet"/>
	<script src="https://unpkg.com/vue"></script>
</head>
<body>
	<div id="vue-app">
		<h1>computed properties</h1>
		<button v-on:click="a++">Add a A</button>
		<button v-on:click="b++">Subtract a B</button>
		<p>A - {{a}}</p>
		<p>B - {{b}}</p>
		<!-- 
			computed에 함수를 넣었을 경우
			함수 뒤에 ()를 없애야 한다.
		 -->
		<p>Age + A = {{ addtoa}}</p>
		<p>Age + B = {{ addtob}}</p>
	</div>
	<script src="js/appevent.js"></script>
</body>
</html>







