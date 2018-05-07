<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	Cookie[] cookie = request.getCookies();
	String id ="";
	String remember = request.getParameter("remember");
	if(cookie!=null){
		for(int i=0; i<cookie.length; i++){
			if(cookie[i].getName().trim().equals("id")){
				id=cookie[i].getValue();
			}
		}
	}else{
		for(int i=0; i<cookie.length; i++){
			cookie[i].setMaxAge(0);
			response.addCookie(cookie[i]);
			
		}
	}
	
%>
<!DOCTYPE>
<link href="/CSS_DB/css/button.css" rel="stylesheet" type="text/css">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>D.B.</title>
		  
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		 
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
		.container {
			      padding : 282px 0px 40px 0px !important;
			      margin-right : auto;
			      margin-left : auto;
			}
		
		</style>
		<script type="text/javascript">
		$(function(){
			$('#return').on('click',function(){
			location.href = "main.jsp";	
			});
		});
		</script>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="../include/header.jsp"></jsp:include>
	
		<!-- content -->
			<!-- 회원가입 -->
	
				<div class="container" style="background-color: #fff; width: 550px; min-height: 820px;"  >
		  			<h1 style="text-align: center;">로그인</h1>
				  <form class="form-horizontal" action="loginok.db" id="submits" name="submits" >
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="id" ><b>ID:</b></label>
				      <div class="col-sm-10">
				        <input type="text" class="form-control" value="<%=id %>" id="id" name="id" placeholder="아이디를 입력해주세요">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="pwd"><b>PASSWORD:</b></label>
				      <div class="col-sm-10">          
				        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요">
				      </div>
				    </div>
				    
				    <div class="form-group">        
				      <div class="col-sm-offset-2 col-sm-10">
				        <div class="checkbox">
				          <label><input type="checkbox" name="remember"> 아이디 저장하기</label>
				        </div>
				      </div>
				    </div>
				 
				    <div class="form-group text-right">        
				      <div class="col-sm-offset-2 col-sm-10">
				        <button type="submit" class="btn btn-md background text" style="margin-left: 120px;" id="button">확인</button>
				        <button type="reset" class="btn btn-md background text" id="return" >메인페이지로</button>
				      </div>
				    </div>
				    
				  </form>
				</div>
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>