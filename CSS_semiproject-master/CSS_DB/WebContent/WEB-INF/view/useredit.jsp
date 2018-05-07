<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
	
	if(msg == "true"){
%>
		 <script>		
		   alert("수정되었습니다");		
		   location.href='<%=url%>';
	     </script>
	  <%}
	else{
		%>
		<script>		
		   alert('실패하였습니다');		
		   location.href='<%=url%>';
	     </script>
		<%
		}
	  %>
	  