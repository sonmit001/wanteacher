<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">  

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

<title>회원 리스트</title>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">회원리스트</div>
			<div class="panel-body">
				<table id="dataTable" class="table">
					<thead>
						<tr class="info">
							<th>순번</th>
							<th>이름</th>
							<th>아이디</th>
							<th>성별</th>
							<th>전화번호</th>					
						</tr>
					</thead>					
				</table>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var dataTable;
	
		$(document).ready(function(){
			dataTable = $("#dataTable").DataTable({
				ajax : "getMemberList",
				columns:[
					{data : "MNO"},
					{data : "NAME"},
					{data : "ID"},
					{data : "GENDER"},
					{data : "TEL"}
				]
			});	
		})
	</script>
</body>
</html>