<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/contextmenu/dist/jquery.contextMenu.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

 <!-- contextmenu -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/contextmenu/dist/jquery.contextMenu.js"></script>

<style type="text/css">

	.selected{background: #eeeeee}
	.center{ text-align: center;};
	.bold-center{text-align: center; font-weight:bold};
 
</style>
</head>
<body>
<script type="text/javascript">

	function logout() {
		sessionStorage.clear();
		location.href = "login";
	}
	
var table

function makedatatable(){
	
	table =  $('#datatable').DataTable({
     	
		   select:true, 	
		   ajax: "getmemberlist",
		   destroy: true,
				   
		   columns: [ {data: "MNO" , className:'bold-center'},
	           {data: "ID", defaultCotent:""},
	           {data: "NAME"},
	           {data: "GENDER"},
	           {data: "TEL"},
	           {data: "EMAIL"},
	           {data: "ZIPCODE"},
	           {data: "DOROADDR"}]         
		    }) ;
		}

	$(document).ready(function(){
		
		makedatatable();
		var id = sessionStorage.getItem("id")
		console.log(id);
		$("#session_id").text(id);
	    $('#datatable tbody').on( 'click', 'tr', function () {
	    	
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	            $('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
	    } ); 

	    console.log(table);
	    
	    $.contextMenu({
            selector: '.selected', 
            callback: function(key, options){

            	//fngetData
            	
               console.log(table.row( '.selected' ).data().ID);
            	var id = table.row( '.selected' ).data().ID;
            	console.log(key);
            	if(key=="detail"){
            		console.log("상세보기")
            		
            		$.ajax({
            			  url: "getmemberlist",
                          type: "post",
                          data: { "id" : id },
                          dataType:'json',
                          success: function(data){
                        	  console.log(data);
                        	  console.log(data.data[0])
                        	  $.each(data.data,function(index,value){
									console.log(index + "/" + value);
									
									
									
									
									
									
									
								});
                          }
            		})
            		
            	}else if(key=="delete"){
            		$.ajax({
            			  url: "memberdelete",
                          type: "post",
                          data: { "id" : id },
                          success: function(data){
                        	  console.log(data);
                        	  
                        	  if(data==1){
                        	  $('#datatable').dataTable().fnDestroy();
                        		  
                        	  makedatatable();
                        	  }
                          }
            		})
            	}
            },
            items: {
                "detail": {name: "상세보기", icon: "edit" 
                },
                "cut": {name: "자르기", icon: "cut"},
               "copy": {name: "복사", icon: "copy"},
                "paste": {name: "붙여넣기", icon: "paste"},
                "delete": {name: "삭제", icon: "delete"},
                "sep1": "---------",
                "quit": {name: "Quit", icon: function(){
                    return 'context-menu-icon context-menu-icon-quit';
                }}
            }
        });

        $('.selected').on('click', function(e){
            console.log('clicked', this);
        })    
	    
	})
	
</script> 
    <!-- container -->
    <div>
    	<span id="session_id"></span> 님 방가 <input type="button" onclick="logout()" value="로그아웃">
    </div>
    <div class="container"  style="min-height: 820px;">
        <div class="wall">
            <h2><b>회원관리</b></h2>
        </div>
        
 <!-- class="table table-hover table-bordered" -->
            <table id="datatable" class="table">
            	<thead>
	                <tr class="info">
	                	<th>순번</th>
	                    <th>아이디</th>
	                    <th>이름</th>
	                    <th>성별</th>
	                    <th>전화번호</th>
	                    <th>이메일</th>
	                    <th>우편번호</th>
	                    <th>주소</th>
	                    
	                </tr>
                </thead>
            </table>
        </div>
        
        
        <div class="modal fade" id="myModal" role="dialog">
    		<div class="modal-dialog">
		  	  <!-- Modal content-->
      			<div class="modal-content">
	        		<div class="modal-header">
		         		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 class="modal-title"><b>회원 상세보기</b></h4>
	        		</div>
	        	
		        	<div class="modal-body">
		        		<table class="table">
		        			<colgroup>
		        				<col width="40%">
		        				<col width="60%">
		        			</colgroup>
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">가입일 : </td>
		        				<td><input type="text" id="signdate" name="signdate"   class="form-control"></td>
		        			</tr>		        			
		        			<tr>
		        				<td class="info" style="vertical-align: middle;">아이디 : </td>
		        				<td><input type="text" id="iddialog" name="iddialog"   class="form-control"></td>
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
		        	</div>
        	<div class="modal-footer">
        	<!-- type="submit" value="Submit" -->
        		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">확인</button>
        	</div>
      	</div>
    </div>
  </div>
<%--   ${pageContext.request.requestURL} http://localhost:8070/bit/WEB-INF/views/index/memberlist.jsp

  ${pageContext.request.contextPath}/bit --%>
  
</body>
</html>