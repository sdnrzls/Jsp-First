<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.getElementById("name").value==""){
		alert("이름을 입력하세요"); //창이뜸
		return;
	}
	if(document.getElementById("num").value==""){
		alert("학번을 입력하세요"); //창이뜸
		return;
	}
	var obj = document.getElementsByName("hobby");
	var checkCnt=false;
	for(i=0;i<obj.length;i++){
		if(obj[i].checked){
			checkCnt=true;
		}
	}
	if(checkCnt==false){
		alert("취미를 선택해 주세요")
		return;
	}
	frm.submit();
}
</script>
</head>
<body>
<form action = "output.jsp" method="post" name="frm">
이름 : <input type = "text" name="name" id="name"><br><!-- 입력창 생성-->
학번 : <input type = "text" name="num" id="num"><br><br>
성별 : 
<input type = "radio" name="gen" value="man"checked id="man"> <!-- 동그라미 버튼 생성-->
<label for="man">남자</label><!-- 라벨(라벨클릭시 버튼과 동일) 생성-->
<input type = "radio" name="gen" value="woman" id="feman">
<label for="feman">여자</label>
<!-- <input type = "radio" name="gen" value="man"checked>남자 <input type = "radio" name="gen" value="woman">여자<br><br>-->
전공 : <select name ="major"> <!-- 선택창 생성-->
<option value ="국문학과"selected>국문학과</option> <!-- 선택값 입력-->
<option value ="영문학과"selected>영문학과</option>
<option value ="수학과"selected>수학과</option>
<option value ="정치학과"selected>정치학과</option>
<option value ="체육학과"selected>체육학과</option>
</select><br>
취미<br>
<input type = "checkbox" name="hobby" value="운동">운동 <!-- 체크박스 생성-->
<input type = "checkbox" name="hobby" value="운동1">운동1
<input type = "checkbox" name="hobby" value="운동2">운동2
<input type = "checkbox" name="hobby" value="운동3">운동3
<input type = "checkbox" name="hobby" value="운동4">운동4

<input type = "button" value="보내기" onclick="check()"> 
<input type = "reset" value="취소"> <!-- 리셋(취소) 생성--><!-- submit : form안의 값을 보냄 -->
</form>
</body>
</html>