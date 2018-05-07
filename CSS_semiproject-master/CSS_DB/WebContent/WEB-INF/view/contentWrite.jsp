<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 작성하기</title>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 

 
	<SCRIPT type="text/javascript">
	 
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
			} 		
		});	
	
	
	function back() {
		location.href="main.jsp";
	}
	  
	function check() {
		//빈칸들 걸러내기
		
		if(!db.title.value){
			alert("제목을 입력하세요");
			db.title.focus();
			return false;
		}
		/* if(!db.uploadfiles.value){
			alert("대표 이미지를 넣어주세요");
			db.title.focus();
			return false;
		}  */
		if(db.theme.value == "전체"){
			alert("테마를 선택해주세요");
			db.title.focus();
			return false;
		} 
		if(!db.EXPECTEDHOUR.value){//숫자 타입인지 확인하기 아니면 버튼 클릭으로하기
			alert("예상 소요 시간을 넣어주세요");
			db.title.focus();
			return false;
		}
		
		var contentcheck = CKEDITOR.instances.content.getData();
		if(contentcheck==null || contentcheck == ""){
			alert("글을 작성해 주세요");
			return false;
		}
		
		
		document.db.submit();
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
			/* 	img.align = 'right'; */
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
	
	
	
/*   $( function() {
    $.widget( "custom.iconselectmenu", $.ui.selectmenu, {
      _renderItem: function( ul, item ) {
        var li = $( "<li>" ),
          wrapper = $( "<div>", { text: item.label } );
 
        if ( item.disabled ) {
          li.addClass( "ui-state-disabled" );
        }
 
        $( "<span>", {
          style: item.element.attr( "data-style" ),
          "class": "ui-icon " + item.element.attr( "data-class" )
        })
          .appendTo( wrapper );
 
        return li.append( wrapper ).appendTo( ul );
      }
    });
 
 
    $( "#theme" )
      .iconselectmenu()
      .iconselectmenu( "menuWidget" )
        .addClass( "ui-menu-icons customicons" );
    
    $( "#region" )
    .iconselectmenu()
    .iconselectmenu( "menuWidget" )
      .addClass( "ui-menu-icons customicons" );
  } ); */
  </script>
  <style>
  
    h2 {
      margin: 40px 0 0 0;
    }

    /* select with custom icons */
     
 /*    .ui-selectmenu-menu  .ui-menu-item-wrapper {
      padding: 0.5em 0 0.5em 3em;
    }
    .ui-selectmenu-menu .ui-menu-item .ui-icon {
      height: 24px;
      width: 24px;
      top: 0.1em;
    } */
    /* 아이콘 이미지 파일 경로  *//*
    .ui-icon.video {
      background: url("images/test.JPG") 0 0 no-repeat;
      
    }
    .ui-icon.podcast {
      background: url("images/test.JPG") 0 0 no-repeat;
    }
    .ui-icon.rss {
      background: url("images/test.JPG") 0 0 no-repeat;
    }  */
    
    
    /* 클릭시 outline 파란색 없애기  */
   .click{
   	border : 0;
   	outline: 0;
   }

	.click:focus,.click:active {
    outline: none !important;
   box-shadow: none;
	} 
	
	*:focus{
	outline: 0 !important;	
	}

  </style>
</head>

<body >
		<!-- header -->
		<jsp:include page="../include/header.jsp"></jsp:include>
	
		<!-- writer -->
		<div class= "container"  >
			<form name = "db" action="writeok.db" method = "POST" enctype="multipart/form-data">
			
				<table width="100%" border="0" align="center">
			
			
			 		<colgroup width="20%">
  					<colgroup width="30%">
  					<colgroup width="50%">
					<tr>
						<td align="left" colspan="2"> <h2><b>글 작성하기</b></h2></td>
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
						<td align="left"><input type="text" class="form-control" name= "title" id="title" size="50"></td>
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
					
					
					
					
					<table style="border: 1px solid black">
						<tr>
							<td><div id='View_area1' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>
							<td><div id='View_area2' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>
							<td><div id='View_area3' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>
							<td><div id='View_area4' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>
							<td><div id='View_area5' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>
						</tr>
						<tr>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles1" id="uploadfiles" onchange="previewImage(this,'View_area1')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles2" id="uploadfiles" onchange="previewImage(this,'View_area2')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles3" id="uploadfiles" onchange="previewImage(this,'View_area3')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles4" id="uploadfiles" onchange="previewImage(this,'View_area4')"></td>
							<td width="5%" align="center" ><input type="file" class= "form-control" accept="image/*" name="uploadfiles" id="uploadfiles" onchange="previewImage(this,'View_area5')"></td>
						</tr>	
						
					<!-- <input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
					<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div> -->
					
					</table>
				
					
					<table  width="100%" border="0" align="center">
						
						<tr>
							<td width="5%" align="center" ></td>
							<td  style="visibility:hidden;">empty</td>
						</tr>
						<tr>
							<td colspan="5">
								<textarea rows="10" cols="60" name= "content" id="content">&nbsp;</textarea>
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
						<input class="btn btn btn-success btn-md text click" type="button" value="작성 하기" onclick="check()" />
						<input class="btn btn btn-danger btn-md text click" type="button" value="작성 취소" onclick="back()"/> 
						</p>
 		 					
 	</div>
 	
 	<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>