<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
		  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

		     <style type="text/css">
		     
		          .thumnailimgdiv{
         width:335px;
         height:200px;
         }
         
         .thumnailimg{
          width:335px;
          height:200px;
         }
         
</style>
		  
		  <script type="text/javascript">
		  $(function(){
			 
			  $.ajax({
					
					// 받아올 페이지 주소(전송주소)
					url : "getregionname.db",

					//서버가 client 응답 형식 : html
					dataType : "json",

					success:function(data){
						console.log(data);
						
						// <option value="1">전체</option>
						var intvalue = 1;
						$('#regionselect').append("<option value = '전체'>전체</option>");
						$.each(data,function(index,obj){
						var optionstr = '';
						optionstr = '<option value = "' + intvalue + '">' + obj.regionname + '</option>';  				
						intvalue += 1;
						$('#regionselect').append(optionstr);
						});
						
					} // end - success		
				});		  
				
					$('#listdiv').empty();

					
					$.ajax({

						// 받아올 페이지 주소(전송주소)
						url : "themalist.db",

						// 전송타입
						type : "post",

						// 보내는 data
						data : {
							"tnum" : <%=request.getParameter("tnum")%>
						},

						//서버가 client 응답 형식 : html
						dataType : "json",
						
						success:function(data){
							var contentnums;
							var experctedhour
							var contents;
							var good;
							var title;
							var themenum;
							var regionum;
							var topimages;
							var pointck;
							var goodck;
							var html="";
							var thumbsicon;
							var hearticon;
							console.log(data);
							var tname="<%=request.getParameter("tname")%>";
							$('#listdiv').append("<div class='header'><h1 class='modal-title'>"+tname+" 테마 리스트</h1></div>");
							$.each(data,function(index,obj){
								contentnums=obj.contentnum;
								experctedhour=obj.expectedhour;
								contents=obj.content;
								good = obj.good;
								title = obj.title;
								themenum = obj.themenum;
								regionnum = obj.regionnum;
								topimages = obj.topimage;
								
								pointck = obj.pointck;
								goodck = obj.goodck;
								
								
								if(pointck==0){
								thumbsicon = "<span  value='"+pointck+"' value1='"+contentnums+"'  class='far fa-heart' style='color:red; cursor:pointer;'></span>";
								}else{
									thumbsicon = "<span  value='"+pointck+"' value1='"+contentnums+"' class='fas fa-heart' style='color:red; cursor:pointer;'></span>";
								}
								if(goodck==0){
									hearticon="<span value='"+goodck+"' value1='"+contentnums+"' class='far fa-thumbs-up' style='color:blue; cursor:pointer;'></span><font id='thum"+contentnums+"'>"+good+"</font>";
								}else{
									hearticon="<span value='"+goodck+"' value1='"+contentnums+"' class='fas fa-thumbs-up' style='color:blue; cursor:pointer;'></span><font id='thum"+contentnums+"'>"+good+"</font>";	
								}
								
								
								
								
								
								html+="<div class='col-sm-4'><div class='thumbnail'>";
								html+="<div class = 'thumnailimgdiv'><img class='thumnailimg' style='cursor:pointer;' src='upload/"+topimages+"' id='img"+contentnums+"'  value="+contentnums+"></div>";
						        html+="  장소이름 : "+title+"&nbsp;&nbsp;"+thumbsicon+"&nbsp;";
								html+=hearticon+"<br />";
								html+="위치 : "+this.regionname+"</div></div>";	        
									        					
								
								
							});	
							$('#listdiv').append(html);
							$('img').on("click", function(){
								location.href="contentDetail.db?contentnum="+$(this).attr("value"); 
						  		console.log($(this).attr("value"));		  		
							});
							
							
							$('.fa-heart').on('click', function() {
								console.log("첫 벨류값"+$(this).attr("value"));
								var check=(String)($(this).attr("value"));
								var iconconnum = (String)($(this).attr("value1"));
						  		

								console.log("click");
								if(check == "0"){
									console.log($(this).attr("value"));
									$.ajax({
										url: "point.db",
										type: "post",
										data: {
											point : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "fas fa-heart");
									$(this).attr("value", "1");
									console.log("pointck"+pointck);
									
								}else if(check == "1"){
									console.log(check);
									$.ajax({
										url: "point.db",
										type: "post",
										data: {
											point : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "far fa-heart");
									$(this).attr("value", "0");
								}
								
								
								
								
						  		
						  	});
						  	$('.fa-thumbs-up').on('click', function() {
						  		
						  		console.log("첫 벨류값"+$(this).attr("value"));
								var check=(String)($(this).attr("value"));
								var iconconnum = (String)($(this).attr("value1"));
						  		var count=Number($('#'+"thum"+iconconnum).text());
						  		

								console.log("click");
								if(check == "0"){
									console.log($(this).attr("value"));
									$.ajax({
										url: "good.db",
										type: "post",
										data: {
											good : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "fas fa-thumbs-up");
									$(this).attr("value", "1");
									count+=1;
									$('#'+"thum"+iconconnum).text(count);
									console.log("pointck"+pointck);
									
								}else if(check == "1"){
									console.log(check);
									$.ajax({
										url: "good.db",
										type: "post",
										data: {
											good : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "far fa-thumbs-up");
									$(this).attr("value", "0");
									count-=1;
									$('#'+"thum"+iconconnum).text(count);
								}					  		
						  	});
							
							
						} // end - success
					}); // end - ajax
			  

			  
			  	$('#search').on('click', function() {

					$('#listdiv').empty();
					var search = $('#searchvalue').val();
					console.log(search);
					
					$.ajax({

						// 받아올 페이지 주소(전송주소)
						url : "themasearch.db",

						// 전송타입
						type : "post",

						// 보내는 data
						data : {
							"tnum" : <%=request.getParameter("tnum")%>,
							"search" : search
						},

						//서버가 client 응답 형식 : html
						dataType : "json",
						
						success:function(data){
							var contentnums;
							var experctedhour
							var contents;
							var good;
							var title;
							var themenum;
							var regionum;
							var topimages;
							var html="";
							var tname="<%=request.getParameter("tname")%>";
							var thumbsicon;
							var hearticon;
							console.log(data);
							
							$('#listdiv').append("<div class='header'><h1 class='modal-title'>"+tname+" 테마 리스트</h1></div>");
							$.each(data,function(index,obj){
								contentnums=obj.contentnum;
								experctedhour=obj.expectedhour;
								contents=obj.content;
								good = obj.good;
								title = obj.title;
								themenum = obj.themenum;
								regionnum = obj.regionnum;
								topimages = obj.topimage;
								pointck = obj.pointck;
								goodck = obj.goodck;
	
								
								if(pointck==0){
								thumbsicon = "<span  value='"+pointck+"' value1='"+contentnums+"'  class='far fa-heart' style='color:red; cursor:pointer;'></span>";
								}else{
									thumbsicon = "<span  value='"+pointck+"' value1='"+contentnums+"' class='fas fa-heart' style='color:red; cursor:pointer;'></span>";
								}
								if(goodck==0){
									hearticon="<span value='"+goodck+"' value1='"+contentnums+"' class='far fa-thumbs-up' style='color:blue; cursor:pointer;'></span><font id='thum"+contentnums+"'>"+good+"</font>";
								}else{
									hearticon="<span value='"+goodck+"' value1='"+contentnums+"' class='fas fa-thumbs-up' style='color:blue; cursor:pointer;'></span><font id='thum"+contentnums+"'>"+good+"</font>";	
								}
								
								
								
								
								
								
								html+="<div class='col-sm-4'><div class='thumbnail'>";
								html+="<div class = 'thumnailimgdiv'><img class='thumnailimg' style='cursor:pointer;' src='upload/"+topimages+"' id='img"+contentnums+"'  value="+contentnums+"></div>";
						        html+="  장소이름 : "+title+"&nbsp;&nbsp;"+thumbsicon+"&nbsp;";
								html+=hearticon+"<br />";
								html+="위치 : "+this.regionname+"</div></div>";	        
								
							});	
							$('#listdiv').append(html);
							$('img').on("click", function(){
								location.href="contentDetail.db?contentnum="+$(this).attr("value"); 
						  		console.log($(this).attr("value"));		  		
							});
							
							
							
							$('.fa-heart').on('click', function() {
								console.log("첫 벨류값"+$(this).attr("value"));
								var check=(String)($(this).attr("value"));
								var iconconnum = (String)($(this).attr("value1"));
						  		

								console.log("click");
								if(check == "0"){
									console.log($(this).attr("value"));
									$.ajax({
										url: "point.db",
										type: "post",
										data: {
											point : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "fas fa-heart");
									$(this).attr("value", "1");
									console.log("pointck"+pointck);
									
								}else if(check == "1"){
									console.log(check);
									$.ajax({
										url: "point.db",
										type: "post",
										data: {
											point : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "far fa-heart");
									$(this).attr("value", "0");
								}
								
								
								
								
						  		
						  	});
						  	$('.fa-thumbs-up').on('click', function() {
						  		
						  		console.log("첫 벨류값"+$(this).attr("value"));
								var check=(String)($(this).attr("value"));
								var iconconnum = (String)($(this).attr("value1"));
						  		var count=Number($('#'+"thum"+iconconnum).text());
						  		

								console.log("click");
								if(check == "0"){
									console.log($(this).attr("value"));
									$.ajax({
										url: "good.db",
										type: "post",
										data: {
											good : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "fas fa-thumbs-up");
									$(this).attr("value", "1");
									count+=1;
									$('#'+"thum"+iconconnum).text(count);
									console.log("pointck"+pointck);
									
								}else if(check == "1"){
									console.log(check);
									$.ajax({
										url: "good.db",
										type: "post",
										data: {
											good : check,
											contentnum : iconconnum
										},
										dataType: 'text',
										success: function(data){
											console.log("성공");
										}
									});
									$(this).attr("class", "far fa-thumbs-up");
									$(this).attr("value", "0");
									count-=1;
									$('#'+"thum"+iconconnum).text(count);
								}					  		
						  	});
							
							
						} // end - success
					}); // end - ajax
			  
			  		
			  		
			  	});	
			  	
			  
			  	
			  
			  	
			  	 $("#regionselect").change(function () {  
					  console.log("셀랙트 시작");
						$('#listdiv').empty();
						var regionnumber = $('#regionselect').val();
						var full = 0;
						console.log(regionnumber);
						if(regionnumber=="전체"){
							regionnumber=100;
							full=1;
						}
						console.log("레기온 넘" + full+"확인");
						$.ajax({

							// 받아올 페이지 주소(전송주소)
							url : "regionselect.db",

							// 전송타입
							type : "post",

							// 보내는 data
							data : {
								"tnum" : <%=request.getParameter("tnum")%>,
								"rnum" : regionnumber,
								"full" : full
							},

							//서버가 client 응답 형식 : html
							dataType : "json",

							success:function(data){
								var contentnums;
								var experctedhour
								var contents;
								var good;
								var title;
								var themenum;
								var regionnum;
								var topimages;
								var html="";
								var tname="<%=request.getParameter("tname")%>";
								var thumbsicon;
								var hearticon;
								console.log(data);
								
								$('#listdiv').append("<div class='header'><h1 class='modal-title'>"+tname+" 테마 리스트</h1></div>");
								$.each(data,function(index,obj){
									contentnums=obj.contentnum;
									experctedhour=obj.expectedhour;
									contents=obj.content;
									good = obj.good;
									title = obj.title;
									themenum = obj.themenum;
									regionnum = obj.regionnum;
									topimages = obj.topimage;
									pointck = obj.pointck;
									goodck = obj.goodck;
									
									
									
									if(pointck==0){
									thumbsicon = "<span  value='"+pointck+"' value1='"+contentnums+"'  class='far fa-heart' style='color:red; cursor:pointer;'></span>";
									}else{
										thumbsicon = "<span  value='"+pointck+"' value1='"+contentnums+"' class='fas fa-heart' style='color:red; cursor:pointer;'></span>";
									}
									if(goodck==0){
										hearticon="<span value='"+goodck+"' value1='"+contentnums+"' class='far fa-thumbs-up' style='color:blue; cursor:pointer;'></span><font id='thum"+contentnums+"'>"+good+"</font>";
									}else{
										hearticon="<span value='"+goodck+"' value1='"+contentnums+"' class='fas fa-thumbs-up' style='color:blue; cursor:pointer;'></span><font id='thum"+contentnums+"'>"+good+"</font>";	
									}
									
									
									
									
									
									
									html+="<div class='col-sm-4'><div class='thumbnail'>";
									html+="<div class = 'thumnailimgdiv'><img class='thumnailimg' style='cursor:pointer;' src='upload/"+topimages+"' id='img"+contentnums+"'  value="+contentnums+"></div>";
							        html+="  장소이름 : "+title+"&nbsp;&nbsp;"+thumbsicon+"&nbsp;";
									html+=hearticon+"<br />";
									html+="위치 : "+this.regionname+"</div></div>";	        
									
									
								});	
								$('#listdiv').append(html);
								
								$('img').on("click", function(){
									location.href="contentDetail.db?contentnum="+$(this).attr("value"); 
							  		console.log($(this).attr("value"));		  		
								});
								
								
								
								$('.fa-heart').on('click', function() {
									console.log("첫 벨류값"+$(this).attr("value"));
									var check=(String)($(this).attr("value"));
									var iconconnum = (String)($(this).attr("value1"));
							  		

									console.log("click");
									if(check == "0"){
										console.log($(this).attr("value"));
										$.ajax({
											url: "point.db",
											type: "post",
											data: {
												point : check,
												contentnum : iconconnum
											},
											dataType: 'text',
											success: function(data){
												console.log("성공");
											}
										});
										$(this).attr("class", "fas fa-heart");
										$(this).attr("value", "1");
										console.log("pointck"+pointck);
										
									}else if(check == "1"){
										console.log(check);
										$.ajax({
											url: "point.db",
											type: "post",
											data: {
												point : check,
												contentnum : iconconnum
											},
											dataType: 'text',
											success: function(data){
												console.log("성공");
											}
										});
										$(this).attr("class", "far fa-heart");
										$(this).attr("value", "0");
									}
									
									
									
									
							  		
							  	});
							  	$('.fa-thumbs-up').on('click', function() {
							  		
							  		console.log("첫 벨류값"+$(this).attr("value"));
									var check=(String)($(this).attr("value"));
									var iconconnum = (String)($(this).attr("value1"));
							  		var count=Number($('#'+"thum"+iconconnum).text());
							  		

									console.log("click");
									if(check == "0"){
										console.log($(this).attr("value"));
										$.ajax({
											url: "good.db",
											type: "post",
											data: {
												good : check,
												contentnum : iconconnum
											},
											dataType: 'text',
											success: function(data){
												console.log("성공");
											}
										});
										$(this).attr("class", "fas fa-thumbs-up");
										$(this).attr("value", "1");
										count+=1;
										$('#'+"thum"+iconconnum).text(count);
										console.log("pointck"+pointck);
										
									}else if(check == "1"){
										console.log(check);
										$.ajax({
											url: "good.db",
											type: "post",
											data: {
												good : check,
												contentnum : iconconnum
											},
											dataType: 'text',
											success: function(data){
												console.log("성공");
											}
										});
										$(this).attr("class", "far fa-thumbs-up");
										$(this).attr("value", "0");
										count-=1;
										$('#'+"thum"+iconconnum).text(count);
									}					  		
							  	});
														
							} // end - success
						}); // end - ajax
						
					});  
				  
			  	
			  	
			  	
			  	
			  	
			  	
			  	
			  	
			  	
		  });
		 
		 
		  
		  
		 </script>
	</head>
		
	<body>
	<!-- header -->
		<jsp:include page="../include/header.jsp"></jsp:include> 
		
	<!-- content -->
		
		<!--  region -->
		<div class="container text-center">
			<div class="col-sm-12" >	
				<div class="col-sm-2" style="float: left"  >
					<select name="theme" id="regionselect" class="form-control" > <!--셀렉트 부분-->
					
					</select>
				</div>
				
				<div class="col-sm-3" style="float: right">
					<div class="input-group" style="height: 100%">
						<input type="text" class="form-control" id="searchvalue" >
						<div class="input-group-btn">
							<button class="btn btn-default" type="button" style="height: 100%">
								<span class="glyphicon glyphicon-search" aria-hidden="true" id="search"></span>
							</button>
						</div>
					</div>
				</div>			
						
			</div>
		    <div class="row">
		    
		        <div class="col-sm-12" id="listdiv">
		        			
  	
							
					
		        </div>
		    </div>
		</div>
		
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
	
	</body>
</html>