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
			<td width=200>${board.id }</td>
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
		<!-- 
		if 첫번째
			content의 id랑 현재 접속중인 id(session 영역에 공유되는 값)가 일치할 경우
			content.id.equals(session.id)
			답글/수정/삭제 버튼 보이게 처리
		 else if 두번째
			아이디가 일치하지 않는데 접속중인 회원 등급이 관리자인 경우
			session.member_Grade.equals('manager')
			답글/수정/삭제 버튼 보이게 처리
		 else
			아이디도 다르고 관리자도 아님 (=타회원)
			답글 버튼만 보이게 처리
			
			show() hide() 사용
		 -->
			<td colspan=4 align=center>
				<input type=button id="" value="답글" onClick="location.href='./member_board_replyform.do?num=${board.mb_Num }&page=${page}'">
				<input type=button value="수정" onClick="location.href='./member_board_modifyform.do?num=${board.mb_Num }&page=${page}'">
				<input type=button value="삭제" onClick="location.href='./member_board_deleteform.do?num=${board.mb_Num }&page=${page}'">
				<input type=button value="목록" onClick="location.href='./member_board_list.do?page=${page}'"> 
			</td> 
		</tr>
	</table>
</body>
</html>