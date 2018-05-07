<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileupload</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		String files[] = new File(directory).list();
		
		for(String file : files){
			out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
				java.net.URLEncoder.encode(file,"UTF-8") +"\">" +file + "</a><br>");
					
		}
	%>
	 
</body>
</html>