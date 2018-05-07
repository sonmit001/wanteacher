<%@page import="kr.or.css.dto.ContentAll_DTO"%>
<%@page import="kr.or.css.dto.Content_Image_DTO"%>
<%@page import="kr.or.css.dto.ContentReview_DTO"%>
<%@page import="kr.or.css.dto.Review_DTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.css.dto.Content_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link href="css/content.css" rel="stylesheet" type="text/css">
	<!-- Font Awesome -->
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
		integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
		crossorigin="anonymous">
	
	<!-- Jquery UI -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="css/content.css" rel="stylesheet" type="text/css">
	
	
	<style type="text/css">
		body{
			font-family :"Helvetica Neue", Helvetica, Arial, sans-serif;
		}
	
		#imagelist>span {
			display: inline-block;
		}
		
		.glyphicon {
			width: 30px;
			height: 30px;
		}
		
		#imagelist {
			float: right;
		}
		
		#reviews {
			padding-left: 10px;
			padding-right: 10px;
		}
		
		#reviews h3 {
			margin-top: 5px;
		}
		
		.review {
			margin-bottom: 25px;
		}
		
		#comment {
			margin: 10px;
		}
		
		#comment textarea {
			width: 75%;
		}
		
		#comment button {
			width: 20%;
			float: right;
		}
		
		.recommentList img {
			width: 100%;
			height: 20%;
		}
		
		#dialog-form ul { 
			list-style-type: none; 
			margin: 0; 
			padding: 0; 
			margin-bottom: 10px; 
		}
		
		#dialog-form ul li { 
			margin: 5px;
			padding: 5px; 
			width: 100%; 
			display: block;
		}
		
		#myCarousel {
			height: 20%;
		}
		
		#information {
			padding-left: 10px;
			padding-right: 10px;
		}
		.info {
			padding-left: 10px;
			padding-right: 10px;
		}
		.class {
			color: #969696;
			
		}
		textarea {
		    resize: none;
		}
		.floatright {
			float: right;
		}
		.recommentList h3{
			text-align: center;
		}
		hr{
			border-top :2px solid #f3f3f3 !important;
		}
		#addreviewbutton {
			background-color: #e5faf5;
		}
	</style>
	
	<%  
		Content_DTO content = (Content_DTO)request.getAttribute("content");
        String themename = (String)request.getAttribute("themename");
        String regionname = (String)request.getAttribute("regionname");
        int totalGoodCount = (Integer)request.getAttribute("totalGoodCount");
        int point = (Integer)request.getAttribute("point");
        int contentnum = (Integer)request.getAttribute("contentnum");
        int good = (Integer)request.getAttribute("good");
        List<ContentReview_DTO> reviewlist = (List)request.getAttribute("reviewlist");
        int reviewfirst = (Integer)request.getAttribute("reviewfirst");
        int reviewlast = (Integer)request.getAttribute("reviewlast");
        int reviewck = (Integer)request.getAttribute("reviewck");
        List<ContentAll_DTO> top3list = (List)request.getAttribute("top3list");
        List<String> imagelist = (List)request.getAttribute("imagelist");
        
        System.out.println("content : " + content);
        System.out.println("themename : " + themename);
        System.out.println("regionname : " + regionname);
        System.out.println("totalGoodCount : " + totalGoodCount);
        System.out.println("point : " + point);
        System.out.println("good : " + good);
        System.out.println("reviewlist : " + reviewlist);
        System.out.println("reviewfirst : " + reviewfirst);
        System.out.println("reviewlast : " + reviewlast);
        System.out.println("reviewck : " + reviewck);
        System.out.println("top3list : " + top3list);
        System.out.println("imagelist : " + imagelist);
	%>
	
	<c:set var="content" value="<%=content%>" />
	<c:set var="themename" value="<%=themename%>" />
	<c:set var="regionname" value="<%=regionname%>" />
	<c:set var="totalGoodCount" value="<%=totalGoodCount%>"/>
	<c:set var="point" value="<%=point%>"/>
	<c:set var="good" value="<%=good%>"/>
	<c:set var="reviewlist" value="<%= reviewlist%>"/>
	<c:set var="top3list" value="<%= top3list%>"/>
	
	<script type="text/javascript">
		var reviewfirst = <%= reviewfirst%>;
		var reviewlast = <%= reviewlast%>;
	
		$(function() {
			var point = <%= point%>;
			var contentnum = <%= contentnum%>;
			var good = <%= good%>;
			var totalgoodcount = <%= totalGoodCount%>;
			var reviewck = <%= reviewck%>;
		    
		    //찜
		    $(".fa-heart").on("click", function(){
				console.log("click");
				var point=(String)($(this).attr("value"));
				var contentnum = (String)($(this).attr("value1"));
				var size = $(this).attr("value2");
				if(point == 0){
					$.ajax({
						url: "point.db",
						type: "post",
						data: {
							point : point,
							contentnum : contentnum
						},
						dataType: 'text',
						success: function(data){
							console.log("성공");
						}
					});
					if(size == 1){
						$(this).attr("class", "fas fa-heart");
					}else if(size == 2){
						$(this).attr("class", "fas fa-heart fa-2x");
					}
					$(this).attr("value", "1");
					
				}else if(point == 1){
					$.ajax({
						url: "point.db",
						type: "post",
						data: {
							point : point,
							contentnum : contentnum
						},
						dataType: 'text',
						success: function(data){
							console.log("성공");
						}
					});
					if(size == 1){
						$(this).attr("class", "far fa-heart");
					}else if(size == 2){
						$(this).attr("class", "far fa-heart fa-2x");
					}
					$(this).attr("value", "0");
				}
			});
		    
		    //좋아요
		    $(".fa-thumbs-up").on("click", function(){
				console.log("click");
				var good=(String)($(this).attr("value"));
				var contentnum = (String)($(this).attr("value1"));
		  		var count=Number($('#'+"thum"+contentnum).text());
		  		var size = $(this).attr("value2");
				if(good == 0){
					$.ajax({
						url: "good.db",
						type: "post",
						data: {
							good : good,
							contentnum : contentnum
						},
						dataType: 'text',
						success: function(data){
							console.log("성공");
						}
					});
					if(size == 1){
						$(this).attr("class", "fas fa-thumbs-up");
					}else if(size == 2){
						$(this).attr("class", "fas fa-thumbs-up fa-2x");
					}
					count += 1;
					$('#'+"thum"+contentnum).text(count);
					$(this).attr("value", "1");
					
				}else if(good == 1){
					$.ajax({
						url: "good.db",
						type: "post",
						data: {
							good : good,
							contentnum : contentnum
						},
						dataType: 'text',
						success: function(data){
							console.log("성공");
						}
					});
					if(size == 1){
						$(this).attr("class", "far fa-thumbs-up");
					}else if(size == 2){
						$(this).attr("class", "far fa-thumbs-up fa-2x");
					}
					count -= 1;
					$('#'+"thum"+contentnum).text(count);
					$(this).attr("value", "0");
				}
			});
		    
		    //리뷰 더 보기
		    $("#reviewbutton").click(function(){
		    	console.log("click");
				$.ajax({
					url: "selectReview.db",
					type: "post",
					data: {
						reviewfirst: reviewfirst,
						reviewlast: reviewlast,
						contentnum: contentnum
					},
					dataType: "json",
					success: function(data){
						$.each(data, function(){
							console.log(this);
							$('#reviewbutton').before(
								"<div class='review'>"
								+ "<h5>" + this.nickname + "</h5>"
								+ "<p>" + this.reviewcontent + "</p>"
								+ "<hr style='margin-top: 5px; margin-bottom: 5px;'>"
								+ "</div>"
							);
							reviewfirst += 1;
							reviewlast += 1;
							console.log("first" + reviewfirst);
							console.log("last" + reviewlast);
						});
						
						console.log(data);
					}
				});
		    });
		    
		    //리뷰 쓰기
		    $('#addreviewbutton').on("click", function(){
		    	console.log("click");
		    	if($('#reviewcontent').val().trim() == ""){
		    		alert("리뷰 내용을 입력해주세요.");
		    	}else {
		    		var date = new Date();
		            var currentMonth = date.getMonth();
		            var currentDate = date.getDate();
		            var currentYear = date.getFullYear();
		            var time = "[" + currentYear + "-" + currentMonth + "-" + currentDate + "]  ";
		    		
		    		$.ajax({
						url: "insertreview.db",
						type: "post",
						data: {
							contentnum: contentnum,
							reviewcontent: time + $(".row textarea").val()
						},
						dataType: "html",
						success: function(data){
							$("#comment").hide();
							alert("리뷰 작성 성공");
						}
					});
		    	}
		    });
		    
		    if(reviewck == 1){
		    	$("#comment").hide();
		    }
		    
		    // 이미지 클릭 이벤트
		    $('.image').on("click", function(){
		    	location.href="contentDetail.db?contentnum=" + $(this).attr("value");
		    });
		});
	</script>

