<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--data table -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

 <!-- contextmenu -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/contextmenu/dist/jquery.contextMenu.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/contextmenu/dist/jquery.contextMenu.css">

<style type="text/css">

.selected{background: #eeeeee}

table{
    text-align: center;
}
 
 
</style>
</head>
<body>
<script type="text/javascript">
var id = sessionStorage.getItem("id")
	function logout() {
		sessionStorage.clear();
		location.href = "login";
	}

	$(document).ready(function(){
		$("#session_id").text(id);
	    $('#datatable').DataTable({
	     	
	    	
	   select:true, 	
	   serverSide: true,
	   processing: true,
	   ajax: {
		   url: 'getmemberlist',
		   dataSrc: '',
		   dataFilter: function(data){
			   console.log(data);
			  
			   return JSON.stringify(data);
			   
		   }
		   /* "dataSrc": "", */
/* 		   dataFilter: function(data){
	            var json = jQuery.parseJSON( data );
	            json.recordsTotal = json.total;
	            json.recordsFiltered = json.total;
	            json.data = json.list;
	 			console.log(json);
	            return JSON.stringify( json ); // return JSON string
	        } */
		    } ,
		    
		   columns: [ {data: "MNO"},
                {data: "ID"},
                {data: "NAME"},
                {data: "GENDER"},
                {data: "TEL"},
                {data: "EMAIL"},
                {data: "ZIPCODE"},
                {data: "DOROADDR"}] /*,
                 columnDefs: [
                	                	
                    { targets: [2,3,4,5,6], visible: true},
                  
                ]  */
		   
	   
	    });
	    
  
	    $('#datatable tbody').on( 'click', 'tr', function () {
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	            $('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
	    } ); 
		/*    callback: function(key, options) {
                var m = "clicked: " + key;
                window.console && console.log(m) || alert(m); 
            } */
	    $.contextMenu({
            selector: '.selected', 
            callback: function(key, options){
            	var m = "clicked: " + key + options.$trigger.attr("id");
               alert(m);

            },
            items: {
                "detail": {name: "상세보기", icon: "edit" 
                },
                "cut": {name: "자르기", icon: "cut"},
               copy: {name: "복사", icon: "copy"},
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
            </div>
        </div>
 <!-- class="table table-hover table-bordered" -->
       <!--  <div id="tablediv"> -->
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
                <!-- 데이터가 한건도 없는 경우  -->
         <%--        <tbody>
	                <c:forEach var="item" items="${list}" varStatus="status">
	                	<tr id="${item.ID}">
		                	<td>${status.count}</td>
		                	<td>${item.ID}</td>
		                	<td>${item.NAME}</td>
		                	<td>${item.GENDER}</td>
		                	<td>${item.TEL}</td>
		                	<td>${item.EMAIL}</td>
		                	<td>${item.ZIPCODE}</td>
		                	<td>${item.DOROADDR}</td>
	                	</tr>
	                </c:forEach>
                </tbody> --%>
<%--                 <tr>
                    <td colspan="9">
                        <ul class="pagination">
                            <!--이전 링크 --> 
                            <c:forEach var="i" begin="1" end="${numberlist}">
                            	 <c:choose>
                                            <c:when test="${current_page eq i}">
                                                <li class="active"><a>${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a href="memberlist?current_page=${i}">${i}</a></li>
                                            </c:otherwise>
                                 </c:choose>
                            </c:forEach>
                        </ul>
                    </td>
                </tr> --%>
            </table>
        </div>
        <span class="context-menu-one btn btn-neutral">right click me</span>
   <!--  </div> -->
</body>
</html>