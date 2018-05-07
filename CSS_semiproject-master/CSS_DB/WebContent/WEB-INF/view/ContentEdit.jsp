<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.css.dto.Content_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 

<!DOCTYPE html>
<html>
<% Content_DTO contentdto = (Content_DTO) request.getAttribute("contentdto"); %>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 수정하기</title>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<c:set var="imglist" value="${requestScope.imgnamelist}"/> 
	<c:set var="contentdto" value="${requestScope.contentdto}"/>
 
 
 	
	<SCRIPT type="text/javascript">
	 $( document ).ready(function() {
		 
	   $('#EXPECTEDHOUR').val(<%= contentdto.getExpectedhour()%>);
	
	 });
	
	  $.ajax({
			
			// theme 가져오기
			url : "getthemename.db",
			//서버가 client 응답 형식 : html
			dataType : "json",
			success:function(data){
				var intvalue = 1;
				$('#theme').append("<option value = '전체'>전체</option>");
				$.each(data,function(index,obj){
				var optionstr = '';
				optionstr = '<option value = "' + intvalue + '">' + obj.themename + '</option>';  				
				intvalue += 1;
				$('#theme').append(optionstr);
				});
				 $("#theme").val(<%= contentdto.getThemenum()%>);
			} 
		});	
	
	
	$.ajax({
			// region 가져오기
			url : "getregionname.db",
			//서버가 client 응답 형식 : html
			dataType : "json",
			success:function(data){
				var intvalue = 1;
				$('#regionselect').append("<option value = '전체'>전체</option>");
				$.each(data,function(index,obj){
				var optionstr = '';
				optionstr = '<option value = "' + intvalue + '">' + obj.regionname + '</option>';  				
				intvalue += 1;
				$('#regionselect').append(optionstr);
				});
				 $('#regionselect').val(<%= contentdto.getRegionnum() %>);
			} 		
		});	
	
	
	function check() {
		
		//빈칸들 걸러내기
		if(!db.title.value){
			alert("제목을 입력하세요");
			db.title.focus();
			return false;
		}
		if(db.theme.value == "전체"){
			alert("테마를 선택해주세요");
			db.title.focus();
			return false;
		} 
		if(!db.EXPECTEDHOUR.value){
			alert("예상 소요 시간을 넣어주세요");
			db.title.focus();
			return false;
		}
		var contentcheck = CKEDITOR.instances.content.getData();
		if(contentcheck==null || contentcheck == ""){
			alert("글을 작성해 주세요");
			return false;
		}
		
		
		document.db.submit();//통과되면 submit 하기
	}
	
	
	function previewImage(targetObj, View_area) {//blob으로  db에 사진 넣어주기
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;

	 	
	  //ie가 아닐때(크롬, 사파리, FF)
		 if (ua.indexOf("MSIE") <= -1) {
			var files = targetObj.files;
			for ( var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img"); 
				img.id = "prev_" + View_area;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100px'; 
				img.style.height = '100px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
	
  </script>
  <style>
  
    h2 {
      margin: 40px 0 0 0;
    }
     .color{
    color: black;
    background-color: #e5faf5;
    }
  
    /* select with custom icons */
     
    .ui-selectmenu-menu  .ui-menu-item-wrapper {
      padding: 0.5em 0 0.5em 3em;
    }
    .ui-selectmenu-menu .ui-menu-item .ui-icon {
      height: 24px;
      width: 24px;
      top: 0.1em;
    }
    
   .click{
   	border : 0;
   	outline: 0;
   }

 .click:focus,.click:active {
   outline: none !important;
   box-shadow: none;
	} 
	
	*:focus{
	outline: 0;	
	}

  </style>
</head>

<body>
<% int inputallow = (Integer)request.getAttribute("inpuallow"); %> 
	<script type="text/javascript">
	var k = <%=inputallow%>;
	
	   function back() {
			location.href="contentList.db?cp="+<%=request.getAttribute("cp")%> + "&ps=" +<%=request.getAttribute("ps")%>;
		}
	   
	//지울 이미지 이름들 form에 뿌려주기 
	//사진 지우기 해놓고 수정 취소를 할 수 있기 때문에
	 function imgdelete(str) {
			console.log(k);
			k+=1;
			console.log($(str).attr("id"));
		  
		 
		  $('#db').append("<input type='hidden' name='deleteimgname' value='"+$(str).attr("id")+"'>");//name이 같기 때문에 받는 쪽은 배열로 받아야 한다.
		  $(str).remove();//뷰단에서 이미지를 지워 준다.
		  
		  var td = "<td><div id= 'View_area"+k+"' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>";
		  var td2 = "<td width='5%' align='center' ><input type='file' class= 'form-control' accept='image/*' name='uploadfiles"+k+"' id='uploadfiles' onchange='previewImage(this,View_area"+k+")'></td>"; 
		  $('#imgfile tr:first').append(td);
		  $('#imgfile tr:last').append(td2); 
		  
	} 
	</script>
		<!-- header -->
		<jsp:include page="../include/header.jsp"></jsp:include>
	
		<!-- writer -->
		<div class= "container"  >
			<form name = "db" id="db" action="contenteditok.db?cp=<%=request.getAttribute("cp")%>&ps=<%=request.getAttribute("ps")%>" method = "post" enctype="multipart/form-data">
				
				<input type="hidden" name="contentnum" value="${contentdto.contentnum}">
				<input type="hidden" name="good" value="${contentdto.good}"> 
				
				<table width="100%" border="0" align="center">
					<colgroup width="20%">
  					<colgroup width="30%">
  					<colgroup width="50%">
					<tr>
						<td align="left" colspan="2"> <h2><b>글 수정하기</b></h2></td>
						<td style="visibility:hidden;">empty</td>
						<td style="visibility:hidden;">empty</td>
					</tr>
					
					<tr>
						<td  height= "24px" align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
						<td style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td align="center" class="color" > 제목</td>
						<td align="left"><input type="text" name= "title" id="title" size="50" value="${contentdto.title}"></td>
						<td style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td  align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
						<td style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td align="center"  class="color "> 테마</td>
						<td>
							<select name="theme" id="theme"  class="form-control">
		      	<!-- 				<option data-class="podcast" >꽃놀이</option> -->
	   						 </select>
   						 </td>
   						 <td style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td  align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
						<td style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td  align="center" class="color "> 지역</td>
						<td  >
							<select name="regionselect" id ="regionselect"  class="form-control">
		  <!--     					<option data-class="podcast">강남</option>   -->
	   						 </select>
   						 </td>
   						 <td style="visibility:hidden;">empty</td>
					<tr>
						<td  align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
						<td style="visibility:hidden;">empty</td>
					</tr>	
					<tr>
						<td  align="center" class="color "> 예상 소요 시간</td>
						<td  align="left">
							<select name="EXPECTEDHOUR" id="EXPECTEDHOUR"  class="form-control">
								<option value="1">1시간</option>
								<option value="2">2시간</option>
								<option value="3">3시간</option>
								<option value="4">4시간</option>
								<option value="5">5시간</option>
							</select>
						</td>
						<td style="visibility:hidden;">empty</td>
					</tr>	
					<tr>
						<td align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
						<td  style="visibility:hidden;">empty</td>
					</tr>	
					<tr>
						<td  align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
						<td  style="visibility:hidden;">empty</td>
					</tr>	
					</table>
					<table id="image" style="border: 1px solid black">
						<tr>
							<c:forEach var="imgsrc" items="${imglist}">
								<td  width="5%"><img id="${imgsrc}" alt="에러 ip주소를 확인해주세요" src="upload/${imgsrc}" style="width: 100px; height: 100px" onclick="imgdelete(this)"/><p>사진 클릭시 삭제</p></td>
							</c:forEach>
						</tr>
					</table>
					<table id="imgfile" style="border: 1px solid black">
						<tr>
						<c:forEach var="i" begin="1" end="<%= inputallow %>">
							<td><div id= "View_area${i}" style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>
						</c:forEach>
						</tr>

						<tr>
						<c:forEach var="i" begin="1" end="<%= inputallow %>">
								<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles${i}" id="uploadfiles" 
></td>
						</c:forEach>
						</tr>
						
						<!-- <tr>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles1" id="uploadfiles" onchange="previewImage(this,'View_area1')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles2" id="uploadfiles" onchange="previewImage(this,'View_area2')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles3" id="uploadfiles" onchange="previewImage(this,'View_area3')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles4" id="uploadfiles" onchange="previewImage(this,'View_area4')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles" id="uploadfiles" onchange="previewImage(this,'View_area5')"></td>
						</tr>	 -->	
					
					</table>
					
					<table  width="100%" border="0" align="center">
						<tr>
							<td colspan="5">
								<textarea rows="10" cols="60" name= "content" id="content">${contentdto.content}</textarea>
									<script type="text/javascript">
									var editor = CKEDITOR.replace('content',{						
									});
									</script>
							</td>
						</tr>
						<tr>
							<td width="5%" align="center" ></td>
							<td  style="visibility:hidden;">empty</td>
						</tr>	
						<tr>
							<td width="5%" align="center" ></td>
							<td  style="visibility:hidden;">empty</td>
						</tr>	
					</table>
 		</form>
 					<p align="right">
						<input class="btn color click" type="button" value="수정 하기" onclick="check()"/>
						<input class="btn color click" type="button" value="수정 취소" onclick="back()"/> 
					</p>
	 	</div>
 	
 	<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>