<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script><script>

	function getzipcode() {
	    new daum.Postcode({
	        oncomplete: function(data) { // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
            }
        }).open();
    }
</script>
<title>Login</title>
<script type="text/javascript">

	$(function () {
		
		
		$('#join').on("click",function(){
			$('#form')[0].reset();
			
			$('#myModal').modal();
			
		});
		//var result = "${result}"; //"" , "1", "0"
		var idck=1;
		
			$('#sumbit').on("click",function(){
				
				var input_id = $('#iddialog').val();
				var input_pwd = $('#pwd').val();
				var input_pwdck = $('#pwdck').val();
				var gender =$('input[name=optradio]:checked').val();
				var phone = $('#phone').val();
				var postCode = $('#postCode').val();
				var roadAddress = $('#roadAddress').val();
				var adressDetail = $('#adressDetail').val();
				var name = $('#name').val();
				var email = $('#email').val();
				

				if(idck!=0){
					alert("아이디 중복체크 해주세요.")
					return false;
				}				
				if($.trim(input_pwd)==""){
					alert("비밀번호를 입력해 주세요")
					$('#pwd').val().focus();
					return false;
				}
				if(input_pwd != input_pwdck){
					alert("비밀번호가 맞지 않습니다")
					$('#pwdck').val("").focus();
					return false;
				}
				if(gender==""){
					alert("성별을 체크해 주세요")
					return false;
				}
				if($.trim(email)==""){
					alert("이메일 입력해주세요")
					$('#email').val().focus();
					return false;
				}

				//	$('#singup').submit();

				var form = { 
						iddialog : input_id,
						pwd : input_pwd,
						optradio : gender,
						phone : phone,
						postCode : postCode,
						roadAddress : roadAddress,
						adressDetail : adressDetail,
						name : name,
						email : email
							}
			
				$.ajax({
					url : "singup",
					type : "post",
					data : form,
					success : function (data) {
						console.log(data)
						if(data==1){
							alert("회원 가입을 축하합니다.")
							$('#myModal').modal("toggle");
							
/* 
	회원가입 하면 모달창이 닫히는게 아니라 data 결과값이 화면에 찍힘			
*/
						}
					}
				});
				
				
			});
				
		
		$('#idcheckdialog').on("click",function(){
			var input_id = $('#iddialog').val();
			
			if(input_id == "" || $.trim(input_id)==""){
				alert("아이디를 입력해주세요");
				$('#iddialog').val(""); 
				 $('#iddialog').focus();
				return false;
			}
			
		var form = { id :$('#iddialog').val()}
		
			$.ajax({
				url: "idck" ,
				type:"post",
				data: form,			
				success: function (data) {
					console.log(data);
					if(data==0){
						alert("사용가능한 아이디입니다.")
						idck = data.trim();
						$('#name').focus();
					}else{
	 					alert("사용 불가능합니다")
	 					$('#iddialog').val("").focus();					
	 				}
				}
			});
		})
		
		$('#findid').on("click",function(){
			var form = { name : $('#findname').val(),
						email : $('#findemail').val()
					}
			
			$.ajax({
				url : "findid",
				type : "post",
				data : form,
				success: function (data) {
					
					console.log(data)
// 					if(data==null){
// 						alert("해당 아이디가 없습니다.")
// 					}else{
// 						alert(data)
// 						}
					
				}
				
			})
		
		})
		
		
	
	});

</script>

</head>
<body>
<script type="text/javascript">

function loginck() {
	
	var form = { id : $('#id').val(),
				pw : $('#pw').val()}
	
		$.ajax({
			url : "loginck",
			type : "post",
			data : form,
			success: function (data) {
				console.log(data);
				if(data==0){
					alert("아이디 혹은 비밀번호를 확인하여 주세요")
					$('#id').val("");
					$('#pw').val("");
				}else{
					sessionStorage.setItem('id', $('#id').val());
					location.href="loginok"
				}
			}
		});
	};
	
	


