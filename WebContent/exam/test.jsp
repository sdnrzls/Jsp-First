<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "testResult.jsp"> <%--<input> 태그의 formaction 속성은 폼 데이터(form data)가 서버로 제출될 때 입력 데이터를 처리할 파일의 URL을 명시  --%>
이름 : <input type= "text" name = "name"><br>
주소 : <input type= "text" name = "addr"><br>
<input type = "submit" value="전송"> <%--제출하는 버튼 생성--%>
</form>
</body>
</html>