<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Vuejs</title>
	 <script src="https://unpkg.com/vue"></script>
	
</head>
<body>
	<div id="vue-app">
		<h1>{{ greet('afternoon') }}</h1>
		<a v-bind:href="website">go naver</a>
		<!-- DATA Binding
			href 사용시 "{{}}" 이렇게 혹은 그냥 {{}} 해도 데이터가 넘오오지 않는다.
			이런 경우 data binding을 해야한다.
			v-bind 이것은 vue 한테 이 것을 binding하라는 뜻이다.
			v-bind:href or :href
			:하고 프로퍼티 이름
		 -->
		<input type="text" v-bind:value="name">
		{{websitetag}}<!-- 문자 그대로 보여준다. -->
		<p v-html="websitetag"></p>
		<p>{{ name }}</p>
		<p>job : {{ job }}</p>
	</div>
	<script src="js/app.js"></script>
</body>
</html>