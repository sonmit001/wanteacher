<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileupload</title>
</head>
<body>
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		파일 : <input type="file" name="file"><br> 
		<input type="submit" value="파일 업로드">
	</form>
	<br>
	<a href="filedownload.jsp">다운로드</a> 
	<!-- <img src="http://localhost:8070/ContextPath/uploadtest5.jpg"/> -->
	<%String directory = application.getRealPath("/upload/");
	String img = "http://localhost:8070/" + directory + "uploadtest5.jpg";
	String test = directory + "uploadtest5.jpg";
	%>
	
	<%=request.getContextPath() %><br><hr>
	<%= img %><br><hr>
	<%= test %><br><hr>
	<img width="192" height="119" src="<%=img%>"/> 
	<img src="<%=test %>"/>
	<img src="file:///D:/sts_bitcamp/STS-Study/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Ex02_fileupload/upload/uploadtest5.jpg"
	width="192" height="119" >
</body>
</html>