</head>
<body>
	<!-- header -->
	<jsp:include page="../include/header.jsp"></jsp:include>

	<!-- container -->
	<div class="container" style="margin-top:60px;">

		<h1 class="text-center" style="margin-bottom:30px;">${content.title} </h1>
				
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<c:forEach var="image" items="<%=imagelist%>" varStatus="status">
					<c:choose>
						<c:when test="${status.index == 0}">
							<div class="item active">
								<img src="upload/${image}" alt="picture"
									style="width: 100%; height: 500px;">
							</div>
						</c:when>
						<c:otherwise>
							<div class="item">
								<img src="upload/${image}" alt="picture"
									style="width: 100%; height: 500px;">
							</div>
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<hr>
		<!-- 콘텐츠 내용 -->
		<div id = "information">
			<div>
				<div class="row">
					<font color="#969696">기본정보</font>
					<div id="imagelist">
						<c:choose>
							<c:when test="${point == 0}">
								<span class="far fa-heart fa-2x" value = "${point}" value1 = "${content.contentnum}" value2 = "2" style="color: red; cursor:pointer;"></span> 
							</c:when>
							<c:otherwise>
								<span class="fas fa-heart fa-2x" value = "${point}" value1 = "${content.contentnum}" value2 = "2" style="color: red; cursor:pointer;" ></span> 
							</c:otherwise>
						</c:choose>
						<!-- <span class="fas fa-plus-square fa-3x" id="opener"></span> -->
						<c:choose>
							<c:when test="${good == 0}">
								<span class="far fa-thumbs-up fa-2x" value = "${good}" value1 = "${content.contentnum}" value2 = "2" style="color: blue; cursor:pointer;"></span> <font id = "thum${content.contentnum}">${totalGoodCount }</font>
							</c:when>
							<c:otherwise>
								<span class="fas fa-thumbs-up fa-2x" value = "${good}" value1 = "${content.contentnum}" value2 = "2" style="color: blue; cursor:pointer;"></span> <font id = "thum${content.contentnum}">${totalGoodCount }</font>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<h3>
					${content.title}
				</h3>
				<p>
					<font>${content.content}</font>
				</p>
			</div>
			<div class="info">
				<h5>
					<c:choose>
						<c:when test="${content.themenum == 1}">
							<span class="fas fa-bicycle"></span>
						</c:when>
						<c:when test="${content.themenum == 2}">
							<span class="fas fa-moon"></span>
						</c:when>
						<c:when test="${content.themenum == 3}">
							<span class="fab fa-fort-awesome"></span>
						</c:when>
						<c:when test="${content.themenum == 4}">
							<span class="fas fa-utensils"></span>
						</c:when>
						<c:when test="${content.themenum == 5}">
							<span class="fab fa-pagelines"></span>
						</c:when>
						<c:when test="${content.themenum == 6}">
							<span class="faㄴ fa-tree"></span>
						</c:when>
					</c:choose>
					<font color="#969696">${themename }</font>
				</h5>
				<h5>
					<span class="fas fa-map-marker" style="color: #969696;"></span>&nbsp;&nbsp;${regionname }
				</h5>
				<h5>
					<i class="far fa-clock" style="color: #969696;"></i><font>&nbsp;&nbsp;${content.expectedhour}시간</font>
				</h5>
			</div>
			
		</div>
		<hr>
		<div id="reviews">
			<h4 style="margin-bottom: 20px;"><b>리뷰</b></h4>
			<hr style="margin-top: 5px; margin-bottom: 5px;">
			<c:forEach var="review" items="<%=reviewlist%>">
				<div class="review">
					
					<h5>${review.nickname}</h5>
					<p>${review.reviewcontent}</p>
					<hr style="margin-top: 5px; margin-bottom: 5px;">
				</div>
				<script>
					reviewfirst += 1;
					reviewlast += 1;
				</script>
			</c:forEach>
			<button id="reviewbutton" class="btn btn-link" style="display: block; height: auto; margin: 0 auto;">리뷰 더 보기<br><i class="fas fa-angle-down"></i></button>
		</div>
		<div id="comment">
			<!-- comment -->
			<div class="row">
				<textarea rows="2" maxlength="45" placeholder="리뷰를 입력해주세요(최대 45자)" id="reviewcontent"></textarea>
				<button id="addreviewbutton" class="btn"><font><b>리뷰 쓰기</b></font></button>
			</div>
		</div>
		</div>
		<div style="padding-bottom:50px; background-color: #f3f3f3;">
			<div class="container" style="background-color: #f3f3f3;">
				<div class="recommentList">
					<h3>요즘 인기있는 곳</h3>
					<c:forEach var="top3" items="<%= top3list%>">
						<div class="col-sm-4 recomment" style="border-width:10px !important; border-color: #000">
							<img src= "upload/${top3.topimage}" class = "image" style="height: 280px;  cursor:pointer; width:100%;" value="${top3.contentnum}">
							<div>
								<font size="3"><b>${top3.title}</b></font>
								<div class = "floatright">
									<c:choose>
										<c:when test="${top3.pointck == 0}">
											<span class="far fa-heart" value = "${top3.pointck}" value1 = "${top3.contentnum}" value2 = "1" style="color: red; cursor:pointer;"></span> 
										</c:when>
										<c:otherwise>
											<span class="fas fa-heart" value = "${top3.pointck}" value1 = "${top3.contentnum}" value2 = "1" style="color: red; cursor:pointer;" ></span> 
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${top3.goodck == 0}">
											<span class="far fa-thumbs-up" value = "${top3.goodck}" value1 = "${top3.contentnum}" value2 = "1" style="color: blue; cursor:pointer;"></span> <font id = "thum${top3.contentnum}">${top3.good }</font>
										</c:when>
										<c:otherwise>
											<span class="fas fa-thumbs-up" value = "${top3.goodck}" value1 = "${top3.contentnum}" value2 = "1" style="color: blue; cursor:pointer;"></span> <font id = "thum${top3.contentnum}">${top3.good }</font>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<h5>
								<p>${top3.content }</p>
							</h5>
							<h5>
								<c:choose>
									<c:when test="${content.themenum == 1}">
										<span class="fas fa-bicycle"></span>
									</c:when>
									<c:when test="${content.themenum == 2}">
										<span class="fas fa-moon"></span>
									</c:when>
									<c:when test="${content.themenum == 3}">
										<span class="fab fa-fort-awesome"></span>
									</c:when>
									<c:when test="${content.themenum == 4}">
										<span class="fas fa-utensils"></span>
									</c:when>
									<c:when test="${content.themenum == 5}">
										<span class="fab fa-pagelines"></span>
									</c:when>
									<c:when test="${content.themenum == 6}">
										<span class="faㄴ fa-tree"></span>
									</c:when>
								</c:choose>
								<font>${themename }</font>
							</h5>
							<h5>
								<span class="fas fa-map-marker" style="color: #969696;"></span>&nbsp;&nbsp;${top3.regionname }
							</h5>
							<h5>
								<i class="far fa-clock" style="color: #969696;"></i><font>&nbsp;&nbsp;${top3.expectedhour}시간</font>
							</h5>
						</div>
					</c:forEach>
				</div>
			</div>
		
		</div>
	<!-- end-col1 -->

	<!-- footer -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>