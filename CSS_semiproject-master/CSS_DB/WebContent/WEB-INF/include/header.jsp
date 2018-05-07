<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
 <html>
 	<head>
 		  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		  <title>D.B.</title>
 		  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
		  <link rel="stylesheet" href="css/mynavbar.css" type="text/css" media="screen"/>
		  <style>
		  	  #navbarcss {
			      font-family: Montserrat, sans-serif;
			      margin-bottom: 0;
			      background-color: #e5faf5;
			      border: 10px;
			      font-size: 10px !important;
			      letter-spacing: 4px;
			      opacity: 0.9;
			      
			  }
			  navbar li a, .navbar a{ 
			      color :#000000 !important;
			  }
			 	  
			 .navbar-default .navbar-toggle{
			 	border-color : #3e9c9d !important;
			 	
			 }
			 .navbar-collapse{
			 border-color : #e5faf5 !important;
			 }
			 .icon-bar{
			 	background-color : #3e9c9d !important;
			 }
			 .navbar-default .navbar-toggle:focus, .navbar-default .navbar-toggle:hover{
			 	background-color : #e5faf5 !important;
			 }
			 #myNavbar ul {
    list-style:none;
    font-family: Helvetica, Arial, sans-serif;
    font-size: 24px;
    letter-spacing: -2px;
    line-height: 1.2em;
    float:left;
    
    border:5px solid #e5faf5;
}

#myNavbar ul li a{
    display:block;
    text-decoration:none;
    padding:5px 10px 5px 10px;
    background-color:#e5faf5;
    width:170px;
    border-left:6px solid #000000; 
}
#myNavbar ul li a span{
    display:block;
}
#myNavbar ul li a span.title{
    color:#000000;
}
#myNavbar ul li a:hover{
    border-left:6px solid #3e9c9d;
}
#myNavbar ul li a:hover span.title{
    color:#3e9c9d;

}
#myNavbar ul li a span.text{
    padding:0px 5px;
    font-size: 8px;
    font-style: italic;
    font-weight: normal;
    letter-spacing: normal;
    line-height: 1.4em;
    visibility:hidden;
    color:#3e9c9d;
    text-align:right;
    border-top:5px solid #3e9c9d;
}
#myNavbar ul li a:hover span.text{
    visibility:visible;
}
		  </style>
		  <script type="text/javascript">
		  $(function(){
		  var sessionid = "<%=session.getAttribute("id")%>";
		 
		  //준수
		  	$('#a4').attr("href","mypage.db?myid="+sessionid);
		  //
	         if(sessionid !="null"){
	        	 
	        		if(sessionid=="admin"){
	        			//admin
	        			$('#a1').show();
	        			$('#a2').show();
	        			$('#a3').show();
	        			$('#a4').hide();
	        			$('#a5').hide();
	        			$('#a6').hide();
	        			$('#a7').hide();
	        			$('#a8').hide();
	        			$('#a9').show();
	        		}else{
	        			//일반
	        			$('#a1').hide();
	        			$('#a2').hide();
	        			$('#a3').hide();
	        			$('#a4').show();
	        			$('#a5').show();
	        			$('#a6').show();
	        			$('#a7').hide();
	        			$('#a8').hide();
	        			$('#a9').show();
	        		}
		      }else{
		    	  	$('#a1').hide();
	      			$('#a2').hide();
	      			$('#a3').hide();
	      			$('#a4').hide();
	      			$('#a5').hide();
	      			$('#a6').hide();
	      			$('#a7').show();
	      			$('#a8').show();
	      			$('#a9').hide();
	         }
		  });
		  </script>
	</head>
		
	<body>
	<!-- navbar -->
		<nav class="navbar navbar-default" id = "navbarcss">
			
		  <div class="container-fluid" style="clear:both; margin:20px;">
		    <div class="navbar-header">
		      <a href="main.jsp" style="text-decoration:none"><i class="fab fa-skyatlas fa-4x" style="float:left;  color:#3e9c9d;"></i>&nbsp;<b style="href-style:none; font-size:30px; color:#3e9c9d;">DB</b></a>
		      
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
			</div>
		 
		  
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav navbar-right">
		      	<li><a style="display:none" href="contentWrite.db" id="a1"><span class="title">글작성하기</span></a></li>
		      	<li><a style="display:none" href="contentList.db" id="a2"><span class="title">글목록보기</span></a></li>		      	
		      	<li><a style="display:none" href="memberManagement.db" id="a3"><span class="title">회원관리</span></a></li>
		      	<li><a style="display:none" href="mypage.db" id="a4"><span class="title">마이페이지</span></a></li>
		        <li><a style="display:none" href="zzim.db" id="a5"><span class="title">찜목록</span></a></li>
		        <li><a style="display:none" href="schedulemanage.db" id="a6"><span class="title">일정관리</span></a></li>
		        <li><a style="display:none" href="loginform.db" id="a7"><span class="title">회원가입</span></a></li>
		        <li><a style="display:none" href="login.db" id="a8"><span class="title">로그인</span></a></li>
		        <li><a style="display:none" href="logout.db" id="a9"><span class="title">로그아웃</span></a></li>
		      </ul>
		    </div> 
		   </div>  
		</nav>
	</body>
</html>