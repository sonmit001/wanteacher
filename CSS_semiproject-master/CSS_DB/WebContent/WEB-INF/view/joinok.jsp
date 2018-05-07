<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String msg = (String)request.getAttribute("msg");
	out.print("msg"+msg);
  String url = (String)request.getAttribute("url");
  out.print("msg"+url);
  String id = (String)request.getAttribute("id");
  out.print("msg"+id);
  if(msg != null && url != null){
%>
	<script>		
		alert('<%= msg %>');		
	    location.href='<%=url%>';
	</script>
	
<%	  
  }
%>
