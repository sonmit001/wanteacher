<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>D.B.</title>
		
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		 
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
 	<script src= "https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
 	<link href="css/button.css" rel="stylesheet" type="text/css">
		<style>
		.container {
			      padding : 150px 0px 40px 0px !important;
			      margin-right : auto;
			      margin-left : auto;
			}
			
		</style>
		<script type="text/javascript">
		var trim1;
		var trim2;
		var trim3;
		
		//유효성검사 validate 완료
		$(function(){
			$.validator.addMethod("regx",
					function(value, element, regexpr) {
						return regexpr.test(value);
					}
			);

			$('#submits')
			.validate(
					{
						rules : {
							id : {
								required : true,
								rangelength : [ 3, 20 ],
								regx : /^[a-z|0-9|A-Z]+$/  
							},
							nickname : {
								required : true,
								rangelength : [ 3, 20 ],
								regx : /^[a-z|0-9|A-Z|ㄱ-ㅎ|가-힣]+$/  
							},
							pwd : {
								required : true,
								rangelength : [ 3, 20 ],
								regx :/^[a-z|0-9]+$/ 
							},
							pwds : {
								required : true,
								rangelength : [ 3, 20 ],
								 equalTo: '#pwd'
							},
							 
							email : {
								 required: true,
					             email: true
							}
						},
						messages : {
							id : {
								required : "아이디를 입력해주세요.",
								rangelength : $.validator.format("아이디의 글자수는 3~20자까지 입니다."),
								regx : "아이디는 영문자와 숫자만 가능합니다.!!!"
							},
							nickname : {
								required : "닉네임을 입력해주세요.",
								rangelength : $.validator.format("닉네임 글자수는 3~10자까지 입니다."),
								regx : "닉네임은 영문자와 숫자만 가능합니다.!!!"
							},
							pwd : {
								required : "비밀번호를 입력해주세요.",
								rangelength : $.validator.format("암호의 글자수는 3~20자까지 입니다."),
								regx : "암호는 영문자와 숫자만 가능합니다.!!!"
							},
							pwds : {
								required : "비밀번호 확인을 해주세요.",
								rangelength : $.validator.format("암호의 글자수는 3~20자까지 입니다."),
								equalTo:"비밀번호가 일치하지않습니다."
							},
							 
							email : {
								required : "이메일 입력해주세요.",
								email : "이메일 형식이 아닙니다."
							}
							
						}
					});
			
			
			 $('#btn').click(function(){
				
		          if($('#id').val() == ""){
		        	  
		            $("#id").focus();
		           
		          }else{
		        	            
		        	   $.ajax(
		 			         {
		 			          url:"idcheck.db", 
		 			          data:{id:$("#id").val()},
		 			          dataType:"text",
		 			          success:function(responsedata){
		 			        	  trim1=responsedata.trim()
		 			        	 
		 			        	if(trim1=="true"){
		 			        	 	alert("사용할 수 있는 아이디입니다.");
		 			        		console.log("id true");
		 			        	}else{
		 			        		alert("중복되는 아이디입니다.");
		 			        		console.log("id false");
		 			        	}
		 			        
		 			          
		 			           }
		 			          });     
		            }
		          
		     });
			

	            $('#btn2').click(function(){
	            	
	        		
	            
					
	          if($('#nickname').val() == ""){
	        	
	            $("#nickname").focus();
	           
	          }else{
	        	            
	        	   $.ajax(
	 			         {
	 			          url:"namecheck.db", 
	 			          data:{nickname:$("#nickname").val()},
	 			          dataType:"html",
	 			          success:function(responsedata){ 
	 			        	 trim2=responsedata.trim()
	 			        	
	 			        	if(trim2=="true"){
	 			        	 	alert("사용할 수 있는 닉네임입니다.");
	 			        	 	console.log("nick true");
	 			        		
	 			        	}else{
	 			        		alert("중복되는 닉네임입니다.");
	 			        		console.log("nick false");
	 			        	}
	 			        
	 			          
	 			        	
	 			           }
	 			          });     
	            }
	          
	     });
			

	    		
	            $('#btn3').click(function(){
	            	
	            	
	          if($('#email').val() == ""){
	            $("#email").focus();
	          
	          }else{
	        	            
	        	   $.ajax(
	 			         {
	 			          url:"emailcheck.db", 
	 			          data:{email:$("#email").val()},
	 			          dataType:"html",
	 			          success:function(responsedata){ 
	 			        	 trim3=responsedata.trim()
	 			        	
	 			        	if(trim3=="true"){
	 			        	 	alert("사용할 수 있는 이메일입니다.");
	 			        	 	console.log("email true");
	 			        		
	 			        	}else{
	 			        		alert("중복되는 이메일입니다.");
	 			        		console.log("email false");
	 			        	}
	 			        
	 			          
	 			        	
	 			           }
	 			          });     
	            }
	        
	     });
	            
	     $('#submit').click(function(){
	    	if(trim1=="true" && trim2=="true" && trim3=="true"){
	    		$('.form').attr("action","memberInsert.db");
	    	}else{
	    		alert("다시 입력해 주세요");
	    		
	    	} 
	     });
		
			
	}); 
	
		
	
		
		</script>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="../include/header.jsp"></jsp:include>
	
		<!-- content -->
			<!-- 회원가입 -->
    <i id="alert"></i>
	<div class="container" style="background-color: #ffffff; width: 550px; min-height: 820px;;">
		<h1 style="text-align: center;">회원가입</h1>
		<form class="form" action="" id="submits" name="submits">
			<div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>ID</b></label>
			      </div>
			      <div class="col-sm-7">
			      	<input class="form-control " name="id" id="id" type="text" placeholder="아이디를 입력해주세요">
			      </div>
			      <div class="col-sm-3">
			      	<button class="btn btn-md background text" type="button" name="btn" id="btn">ID중복체크</button>
			      </div>
		    </div>
		    <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>NICKNAME</b></label>
			      </div>
			      <div class="col-sm-7">
			      	<input class="form-control " name="nickname" id="nickname" type="text" placeholder="닉네임을 입력해주세요">
			      </div>
			      <div class="col-sm-3">
			      	<button class="btn btn-md background text" type="button" name="btn2" id="btn2">닉네임
						체크</button>
			      </div>
		    </div>
		     <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PASSWORD</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<input class="form-control " name="pwd" id="pwd" type="password" placeholder="비밀번호를 입력해주세요">
			      </div>
			 </div>
		     <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PASCHECK</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<input class="form-control " name="pwds" id="pwds" type="password" placeholder="재입력해주세요">
			      </div>
			 </div>
			  <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>AGE</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<select name="age" id="age" class="form-control">
						<option value="10">10대</option>
						<option value="20">20대</option>
						<option value="30">30대</option>
						<option value="40">40대</option>
						<option value="50">50대</option>
						<option value="60">60대</option>
					</select>
			      </div>
			 </div>
			 <div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="gender" style="margin-top:5px;"><b>GENDER</b></label>
			      </div>
			      <div class="col-sm-10">
			      	<select name="gender" id="gender" class="form-control">
						<option>남</option>
						<option>여</option>
					</select>
			      </div>
			 </div>
			<div class="row" style="height:53px; margin:0px 0px 8px 0px;">
			      <div class="col-sm-2 text-center">
			      	<label for="focusedInput" for="email" style="margin-top:5px;"><b>EMAIL</b></label>
			      </div>
			      <div class="col-sm-7">
			      	<input class="form-control " name="email" id="email" type="text" placeholder="이메일을 입력해주세요">
			      </div>
			      <div class="col-sm-3">
			      	<button class="btn btn-md background text" type="button" name="btn3" id="btn3">email 체크</button>
			      </div>
		    </div>
			<div class="form-group">
				<div style="text-align: center;">
					
					<input class="btn btn-md background text" id="submit" type="submit" value="확인"name="submits">
					<input class="btn btn-md background text" type="reset" value="취소" id="reset">
				</div>
			</div>
		</form>
	</div>
	<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>