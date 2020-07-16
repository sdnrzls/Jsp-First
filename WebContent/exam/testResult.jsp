<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String name = request.getParameter("name"); //출력받는 메소드 
String addr = request.getParameter("addr"); 
%>
<body>
결과 <hr>
이름 :<% out.println(name); %>
주소 :<% out.println(addr); %>
<hr>
이름 : <%=name %><br> <%--위의 아웃프린트와 동일한 코드--%>
주소 : <%=addr %>
</body>
</html>