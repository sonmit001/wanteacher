<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Vue keyboard</title>
	<link href="css/styles.css" rel="stylesheet"/>
	<script src="https://unpkg.com/vue"></script>
</head>
<body>
	<div id="vue-app">
		<h1>keyboard Events</h1>
		<label>Name:</label>
		<!-- 
		https://vuejs.org/v2/guide/events.html#Event-Modifiers
		v-on:keyup 매번 keyup할때 마다 function 부른다
		그렇다면 사용자가 enter 누를 때만 기능하게 하려면?
		v-on:keyup.enter //v-on:keyup.alt.enter
		 -->
<!-- 	
		1.
		<input type="text" v-on:keyup.enter="logname"/>
		<span>{{name}}</span>
		<label>Age:</label>
		<input type="text" v-on:keyup.alt.enter="logage"/>
		<span>{{age}}</span> -->
		
		
		<input type="text" v-model="name"/>
		<span>{{name}}</span>
		<label>Age:</label>
		<input type="text" v-model="age"/>
		<span>{{age}}</span>
	</div>
	<script src="js/appkeyboard.js"></script>
</body>
</html>












