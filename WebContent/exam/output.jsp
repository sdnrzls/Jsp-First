<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8"); // 코딩 
	String[] hobby = (request.getParameterValues("hobby"));// 불러온 값을 배열로 줌
%>
<body>
결과 <hr>
이름 : <%=request.getParameter("name") %><br>
학번 : <%=request.getParameter("num") %><br>
성별 : <%=request.getParameter("gen") %><br>
전공 : <%=request.getParameter("major") %><br>

<%
	String str=""; //배열에 있는 전체 값을 보기위해 for문 사용
	if(hobby!=null)
	for(int i=0; i<hobby.length; i++){
		str += hobby[i]+" ";
	}
%>
취미 : <%=str %>
</body>
</html>