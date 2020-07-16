<%@page import="com.address.ZipCodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a:hover {
	text-decoration: none; color:#000;
}
a:link {
	text-decoration: none; color:#000;
}
a:visited{
	text-decoration: none; color:#000;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");

   AddressDAO dao = AddressDAO.getInstance();
  ArrayList<ZipCodeBean> zarr = dao.zipcodeRead(dong);
%>
<script>
function dongCheck(){
	if($("#dong").val()==""){
		alert("동이름을 입력하세요");
		$("#dong").focus();
		return false;
	}
	$("#frm").submit();
}

function send(code, sido, gugun, dong, bunji){
	var address = sido +" " + gugun +" "+dong+" "+ bunji;
	opener.document.frm.zipcode.value=code;
	opener.document.frm.addr.value= address;
	self.close();
}
</script>
</head>
<body>
<form action="zipCheck.jsp" id="frm">
<table>
	<tr>
		<td>동이름입력 :<input type="text" name="dong" id="dong">
		<input type="button" value="검색" onclick="dongCheck()">
		</td>
	</tr>
<%
	if(zarr.isEmpty()){
%>		
		<tr>
			<td>검색된 결과가 없습니다.</td>
		</tr>
<%		
	}else{
%>		
		<tr>
		<td>* 검색 후 , 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
		</tr>
<%		
		for(ZipCodeBean z : zarr){
			String zip          = z.getZipcode();
			String sido        = z.getSido();
			String bunji      = z.getBunji();
			String gugun    = z.getGugun();
			String d              = z.getDong();
%>			
			<tr>
				<td><a href="javascript:send('<%=zip%>','<%=sido%>','<%=gugun%>','<%=d%>','<%=bunji%>')">
				  <%=zip%> <%=sido %> <%=gugun %>  
				 <%=d %> <%=bunji %></a></td>
			</tr>
<%			
		} //for
	}  //else
%>
	
	
	
	</table>
</form>	
</body>
</html>


