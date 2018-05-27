<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/dist/themes/proton/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/docs.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />

<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/apple-touch-icon-precomposed.png" />
<script src="${pageContext.request.contextPath}/resources/assets/jquery-1.10.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/dist/jstree.min.js"></script>

<title>JSTREE with BootStrap</title>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading"><b>메뉴 설정</b></div>
			<div class="panel-body">
				<div id="jstree_container"></div>
			</div>
		</div>
		
		<div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Modal Header</h4>
		        </div>
		        <div class="modal-body">
		          <p>Some text in the modal.</p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
	
	</div>
		
	
	<script type="text/javascript">
		$(document).ready(function(){
			getCategoryList();
		}); 	    
	    
		//tree 데이터 조회
	    function getCategoryList(){  
	    	$.ajax({
				url : "getCategoryList",
				type:"POST",
				dataType:"json",
				success : function(data){								
					setCategoryTree(data);
				}
	    	});
	    }
	    
		//조회된 treeData가지고 jstree 생성
	    function setCategoryTree(data){			
	    	$("#jstree_container").jstree({	
				"core": {
					'data' : data,
					'check_callback': true,
					'themes':{
						'name' : 'proton',
						'responsive' : true,
						'dots' : false
					},				
				},
				"plugins" : [ "dnd","contextmenu"],
				"contextmenu" : {
					"items" : function($node){
						var href = $node.a_attr.href;
						var tree = $("#jstree_container").jstree(true);
						
						if(href == null || href == "#"){ // 
							// 링크 만들기, 폴더 만들기, 이름 바꾸기, 삭제
							return {
					            "link_create": {
					                "separator_before": false,
					                "separator_after": false,
					                "label": "링크 추가",
					                "action": function (obj) { 
					                	   
					                }
					            },
					            "folder_create": {
					                "separator_before": false,
					                "separator_after": false,
					                "label": "그룹 추가",
					                "action": function (obj) { 
					                	$("#myModal").modal();  
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
					                   
					                }
					            },                         
					            "remove": {
					                "separator_before": false,
					                "separator_after": false,
					                "label": "삭제",
					                "action": function (obj) { 
					                   
					                }
					            }
					        };						
						}										
					}					
				}
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
	    	});
	    }
	</script>
</body>
</html>