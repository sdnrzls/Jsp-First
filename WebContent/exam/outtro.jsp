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
	String[] pro = (request.getParameterValues("pro"));// 불러온 값을 배열로 줌
%>
<body>
성명 : <%=request.getParameter("name") %><br>
성별 : <%=request.getParameter("gen") %><br>
생년월일 : <%=request.getParameter("year"+"mon"+"day") %>
<%=request.getParameter("yy") %><br>
주소 : <%=request.getParameter("addr") %><br>
전화번호 : <%=request.getParameter("first"+"mid"+"last") %><br>

<%
	String str=""; //배열에 있는 전체 값을 보기위해 for문 사용
	if(pro!=null)
	for(int i=0; i<pro.length; i++){
		str += pro[i]+" ";
	}
%>
사용 가능한 프로그램 : <%=str %><br>
가고싶은 여행지 : <%=request.getParameter("tra") %><br>
</body>
</html>