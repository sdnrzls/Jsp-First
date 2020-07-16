<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "outtro.jsp" method="post">
	
	<table border="1" width="200" height="100">
	
	<tr>
		<td>성명</td>
		<td><input type = "text" name="name"></td>
		<td>성별</td>
		<td>
		<input type = "radio" name="gen" value="man"checked id="man">
		<label for="man">남자</label>
		<input type = "radio" name="gen" value="woman" id="feman">
		<label for="feman">여자</label>
		</td>
	</tr>
	
	<tr>
		<td>생년월일</td>
		<td colspan="3">
		<input type = "text" name = "year" >년
		<input type = "text" name = "mon" style= "width:50px;">월
		<input type = "text" name = "day" style= "width:50px;">일
		<input type = "radio" name="yy" value="양력"checked id ="양력">
		<label for="양력">양력</label>
		<input type = "radio" name="yy" value="음력" id="음력">
		<label for="음력">음력</label>	
		</td>
	</tr>
	
	<tr>
		<td>주소</td>
		<td colspan="3"><input type = "text" name = "addr"  style="width:300px;" ></td>
	</tr>
	
	<tr>
		<td>전화번호</td>
		<td colspan="3"><input type = "text" name = "first" style= "width:100px;">-
		<input type = "text" name = "mid" style= "width:100px;">-
		<input type = "text" name = "last" style= "width:100px;">
		</td>
	</tr>
	
	<tr>
		<th colspan="4">사용 가능한 프로그램 선택하기</th>
	</tr>
	
	<tr>
		<td colspan="4">
		<ol type = A>
		<li><input type = "checkbox" name="pro" value="한글">한글</li> 
		<li><input type = "checkbox" name="pro" value="포토샵">포토샵</li>
		<li><input type = "checkbox" name="pro" value="매크로 미디어 디렉터">매크로 미디어 디렉터</li>
		<li><input type = "checkbox" name="pro" value="드림위버">드림위버</li>
		<li><input type = "checkbox" name="pro" value="3D MAX">3D MAX</li>
		</ol>
		</td>
	</tr>
	
	<tr>
		<th colspan="4">가고싶은 여행지를 모두 선택하세요.</th>
	</tr>
	
	<tr>
		<td colspan="4">
		<select name ="tra"> <!-- 선택창 생성-->
	    <option value ="설악산"selected>설악산</option> <!-- 선택값 입력-->
		<option value ="경포대"selected>경포대</option>
		<option value ="토발"selected>토발</option>
     	<option value ="해운대"selected>해운대</option>
		<option value ="광안리"selected>광안리</option>
		</select><br>
		</td>
	</tr>
	
	<tr>
		<th colspan="4">미래의 꿈은 어떠한가요</th>
	</tr>
	
	<tr>
		<td rowspan="1" colspan="4" style="vertical-align: top; width: 30%;">
		<textarea rows="8" cols="85" >미래의 꿈은 희망입니다.</textarea>
		</td>
	</tr>
	
	<tr>
		<td  colspan="4">
		<input type = "submit" value="보내기">
		<input type = "reset" value="다시쓰기">
		</td>
	</tr>
	
	</table>
</form>	
</body>
</html>