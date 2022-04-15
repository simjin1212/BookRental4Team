<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">



<c:set var="writer" value="${board.id }"></c:set>
</head> 
<body style="padding-top:120px; z-index:1;">
   <%@ include file="../top.jsp" %>
   
<div style="margin-top:1%; margin-left: 20%; width:60%;">   

<table cellpadding="0" cellspacing="0" align=center border=0 class="table" style="font-family: 'Nanum Gothic', sans-serif;"> 
<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">자유게시판</div></td></tr>
		<tr style="height:47.5px">
			<td colspan=8 ><div style="float:left; font-size:20px; font-weight:bolder; color:#2c1b4d;"> ${board.mb_Subject }</div>
			<div style="float:right;">view  ${board.mb_Readcount }</div>
			</td>
		</tr>
		<tr>
			<td colspan=8 ><div style="float:left; font-size:16px;">${writer }</div>
			<div style="float:right;">${board.mb_Regdate }</div></td> <!-- 상세페이지 시간은 날짜 시간 다 출력되게 처리 -->
		</tr>
		<tr>
			<td colspan=8 border=0 style="font-size:18px; vertical-align :middle; height:100px;">${content }</td>
		</tr>
			<tr>
			<td>파일</td>
			<td colspan=3>
			<c:if test="${board.mb_File!=null}">
				<img src="./member_board/upload.jsp?file_name=${board.mb_File}" width=500 height=400>
			</c:if>
			</td>		
			</tr> 
		<tr>

<!-- 관리자: 답글/삭제/목록		게시자: 답글/수정/삭제/목록 		일반: 답글/목록 -->
			<td colspan=4 align=center>
			<c:if test="${board.mb_Grade==0 }">
				<input type=button value="답글" class="btn btn-primary  btn-sm flex-shrink-0" onClick="location.href='./member_board_replyform.do?num=${board.mb_Num }&page=${page}'">
			</c:if>
			<c:if test="${sessionScope.id eq writer }">
				<input type=button value="수정" class="btn btn-primary  btn-sm flex-shrink-0" onClick="location.href='./member_board_modifyform.do?num=${board.mb_Num }&page=${page}'">
			</c:if>
			<c:if test="${sessionScope.id eq writer  || sessionScope.member_grade==1}">
				<input type=button value="삭제" class="btn btn-primary  btn-sm flex-shrink-0" onClick="location.href='./member_board_deleteform.do?num=${board.mb_Num }&page=${page}'">
			</c:if>
				<input type=button value="목록" class="btn btn-primary  btn-sm flex-shrink-0" onClick="location.href='./member_board_list.do?page=${page}'"> 
			</td> 
		</tr>
		<!-- 답변 리스트 -->
		
		
	</table>
	</div>
</body>
</html>