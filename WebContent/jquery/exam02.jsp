<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#postBtn").click(function(){
		$.post("process.jsp",
				{"id": document.getElementById("id").value, 
				 "pwd":$("#pwd").val(),
				 "method":"post"},
				 function(data){//콜백함수
					 alert(data);
					 $("#postresult").html(data);
				}
				 ); 
	})//postBtn
	
	$("#getBtn").click(function(){
		$.get("process.jsp",{
			"id" :$("#id").val(),
			"pwd":$("#pwd").val(),
			"method":"get"
		},
		function (ret) {
			$("#getresult").html(ret);
		}
		)//get
	})//getBtn
		
	$("#loadBtn").click(function(){
			$("#loadresult").load("process.jsp",{
				"id" :$("#id").val(),
				"pwd":$("#pwd").val(),
				"method":"load"
			}
			);//load
		});//loadBtn
		
	$("#ajaxBtn").click(function(){
		$.ajax({
			type :"post",
			url 	:"process.jsp",
			data :{
				"id" :$("#id").val(),
				"pwd":$("#pwd").val(),
				"method":"ajax"
			},
			success : function(d) {
				$("#ajaxresult").html(d);
			},
			error : function(e) {
				
			}
		})//ajax
	})//ajaxBtn
})//document
</script>

</head>
<body>

id : <input type="text" id="id" name="id"><br>
pwd : <input type="password" id="pwd" name="pwd"><br>
<input type="button" id="postBtn" value="post전송">
<input type="button" id="getBtn" value="get전송">
<input type="button" id="loadBtn" value="load전송">
<input type="button" id="ajaxBtn" value="ajax전송">
<br>
<div id="getresult"></div>
<div id="postresult"></div>
<div id="loadresult"></div>
<div id="ajaxresult"></div>

</body>
</html>