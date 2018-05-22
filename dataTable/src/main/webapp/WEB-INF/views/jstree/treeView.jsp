<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/dist/themes/proton/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/docs.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/apple-touch-icon-precomposed.png" />
<script src="${pageContext.request.contextPath}/resources/assets/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/dist/jstree.min.js"></script>

<title>JSTREE with BootStrap</title>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading"><b>메뉴 설정</b></div>
			<div class="panel-body">
				<div id="jstree_container"></div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "getCategoryList",
				type:"POST",
				dataType:"json",
				success : function(data){	
					console.log(data);
					$("#jstree_container").jstree({						
						"core": {
							'data' : data,
							'themes':{
								'name' : 'proton',
								'responsive' : true
							},
							"check_callback" : true
						},
						"plugins" : [ "dnd","contextmenu" ]
					})	
					.bind("loaded.jstree", function (event, data) {
							
					})
					.bind("select_node.jstree", function (event, data) {					
						
					})						
				}
			})
		});
	</script>
</body>
</html>