<%@page import="kr.or.css.dto.Members_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/CSS_DB/css/button.css" rel="stylesheet" type="text/css">


<style type="text/css">
#tablediv table {
	padding-top: 20px;
}

.left {
	float: left;
}
.right {
	float: right;
}
.left h3 {
	margin-top: 0px;
}
.wall {
	margin : 40px 0px 25px 0px;
	background-color: white;		
}

.col-sm-12 {
	margin-bottom: 20px;
}
table{
	text-align: center;
}


</style>
<%  
        int cpage = (Integer)request.getAttribute("cpage");
        int pagesize = (Integer)request.getAttribute("pagesize");
        int pagecount = (Integer)request.getAttribute("pagecount");
        int totalboardCount = (Integer)request.getAttribute("totalUserCount");
        List<Members_DTO> list = (List)request.getAttribute("list");
        int firstpage = ((cpage-1)/5)*5;
        int endck = 0;
        if((pagecount - cpage) < 4){
        	endck = 1;
        }
        
        System.out.println("cpage : " + cpage);
        System.out.println("pagesize : " + pagesize);
        System.out.println("pagecount : " + pagecount);
        System.out.println("totalboardCount : " + totalboardCount);
        System.out.println("list : " + list);
%>
<c:set var="pagesize" value="<%=pagesize%>" />
<c:set var="cpage" value="<%=cpage%>" />
<c:set var="pagecount" value="<%=pagecount%>" />
<c:set var="list" value="<%=list%>"/>
<c:set var="totalboardCount" value="<%=totalboardCount%>"/>
<c:set var="firstpage" value="<%=firstpage%>"/>
<c:set var="endck" value="<%=endck%>"/>
	
<script type="text/javascript">

	$(function(){
		// 검색 이벤트
		$('#search').on("click", function(){
			console.log("click");
			$.ajax({
				url: "searchUser.db",
				type: "post",
				data: {
					id : $('#id').val()
				},
				dataType: 'json',
				success: function(data){
					$('#tablediv').empty();
					var table = "<table class='table table-bordered'>";
					table += "<tr class='active'><td>아이디</td><td>비밀번호</td><td>닉네임</td><td>나이</td><td>성별</td><td>이메일</td><td>파트너</td><td></td></tr>";
					if(data != null){
						$.each(data, function(){
							table += "<tr>"
									+ "<td>" + this.id + "</td>"
									+ "<td>" + this.pwd + "</td>"
									+ "<td>" + this.nickname + "</td>"
									+ "<td>" + this.age + "</td>"
									+ "<td>" + this.gender + "</td>"
									+ "<td>" + this.email + "</td>"
									+ "<td>" + this.partner + "</td>"
									+ "<td><button type='button' seq='" + this.id + "'class='btn btn-danger btn-xs text'>삭제하기</button></td></tr>";
							
						});
					}else {
						table += "<tr>"
							+ "<td colspan='8'>데이터가 없습니다.</td>";
					}
					table += "</table>";
					$('#tablediv').html(table);
					
					// 삭제 이벤트
					$('table tbody tr td button').click(function(){
						console.log("click");
						console.log($(this).attr('seq'));
						location.href = "deleteUser.db?userid=" + $(this).attr('seq') + "&cp=" + <%= cpage%> + "&ps=" + <%=pagesize%>;
					});
				}
			});
		});
		
		// 삭제 이벤트
		$('table tbody tr td button').click(function(){
			console.log("click");
			console.log($(this).attr('seq'));
			location.href = "deleteUser.db?userid=" + $(this).attr('seq') + "&cp=" + <%= cpage%> + "&ps=" + <%=pagesize%>;
		});
		
		
	});

</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../include/header.jsp"></jsp:include>

	<!-- container -->
	<div class="container"  style="min-height: 820px;">
		<div class="wall">
			<h2><b>회원관리</b></h2>
		</div>
		
		<div class="col-sm-12">
			<div class="col-sm-3 left">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="ID 검색"
						id="id">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search" id="search"></i>
						</button>
					</div>
				</div>
			</div>
			
			<div class="col-sm-2 right">
				<form name="list">
					<select class="form-control" name="ps" onchange="submit()">
						<c:forEach var="i" begin="5" end="20" step="5">
							<c:choose>
								<c:when test="${pagesize == i}">
									<option value='${i}' selected>${i}건씩 보기</option>
								</c:when>
								<c:otherwise>
									<option value='${i}'>${i}건씩 보기</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</form>
			</div>
		</div>

		<div id="tablediv">
			<table class="table table-bordered">
				<tr class="active">
					<td>아이디</td>
					<td>비밀번호</td>
					<td>닉네임</td>
					<td>나이</td>
					<td>성별</td>
					<td>이메일</td>
					<td>파트너</td>
					<td>루비</td>
					<td></td>
				</tr>
				<!-- 데이터가 한건도 없는 경우  -->
				<%
		     	if(list == null || list.size() == 0){
		     		out.print("<tr><td>데이터가 없습니다</td></tr></table>");
		     		return;
		     	} 
		        %>
				<c:forEach var="member" items="<%=list%>">
					<c:set var="id" value="${member.id}" />
					<c:set var="pwd" value="${member.pwd}" />
					<c:set var="nickname" value="${member.nickname}" />
					<c:set var="age" value="${member.age}" />
					<c:set var="gender" value="${member.gender}" />
					<c:set var="email" value="${member.email}" />
					<c:set var="partner" value="${member.partner}" />
					<c:set var="ruby" value="${member.ruby}" />
					<tr>
						<td>${id}</td>
						<td>${pwd}</td>
						<td>${nickname}</td>
						<td>${age}</td>
						<td>${gender}</td>
						<td>${email}</td>
						<td>${partner}</td>
						<td>${ruby}</td>
						<td><button class="btn btn-danger btn-xs text" style="padding:2px 5px;" type="button" seq="${id}" >삭제하기</button></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="9">
						<ul class="pagination">
							<!--이전 링크 --> 
							<c:if test="${cpage>1}">
								<li><a href="memberManagement.db?cp=${cpage-1}&ps=${pagesize}">이전</a></li>
								<!--페이지 리스트 구현  -->
							</c:if>
							<c:choose>
								<c:when test="${endck == 0}">
									<c:forEach var="i" begin="${firstpage+1}" end="${firstpage+5}" step="1">
										<c:choose>
											<c:when test="${cpage==i}">
												<li class="active"><a>${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="memberManagement.db?cp=${i}&ps=${pagesize}">[${i}]</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${firstpage+1}" end="${pagecount}" step="1">
										<c:choose>
											<c:when test="${cpage==i}">
												<li class="active"><a>${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="memberManagement.db?cp=${i}&ps=${pagesize}">[${i}]</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							
							<!--다음 링크 --> 
							<c:if test="${cpage<pagecount}">
								<li><a href="memberManagement.db?cp=${cpage+1}&ps=${pagesize}">다음</a></li>
							</c:if>
							
						</ul>
					</td>
				</tr>
			</table>
		</div>
		
	</div>
	<!-- end container -->

	<!-- footer -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>