<%@ page import="kr.or.bit.DAO.fileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024*1024*100;
		String encoding = "UTF-8";
		try{
		
		MultipartRequest multipartRequest
		= new MultipartRequest(request , directory , maxSize , encoding ,
				new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		int result;
		fileDAO dao = new fileDAO();
		result = dao.upload(fileName, fileRealName);
		
		/* new fileDAO().upload(fileName, fileRealName); */
		out.write("return : " + result +"<br>");
		out.write("파일명 : " + fileName +"<br>");
		out.write("실제 파일명: " + fileRealName + "<br>");
		}catch(Exception e){
			out.print(e.getMessage());
		}
	%>
</body>
</html>