</script>

	<div class="container" style="width: 30%; margin-top: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading" style="text-align: center"><b>로그인</b></div>
			<div class="panel-body">
				<form action="">
					<table class="table">
						<tr>
							<td>
								<div class="input-group">
			      				    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			     			 	    <input id="id" type="text" class="form-control" name="id" placeholder="아이디 입력">
		  					    </div>
	  					    </td>
	  					</tr>
	  					<tr>
	  						<td>
	  							<div class="input-group">
		  							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		  							<input id="pw" type="password" class="form-control" name="password" placeholder="비밀번호 입력">
	  							</div>
	  						</td>
	  					</tr>
					</table>
					<table class="table">
						<colgroup>
							<col width="50%">
							<col width="50%">							
						</colgroup>
							<tr class="active">
								<td>
									<button id="join" type="button" class="btn btn-success btn-sm" style="width:100%" > 
									<span class="glyphicon glyphicon-plus"></span> 회원가입</button>
								</td>
								<td>
							 		<button onclick="loginck()" type="button" class="btn btn-info btn-sm" style="width:100%">
									<span class="glyphicon glyphicon-log-in"></span> 로그인</button>
								</td>
							</tr>
							<tr class="active">
								<td colspan="2">
									<button type="button" class="btn btn-warning btn-sm" style="width:100%" data-toggle="modal" data-target = "#findout">
									<span class="glyphicon glyphicon-search"></span> 아이디/비밀번호 찾기</button>
								</td>
							</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="findout" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b>아이디 찾기</b></h4>
				</div>
					
					<div class="modal-body">
					
						<table class="table">
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tr>
								<td class="info" style="vertical-align: middle;">이름 : </td>
								<td><input type="text" id="findname" name="findname" class="form-control"></td>
							</tr>
							<tr>
								<td class="info" style="vertical-align: middle;">이메일 : </td>
								<td><input type="text" id="findemail" name="findemail" class="form-control"></td>
							</tr>
						</table>
						<div class="modal-footer">
        				<!-- type="submit" value="Submit" -->
        				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
          				<button class="btn btn-default btn-sm" id="findid">아이디 찾기</button>
        			</div>		
				</div>
			</div>
		</div>
	</div>
	
	
	 <div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog">
		    <!-- Modal content-->
      		<div class="modal-content">
	        	<div class="modal-header">
		         	<button type="button" class="close" data-dismiss="modal">&times;</button>
		          	<h4 class="modal-title"><b>회원 가입</b></h4>
	        	</div>
	        	
		        	<div class="modal-body">
		        	<form id="form">
		        		<table class="table">
		        			<colgroup>
		        				<col width="30%">
		        				<col width="40%">
		        				<col width="30%">
		        			</colgroup>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">아이디 : </td>
		        				<td><input type="text" id="iddialog" name="iddialog"   class="form-control"></td>
		        				<td><button type="button" id="idcheckdialog" class="btn btn-default btn-sm">중복확인</button></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">이름 : </td>
		        				<td><input id="name" name="name" type="text" class="form-control"></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">비밀번호 : </td>
		        				<td><input id="pwd" type="password" name="pwd" class="form-control" maxlength="10"></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">비밀번호 확인 :</td>
		        				<td><input id="pwdck" type="password" class="form-control" maxlength="10"></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">이메일 : </td>
		        				<td><input id="email" name="email" type="text" class="form-control"></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">성별:</td>
		        				<td><label class="radio-inline"><input type="radio" name="optradio" value="M">남</label></td>
								<td><label class="radio-inline"><input type="radio" name="optradio" value="W">여</label></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">전화 번호</td>
		        				<td><input type="text" name="phone" id="phone" class="form-control"></td>
		        				<td></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">우편 번호</td>
		        				<td><input type="text" id="postCode" name="postCode" class="form-control" readonly></td>
		        				<td><button type="button" class="btn btn-default btn-sm" onclick="getzipcode()">검색</button></td>
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">도로명 주소</td>
		        				<td colspan="2"><input type="text" id="roadAddress" name="roadAddress" class="form-control" readonly></td>        		
		        			</tr>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">상세 주소</td>
		        				<td colspan="2"><input type="text" id="adressDetail" name="adressDetail" class="form-control"></td>
		        			</tr>
		        		</table>
		        		</form>
		        	</div>
        	<div class="modal-footer">
        	<!-- type="submit" value="Submit" -->
        		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
          		<button class="btn btn-default btn-sm" id="sumbit">가입하기</button>
        	</div>
      	</div>
    </div>
  </div>
  
	
</body>
</html>