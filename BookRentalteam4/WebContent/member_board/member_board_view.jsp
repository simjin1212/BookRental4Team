<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html> 
<%
	String path=request.getRealPath("mb_upload");
	request.setAttribute("path",path);
%>
<c:set var="writer" value="${board.id }"></c:set>
<body>
	<table border=1 width=500 align=center>
		<caption>자유게시판</caption>
		<tr>
			<th width=50>No.</th>
			<td width=200>${board.mb_Num }</td>
			<th width=50>View</th>
			<td width=200>${board.mb_Readcount }</td>
		</tr>
		<tr>
			<th width=50>Writer</th>
			<td width=200>${writer }</td>
			<th width=50>Date</th>
			<td width=200>${board.mb_Regdate }</td> <!-- 상세페이지 시간은 날짜 시간 다 출력되게 처리 -->
		</tr>
		<tr>
			<td colspan=4>${board.mb_Subject }</td>
		</tr>
		<tr>
			<td colspan=4>${content }</td>
		</tr>

			<tr>
			<td>파일</td>
			<td colspan=3>
			<c:if test="${board.mb_File!=null}">
				<img src="${path}/${board.mb_File }" width=400 height=400><br>
				<a href="./file_down.jsp?file_name=${board.mb_File}">${board.mb_File}</a>
			</c:if>
			</td>		
			</tr> 
		<tr>

<!-- 관리자: 답글/삭제/목록		게시자: 답글/수정/삭제/목록 		일반: 답글/목록 -->
			<td colspan=4 align=center>
			<c:if test="${board.mb_Grade==0 }">
				<input type=button value="답글" onClick="location.href='./member_board_replyform.do?num=${board.mb_Num }&page=${page}'">
			</c:if>
			<c:if test="${sessionScope.id eq writer }">
				<input type=button value="수정" onClick="location.href='./member_board_modifyform.do?num=${board.mb_Num }&page=${page}'">
			</c:if>
			<c:if test="${sessionScope.id eq writer  || sessionScope.member_grade==1}">
				<input type=button value="삭제" onClick="location.href='./member_board_deleteform.do?num=${board.mb_Num }&page=${page}'">
			</c:if>
				<input type=button value="목록" onClick="location.href='./member_board_list.do?page=${page}'"> 
			</td> 
		</tr>
	</table>
</body>
</html>