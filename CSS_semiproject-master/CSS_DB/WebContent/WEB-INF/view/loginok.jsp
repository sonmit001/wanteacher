<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
	String id = (String)request.getAttribute("id");
	String pwd = (String)request.getAttribute("pwd");
	
	
	if(msg != null && url != null){
%>
		 <script>
		 location.href='<%=url%>';
	     </script>
<%	  

session.setAttribute("id",id);
		
	}else{
		out.print("<script>localStorage.removeItem('id')</script>");
		
	}
%>