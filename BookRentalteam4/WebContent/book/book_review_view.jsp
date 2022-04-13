<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<%
	String path=request.getRealPath("rb_upload");
	request.setAttribute("path",path);
%>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- --------------------------------------------------------------- -->

<title>리뷰상세</title>
</head>
<body style="padding-top:120px; z-index:1;">
<%@ include file="../top.jsp" %>
	<form method="post" action="<%=request.getContextPath() %>/member/main.jsp" >
		<div class="container col-sm-8">
	 	<table border = 0 width=450 align=center cellpadding=15px class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	        <div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">리뷰상세페이지</div>
	
			<tr valign = "top">
				<td width = 150 align = center style="font-size:25px;">제목</td>
				<td width = 250 align = center>${board.rb_Subject}</td>
			</tr>
			<tr>
				<td height = 400 valign = center align = center style="font-size:25px;">내용</td>
				<td align = center cellpadding = 15px> ${content}</td>
			</tr>
			<tr>
				<td align = center style="font-size:25px;">첨부 파일</td>
				<td>
					<!-- 첨부파일이 있을때만 첨부파일 출력 --> 
					<c:if test="${board.rb_File!=null}">
						<img src="${path}/${board.rb_File }" width=400 height=400><br>
						<a href="./file_down.jsp?file_name=${board.rb_File}">
							${board.rb_File} </a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan=2 align=center><input type="button" value="목록"
					onClick="location.href='./ReviewListAction.do?page=${page}&num=${book_num}' ">
	
				</td>
			</tr>
	</table>
	</div>
</form>

</body>
</html>