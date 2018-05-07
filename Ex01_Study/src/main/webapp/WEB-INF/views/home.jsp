<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${pagecontext.request.contextpath}/resources/ckeditor/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="${pagecontext.request.contextpath}/css/content.css" rel="stylesheet" type="text/css">
 
 
 
 <!-- ���� ���ε� ���� http://www.happyjung.com/lecture/2069 -->
 
	<SCRIPT type="text/javascript">
	
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;
	  //ie�϶�(IE8 ���Ͽ����� �۵�)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path(IE9, IE10���� ��� �Ұ�)
				var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error�� ������ delete
				}
				var img = document.getElementById(View_area); //�̹����� �ѷ��� ��
				//�̹��� �ε�, sizingMethod�� div�� ���缭 ����� �ڵ����� �ϴ� ����
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
	  //ie�� �ƴҶ�(ũ��, ���ĸ�, FF)
		} else {
			var files = targetObj.files;
			for ( var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //�̹��� �����ϰ�츸.. �ѷ��ش�.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area); //������ �̸����Ⱑ �ִٸ� ����
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
				if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
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
	
	
	
	
	
	function check(){
		alert("check()")
	
		document.db.submit();
			
	};
	
	
  $( function() {
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
 
    
    
          
    
  } );
  </script>
  <style>
  
    h2 {
      margin: 30px 0 0 0;
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
    /* ������ �̹��� ���� ���  */
    .ui-icon.video {
      background: url("images/test.JPG") 0 0 no-repeat;
      
    }
    .ui-icon.podcast {
      background: url("images/test.JPG") 0 0 no-repeat;
    }
    .ui-icon.rss {
      background: url("images/test.JPG") 0 0 no-repeat;
    }
    
    
    .color{
    color: white;
    background-color: #FAB0BF;
    
    }
    /* Ŭ���� outline �Ķ��� ���ֱ�  */
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

<body  style="background-color:#FFF1EA;">
		<!-- header -->
	
		<!-- writer -->
		<div class= "container"  >
			<form name = "db" action="content_testing.jsp" method = "POST" enctype="multipart/form-data">
			
				<table width="100%" border="0" align="center">
					<tr>
						<td width="5%" align="left" colspan="2"> <h2>�� �ۼ��ϱ�</h2></td>
				
					</tr>
					<tr>
						<td width="5%" height= "24px" align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td width="5%" align="center" class="color" > ����</td>
						<td width="40" align="left"><input type="text" name= "subject" size="40"></td>
					</tr>
					<tr>
						<td width="5%" align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td width="5%" align="center" class="color "> �׸�</td>
						<td width="40%" >
							<select name="theme" id="theme">
							<!-- ���߿� THEME ���̺��� �׸� �̸�, �׸� �׸��� �����;��Ѵ�.  -->
		      					<option data-class="podcast" >�ɳ���</option>
		    			  		<option data-class="podcast">�߰�</option>
		     					<option selected="selected" data-class="podcast">�Ĵ�</option>
		      					<option data-class="podcast">�</option>
		      					<option data-class="podcast">���̵���</option>
	   						 </select>
   						 </td>
					</tr>
					<tr>
						<td width="5%" align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
					</tr>
					<tr>
						<td width="5%" align="center" class="color "> ����</td>
						<td width="40%" >
							<select name="region" id="region">
							<!-- ���߿� THEME ���̺��� �׸� �̸�, �׸� �׸��� �����;��Ѵ�.  -->
		      					<option data-class="podcast">����</option>
		    			  		
		     					<option data-class="podcast" selected="selected">ȸ��</option>
		      					<option data-class="podcast">���¿�</option>
		      					<option data-class="podcast">���̵���</option>
	   						 </select>
   						 </td>
					<tr>
						<td width="5%" align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
					</tr>	
					<tr>
						<td width="5%" align="center" class="color "> ���� �ҿ� �ð�</td>
						<td width="40" align="left"><input type="text" name= "subject" size="40"></td>
					</tr>	
					<tr>
						<td width="5%" align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
					</tr>	
					<tr>
						<td width="5%" align="center" ></td>
						<td  style="visibility:hidden;">empty</td>
					</tr>	
					<tr>
						
						<td ><div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div></td>
					<td width="5%" align="center" ><input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')"></td>
					</tr>	
					
					<!-- <input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div> -->
					
						
					<tr>
						<td colspan="2">
						<textarea rows="10" cols="60" name= "content" id="content">
						this is my textarea to be replace with ckeditor.
						</textarea>
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
					<p align="right">
					<input class="btn color click" type="button" value="�ۼ� �ϱ�"  onclick="check()" />
					<input class="btn color click" type="button" value="�ۼ� ���"/> 
					</p>
 	
 	
 	</form>
 	</div>
 	
 	<!-- footer -->

</body>
</html>