<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

글갯수 : ${listcount} 개
<center>
<title>회원목록</title>
      <table border=1 width=700 align=center>
        <caption>회원 목록</caption>
		<tr bgcolor=lightgrey>
		<th>번호</th>
		<th>ID</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>대출내역/건</th>
		<th>예약내역/건</th>
		
		
		</tr>
		
		<c:set var="num" value="${listcount - (page-1) * 10}" />
	<c:forEach var="m" items="${memberlist}">
	<tr>
		<td>${num}
			<c:set var="num" value="${num-1}" />
		</td>
		<td>
		<a href="./admin_memberdetail.do?id=${m.id}&page=${page}">
		${m.id}</a>
		</td>
		<td>
			<%-- <!-- 댓글 제목 앞에 여백 처리 -->
			<c:if test="${b.board_re_lev > 0}">
				<c:forEach var="i" begin="0" end="${b.board_re_lev}">
					&nbsp;
				</c:forEach>
			</c:if> --%>		
			${m.name}		
		</td>
		<td>
		${m.phone1} - ${m.phone2} - ${m.phone3}
		</td>
		<td>${m.mailid} @ ${m.domain}</td>
		
		<td>3</td>
		<td>2</td>
		
	</tr>
	</c:forEach>

</table> <br><br>

<!-- 페이지 처리 -->
<center>
<c:if test="${listcount > 0}">

<!-- 1페이지로 이동 -->
<a href="./BoardListAction.do?page=1" style="text-decoration:none"> << </a>

<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="./BoardListAction.do?page=${startPage-10}">[이전]</a>
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">	<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">	<!-- 현재 페이지가 아닌 경우 -->
		<a href="./BoardListAction.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동  -->
<c:if test="${endPage < pageCount}">
	<a href="./BoardListAction.do?page=${startPage+10}">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="./BoardListAction.do?page=${pageCount}"
	style="text-decoration:none"> >> </a>

</c:if>
</center>