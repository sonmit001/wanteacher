<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Vuejs</title>
	<link href="css/styles.css" rel="stylesheet"/>
	<script src="https://unpkg.com/vue"></script>
	<!-- 
	click event
	더블 클릭 v-on:dblclick @dblclick
	
	mousemove
	v-on:mousemove="functionname" 파라미터 없이 받는 쪽에서 함수 파라미터에 event해서 받는 것이다.
	
	EVENT MODIFIERS
	https://vuejs.org/v2/guide/events.html#Event-Modifiers
	 -->
</head>
<body>
	<div id="vue-app">
		<h1>Events</h1>
		<!-- <button v-on:click="age++">Add a Year</button> -->
		<button @click.once="add(1)">Add a Year</button>
		<button v-on:click="subtract(1)">Subtract a Year</button>
		<button @dblclick="add(10)">Add 10 Year</button>
		<button v-on:dblclick="subtract(10)">Subtract 10 Year</button>
		<p>My age is {{ age }}</p>
		<div id="canvas" v-on:mousemove="updatexy">{{ x}},{{y}}</div>
		<a v-on:click.prevent="click" href="https://www.naver.com/">The Naver</a>
	</div>
	<script src="js/appevent.js"></script>
</body>
</html>







