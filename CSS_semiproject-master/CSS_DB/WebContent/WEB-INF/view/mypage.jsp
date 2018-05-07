<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		  
		   
		  
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
		  <style>
		  .container {
			      padding : 100px 0px 40px 0px !important;
			      margin-right : auto;
			      margin-left : auto;
			}
		
		  .background{
		  background-color : #14c1c7;
		  }
		  .text{
		  color : #fff;
		  }
		  </style>
		  
		 
	</head>
	
	<script type="text/javascript">
	$(function(){
		
		var mypageid="<%=session.getAttribute("id")%>";
		var mypageage="<%=request.getAttribute("myage")%>";
		var mypagepwd="<%=request.getAttribute("mypwd")%>";
		var mypageemail="<%=request.getAttribute("myemail")%>";
		var mypagegender="<%=request.getAttribute("mygender")%>";
		var mypagenickname="<%=request.getAttribute("mynickname")%>";
		var partner="<%=request.getAttribute("partner")%>";
		var mypageruby="<%=request.getAttribute("myruby")%>";
	
		$('#loginid').attr("value",mypageid);
		$('#age').attr("value",mypageage);
		$('#pwd').attr("value",mypagepwd);
		$('#email').attr("value",mypageemail);
		$('#gender').attr("value",mypagegender);
		$('#nickname').attr("value",mypagenickname);
		$('#partner').attr("value",partner);
		$('#ruby').attr("value",mypageruby);
		
		
		if(partner=="null"||partner==""){
			$('#partner').attr("value","");
			$('#foot').append('<button type="button" class="btn btn-md background text"data-toggle="modal" data-target="#myModal" id="add">커플 신청</button>');
			$('#partnertable').show(); 
			
		}else{
			$('#foot').append('<button type="button" class="btn btn-md background text" id="can">커플 끊기</button>');
			$('#partnertable').hide();
		}
		
		
		$('#send').on("click",function(){

			if(mypageid==$("#partnerid").val()){
				alert("자기자신을 초대할 수 업습니다.");
			}else{
			$.ajax({
				url:"partnersend.db",
				type:"post",
				dataType : "text",	
				data : {
					"partnerid": $("#partnerid").val()
				},
				success:function(data){
					var check=data.trim();
					
					if(check=="false"){
						alert("신청 파트너가 존재하지 않거나 이미 보낸 초대입니다.");
					}else
					{
						alert("신청되었습니다");
					}
				}
			
				});
			
			}
		});
		
		
		$('#can').click(function(){
			var pch=null;
			$('#partnerid').attr("value","");
			console.log("ddd:"+$("#partnerid").val());
			location.href="partnerdel.db";
			 
			
			
		});
		
		
		
		
						$.ajax({
							url:"partnerlist.db",
							type:"post",			
							dataType:"json", 
							data : {
								"mypageid" : mypageid
							},
							success:function(data){
								$('#partnertable').empty();
								console.log("dd"+data);
								if(data==""){
									
								}else{
									var tablestr = '<div class="header"><h1 class="modal-title">커플신청 목록</h1></div><table class="table table-bordered">';
									tablestr += '<th>커플신청 아이디</th><th>승낙하기</th><th>거절하기</th> ';
									$.each(data,function(index,obj){
										tablestr+='<tr>';
										tablestr+='<td>' + obj.candidate + '</td>';
										tablestr+="<td><a class='btn btn-md background text' href='partneradd.db?candidate="+ obj.candidate+"&mypageid="+mypageid+"'>" + "승낙" + "</a></td>";
										tablestr+="<td><a class='btn btn-md background text' href='partnerno.db?candidate="+ obj.candidate+"&mypageid="+mypageid+"'>" + "거절" + "</a></td>";
										tablestr+='</tr>';
									});	
									tablestr+= '</table>';
									$('#partnertable').append(tablestr);
									
									
								}
								
							}
						});		
						
					
	});
	
	
	
	</script>
		
	<body>
	 
	<!-- header -->
	<div class="header">
		<jsp:include page="../include/header.jsp"></jsp:include>
	</div>	
	<!-- content -->
		
		<!--  region -->
		<div class="container" style="background-color: #ffffff; width: 550px; min-height: 820px;">
			<h1 style="margin-top:50px; margin-bottom:50px;">마이페이지</h1>
				<form action="usereditok.db" name="loginForm" method="post" >
					<div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>ID</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					      	<input type="text" class="form-control text-center" name="userId" id="loginid" readonly >
					      </div>
					     
				    </div>
				    <div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>NICKNAME</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					      	<input type="text" class="form-control text-center" name="nickname" id="nickname" readonly >
					      </div>
				    </div>
				    <div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PASSWORD</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					      	<input type="password" class="form-control text-center" name="pwd" id="pwd"  readonly>
					      </div>
				    </div>
				    <div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>AGE</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					      	<input type="text" class="form-control text-center" name="age" id = "age"  readonly>
					      </div>
				    </div>
				    <div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>GENDER</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					      	<input type="text" class="form-control text-center" name="gender" id = "gender"  readonly> 	
					      </div>
				    </div>
				     <div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>EMAIL</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					      	<input type="text" class="form-control text-center" name="email" id = "email" readonly >
					      </div>
				    </div>
				    <div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>RUBY</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					       <input type="text" class="form-control text-center" name="ruby" id = "ruby" readonly >
					      </div>
				    </div>
				    <div class="row" style="margin:0px 0px 8px 0px;">
					      <div class="col-sm-2 text-center">
					      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PATNER</b></label>
					      </div>
					      <div class="col-sm-10" style="padding-right : 0px;">
					       <input type="text"
											class="form-control text-center" name="partner" id="partner" readonly>
					      </div>
				    </div>
				    <div class="text-right" style="margin : 0px 0px 50px 0px; color: white;" id="foot">
								<button class="btn btn-md background text" type="button" href="#my_modal" data-toggle="modal">수정하기</button>
				    </div>
				</form>
					<div id="partnertable">
			 
			 		</div>
		 		</div>
		 		<!-- modal -->
						<div class="modal" id="my_modal">
				 			 <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							          <h4 class="modal-title">수정하기</h4>
							      </div>
							      
							      <div class="modal-body">
							        <form action="usereditok.db" name="loginForm" method="post" >
											<div class="text-center">
												<div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>ID</b></label>
										      </div>
										      <div class="col-sm-10" style="padding-right : 0px;">
										      	<input  type="text"
																class="form-control" name="userId" id="mloginid" value="${requestScope.mypid}" readonly >
										      </div>
										     </div>
										     </div>
									    <div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>NICKNAME</b></label>
										      </div>
										      <div class="col-sm-10" style="padding-right : 0px;">
										      	<input type="text" class="form-control" name="nickname" id="mnickname" value="${requestScope.mynickname}"  readonly>
										      </div>
									    </div>
									    <div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PASSWORD</b></label>
										      </div>
										      <div class="col-sm-10" style="padding-right : 0px;">
										      	<input type="password"
																class="form-control" name="pwd" id="mpwd" value="${requestScope.mypwd}">
										      </div>
									    </div>
									    <div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>AGE</b></label>
										      </div>
										      <div class="col-sm-10"  style="padding-right : 0px;">
										      	<select name="age" id="mage"  value="${requestScope.myage}" class="form-control">
													<option value="10">10대</option>
													<option value="20">20대</option>
													<option value="30">30대</option>
													<option value="40">40대</option>
													<option value="50">50대</option>
													<option value="60">60대</option>
												</select>
										      </div>
										 </div>
										 <div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="gender" style="margin-top:5px;"><b>GENDER</b></label>
										      </div>
										      <div class="col-sm-10" style="padding-right : 0px;">
										      	<select name="gender" id="mgender" class="form-control" value="${requestScope.mygender}">
													<option>남</option>
													<option>여</option>
												</select>
										      </div>
										 </div>
									     <div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>EMAIL</b></label>
										      </div>
										      <div class="col-sm-10" style="padding-right : 0px;">
										      	<input type="text"
																class="form-control" name="email" id = "memail" value="${requestScope.myemail}"  readonly>
										      </div>
									    </div>
									    <div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>RUBY</b></label>
										      </div>
										      <div class="col-sm-10" style="padding-right : 0px;">
										       <input type="text"
																class="form-control" name="ruby" id = "mruby" value="${requestScope.myruby}"  readonly>
										      </div>
									    </div>
									    <div class="row" style="margin:0px 0px 8px 0px;">
										      <div class="col-sm-2 text-center">
										      	<label for="focusedInput" for="id" style="margin-top:5px;"><b>PATNER</b></label>
										      </div>
										      <div class="col-sm-10" style="padding-right : 0px;">
										     <input type="text"
																class="form-control" name="patner" id="mpartner" value="${requestScope.partner}" readonly>
										      </div>
									    </div>
									    <div class="text-right" id="foot">
											<button type="submit" class="btn btn-md background text" style="margin-left: 120px;" id="butten">수정하기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				
	
			<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
												 <button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">파트너를 신청해주세요</h4>
												</div>
												<form action=""  name="loginForm" method="post" id="partnersend" >
												<div class="modal-body">
														<div class="form-group">
															<label for="id">파트너아이디</label> <input type="text"
																class="form-control" name="partnerid"  placeholder="Enter ID" id="partnerid">
														</div>
														
												</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-md background text"id="send" data-dismiss="modal">신청하기</button>
													
													</div>
												</form>
											</div>
										</div>
									</div>	
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
	
	</body>
</html>