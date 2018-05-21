<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<link rel="stylesheet" href="http://www.orangehilldev.com/jstree-bootstrap-theme/demo/assets/dist/themes/proton/style.css" />
	</head>
	<body>
	
  <!-- 3 setup a container element -->
	<div id="jstree">
    <!-- in this example the tree is populated from inline HTML -->
		<ul>
			<li>Root node 1
				<ul>
					<li id="child_node_1">Child node 1</li>
					<li>Child node 2</li>
				</ul>
			</li>
			<li>Root node 2</li>
		</ul>
	</div>
	
	
  <button>demo button</button>
  <button id="sam">create node</button>

  <script>
  
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree();
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });
    
    $("#sam").on("click",function() {
        $('#jstree').jstree().create_node('#' ,  { "id" : "ajson5", "text" : "newly added" }, "last", function(){
       alert("done");
    });
   });
    
    
  });
  </script>
</body>
</html>