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
int kor = Integer.parseInt(request.getParameter("kor")); 
int eng = Integer.parseInt(request.getParameter("eng"));
int math = Integer.parseInt(request.getParameter("math"));
int total = kor+eng+math;
int avg = total/3;
String grade = "";
switch(avg/10){
case 10: 
case 9: grade="A학점"; break;
case 8: grade="B학점"; break;
case 7: grade="C학점"; break;
default : grade ="F학점";
} %>

<body>
결과<hr>
이름 : <%=name %><br>
국어 : <%=kor %><br>
영어 : <%=eng %><br>
수학 : <%=math %><br>
총점 : <%=total %><br>
평균 : <%=avg %><br>
총점 : <%=grade %>
</body>
</html>