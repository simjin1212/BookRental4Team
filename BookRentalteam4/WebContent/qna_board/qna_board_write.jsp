<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>qna 문의 글 쓰기</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
	

</head>
<body style="padding-top:120px; z-index:1;">
   <%@ include file="../top.jsp" %>

<form action="<%=request.getContextPath() %>/qna_BoardAddAction.do" method="post">
<div class="container col-sm-6">
	  
<table cellpadding="0" cellspacing="0" align=center border=0 class="table" style="font-family: 'Nanum Gothic', sans-serif;"> 
<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">작성</div></td></tr>
<tr>  
		<th>제목</th>
		<td>
			<input name="mb_subject" id="mb_subject" type="text" maxlength="100" 
				style="height:30px; width:100%; border: 0; text-indent: 10px;" value="" />
		</td>
	</tr>
	<tr> 
 
		<td colspan="2">
			<textarea name="mb_content" id="mb_content" cols="75" rows="15"
			style="text-indent: 10px;"></textarea>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2" style="border: 0;">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5" style="border-top: 0;">			
			<input type=submit value="등록">
			<input type=reset value="취소" onClick="location.href='./qna_BoardListAction.do' ">
			    
		</td>
	</tr>
</table>
</div>
</form>

</body>
</html>