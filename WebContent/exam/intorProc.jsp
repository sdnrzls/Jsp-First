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
	String[] pgm = (request.getParameterValues("pgm"));
	String[] play = (request.getParameterValues("play"));
	String str="";
	String st=""; 
	for(int i=0; i<pgm.length; i++){
		str += pgm[i]+" ";
	}
	for(int i=0; i<play.length; i++){
		st += play[i]+" ";
	}
%>
<body>
성명 : <%=request.getParameter("name") %><br>
성별 : <%=request.getParameter("man") %><br>
생년월일 : <%=request.getParameter("year") %>
<%=request.getParameter("month") %>
<%=request.getParameter("day") %>
<%=request.getParameter("yy") %><br>
주소 : <%=request.getParameter("addr") %><br>
전화번호 : <%=request.getParameter("phone") %>
<%=request.getParameter("phone1") %>
<%=request.getParameter("phone2") %><br>
사용 가능한 프로그램 : <%=str %><br>
가고싶은 여행지 : <%=st %><br>
메모 : <%=request.getParameter("memo") %>
</body>
</html>