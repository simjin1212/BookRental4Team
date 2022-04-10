<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>qna</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/board/script.js"></script>

<style>
table{ width:800px;}
input{ height:30px; }
td{ padding:6px; }
div{ font-size:16px; }
</style>

</head>
<body>
현재 아이디 : ${sessionScope.id} <br>
현재 등급 : ${sessionScope.member_grade }	<br>

<table cellpadding="0" cellspacing="0" style="border-:collapse:collapse;" align=center border="1">
    <col width="20%">
    <col width="80%">    
	<tr align="center" valign="middle">
		<td colspan="5">상세</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">회원 ID</div>
		</td>
		<td>
			${board.id}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			${board.qb_subject}
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<pre>${board.qb_content}</pre>
		</td>
	</tr>
	
	
	<tr align="center" valign="middle">
		<td colspan="5">		
		     <input type=button value="목록" onclick ="location.href='./qna_BoardListAction.do?page=${page}' ">	
		     <c:if test="${sessionScope.id == board.id}">
		<input type=button value="수정" onclick="location.href='./qna_BoardModifyAction.do?qb_num=${board.qb_num}&page=${page}' "> <br> <!-- 일반회원일 때만 문의 작성하기 보이게 만들기 -->		
			</c:if>	
			<c:if test="${sessionScope.member_grade==1}">
				<input type=button value="답글" onClick="location.href='./qna_board_replyform.do?qb_num=${qb_num}&page=${page}'">
			</c:if>	
		</td>
	</tr>
</table>


</body>
</html>