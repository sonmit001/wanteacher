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
		<h1>Dynamic CSS</h1>
		<h2>Example 1</h2>
		<!-- 
			object 일 경우 {} 한개
			v-bind:class="{red: true} element에 red가 보임
			v-bind:class="{red: false} element에 안 보임
		-->
		<!-- <div v-on:click="available = !available" v-bind:class="{available: available}">
			<span>Ryu</span>
		</div> -->
		<h2>EXample 2</h2>
		<button v-on:click="nearby = !nearby">Toggle nearby</button>
		<button v-on:click="available = !available">Toggle available</button>
		<div v-bind:class="compClasses">
			<span>Ryu</span>
		</div>
		
	</div>
	<script src="js/appcss.js"></script>
</body>
</html>







