<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/dist/themes/proton/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/docs.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/resources/assets/apple-touch-icon-precomposed.png" />
<script
	src="${pageContext.request.contextPath}/resources/assets/jquery-1.10.2.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/dist/jstree.min.js"></script>


<title>JSTREE with BootStrap</title>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<b>메뉴 설정</b>
			</div>
			<div class="panel-body">
				<div id="jstree_container"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			
			$.ajax({
				url : "getCategoryList",
				type:"POST",
				dataType:"json",
				success : function(data){	
					console.log(data);
			
					$("#jstree_container").jstree({	
							"core": {
							'data' : data,
							'themes':{
								'name' : 'proton',
								'responsive' : true,
								"dots": false
							},
							"check_callback" : true
						},
						"plugins" : [ "dnd","contextmenu" ], 

						"contextmenu" : {
							
							"select_node" : false,
							"items" : function($node){
						    	
						    	  var href = $node.a_attr.href;
								  var tree = $("#jstree_container").jstree(true);
						    	  
									if(href == null || href == "#"){  
										// 링크 만들기, 폴더 만들기, 이름 바꾸기, 삭제
										return {
								            "link_create": {
								                "separator_before": false,
								                "separator_after": false,
								                "label": "링크 추가",
								                "action": function (obj) { 
								                	
								                	  $('#form')[0].reset();
								                	  
									            	  var inst = $.jstree.reference(obj.reference);
									            	  console.log(inst.get_node(obj.reference));
									            	  console.log(inst.get_node(obj.reference).id);
									            	  
									            	  $('#linkAdd').modal();
									            	  
									            	  var par = inst.get_node(obj.reference).id;
									            	  
									            	  $('#linkAddSubmit').on("click",function(){
									            		  
									            		  var sharing = 0; //일단 default 0은 비공유
									            		  var url = $('#url').val();
									            		  var title = $('#title').val();
									            		 // var parent = par;
									            		  console.log(url,title,par);
									            		  var result = $("#share").prop("checked");
									            		  if(result){ sharing =1;}
									            		  console.log("sharing 여부")
									            		  console.log(sharing);
									            		  
									            		  var form = {url : url , title : title , parent : par, sharing: sharing}
									            		  
									            		  var k = 10000;
									            		  
									            		  $.ajax({
									            			  url: "linkAdd",
									            			  type :"POST",
									            			  data : form,
									            			  success : function(data){
									            					
									            				  $('#linkAdd').modal("toggle");
									            					console.log(data);
									            					//id 가져오는 문 만들기
									            					 $('#jstree_container').jstree().create_node(par ,  { "id" : data , "text" : title, "a_attr" :{"href":url} }, "last", function(){
													          });
								              			  }
								          			  })
								          			})
								                }
								            },
								            "folder_create": {
								                "separator_before": false,
								                "separator_after": false,
								                "label": "그룹 추가",
								                "action": function (obj) { 
								                	
								                	var inst = $.jstree.reference(obj.reference);
								                	var par = inst.get_node(obj.reference).id;
								                	
								                	 $('#form2')[0].reset();
								                	 $('#folderAdd').modal();
								                	 
								                	 $('#folderAddsubmit').on("click",function(){
								                		 
								                		 var foldername = $('#foldername').val();
								                		 var sharing = 0;
								                		 var form = {title : foldername, parent : par , sharing : sharing}
	
								               		  $.ajax({
								            			  url: "folderAdd",
								            			  type :"POST",
								            			  data : form,
								            			  success : function(data){
								            					console.log(data);
								            				  $('#folderAdd').modal("toggle");
								            					
								            					//id 가져오는 문 만들기
								            					 $('#jstree_container').jstree().create_node(par ,  { "id" : data , "text" : foldername}, "last", function(){
												          });
							              			  }
							          			  })
								                		 
								                		 
								                	 })
								                	
								                }
								            },
								            "rename": {
								                "separator_before": false,
								                "separator_after": false,
								                "label": "이름 수정",
								                "action": function (obj) { 					                	
								                	tree.edit($node);				                	
								                }
								            },                         
								            "remove": {
								                "separator_before": false,
								                "separator_after": false,
								                "label": "삭제",
								                "action": function (obj) { 
								                	console.log("누름");
													tree.delete_node($node);
								                    
								                }
								            }
								        };						
									}else{ // 링크 우클릭
										return {					           
								            "rename": {
								                "separator_before": false,
								                "separator_after": false,
								                "label": "이름 수정",
								                "action": function (obj) { 
								                	tree.edit($node);
								                   
								                }
								            },                         
								            "remove": {
								                "separator_before": false,
								                "separator_after": false,
								                "label": "삭제",
								                "action": function (obj) { 
								                  	console.log("누름");
								                	console.log(tree.is_selected(obj));
								                	if(tree.is_selected(obj)) {
								                		tree.delete_node(inst.get_selected());
													}
													else {
														tree.delete_node(obj);
													}
								                   
								                }
								            }
						                 }		
						            }	
                            }
                        }			    
					})	
					.bind("loaded.jstree", function (event, data) {
							
					})
				.bind("select_node.jstree", function (e, data) {
	 					console.log(data.node.a_attr);
						console.log(" 위에 속성");
						console.log(window.e);
						
					 	var href = data.node.a_attr.href;
						console.log(data.node.a_attr.href)
						var parentId = data.node.a_attr.parent_id;
						if(href == '#')
						return '';

						 window.open(href); 
						 
					}) 
			    	.bind('rename_node.jstree', function(event, data){
			    		var node_id = data.node.id;
			    		var node_text = data.text;
			    		
			    		$.ajax({
		        			url : 'updateNodeText',
		        			type: 'POST',
		        			data: {'id' : node_id, 'text' : node_text},
		        			success : function(result){
		        				if(result == 1)
		        					alert('수정되었습니다.');
		        				else
		        					alert('수정 실패');
		        			}
		        		});   
			    	})
			    	.bind('delete_node.jstree',function(event,data){
			    		console.log("삭제");
			    		var node_id = data.node.id;
			    		console.log(node_id);
			    		
			    		$.ajax({
			    			url:'deleteNode',
			    			type:'post',
			    			data:{'id' :node_id},
			    			success:function(result){
			    				console.log(result);
			    			}
			    			
			    		})
			    	
			    		
			    		
			    		
			    		
			    	})	;
				}
			})
		});
	</script>


	<div class="modal fade" id="linkAdd" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<b>URL 추가</b>
					</h4>
				</div>

				<div class="modal-body">
					<form id="form">
						<table class="table">
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tr>
								<td class="info" style="vertical-align: middle;">URL :</td>
								<td><input type="text" id="url" name="url"
									class="form-control"></td>
							</tr>
							<tr>
								<td class="info" style="vertical-align: middle;">제목 :</td>
								<td><input type="text" id="title" name="title"
									class="form-control"></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="share"> <label
									for="share">공유하기</label></td>
								<td></td>
							</tr>
						</table>
					</form>
					<div class="modal-footer">
						<!-- type="submit" value="Submit" -->
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">취소</button>
						<button class="btn btn-default btn-sm" id="linkAddSubmit">추가하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="folderAdd" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<b>폴더 추가</b>
					</h4>
				</div>

				<div class="modal-body">
					<form id="form2">
						<table class="table">
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tr>
								<td class="info" style="vertical-align: middle;">폴더 이름</td>
								<td><input type="text" id="foldername" name="foldername"
									class="form-control"></td>
							</tr>
						</table>
					</form>
					<div class="modal-footer">
						<!-- type="submit" value="Submit" -->
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">취소</button>
						<button class="btn btn-default btn-sm" id="folderAddsubmit">추가하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>