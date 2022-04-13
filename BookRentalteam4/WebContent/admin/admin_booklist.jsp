<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<a href="./bookupdateform.do">도서 작성</a> <br>
도서 개수 : ${listcount} 개<br>

      <table border=1 width=700 align=center>
        <caption align="right">
        <input type="text" name="text" placeholder="검색어">
        <input type="submit" value="검색"></caption>
        
		<tr bgcolor=lightgrey>
		<th>도서번호</th>
		<th>도서명</th>
		<th>글쓴이</th>
		<th>출판사</th>
		<th>장르</th>
		
		</tr>
	<c:set var="num" value="${listcount - (page-1) * 10}" />
	<c:forEach var="b" items="${booklist}">
		<tr>
			<td>${b.book_Num}
			<c:set var="num" value="${num-1}" />
			</td>
			<td>
			<a href="./bookDetailAction.do?book_Num=${b.book_Num}&page=${page}">${b.book_Name}</a>
			</td>
			<td>${b.writer}</td>
			<td>${b.publisher}</td>
			<td>${b.genre}</td>
			
		</tr>
		
</c:forEach>
</table> <br><br>
		
		
		<!-- 페이지 처리 -->
<center>
<c:if test="${listcount > 0}">

<!-- 1페이지로 이동 -->
<a href="./booklistaction.do?page=1" style="text-decoration:none"> << </a>

<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="./booklistaction.do?page=${startPage-10}">[이전]</a>
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">	<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">	<!-- 현재 페이지가 아닌 경우 -->
		<a href="./booklistaction.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동  -->
<c:if test="${endPage < pageCount}">
	<a href="./booklistaction.do?page=${startPage+10}">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="./booklistaction.do?page=${pageCount}"
	style="text-decoration:none"> >> </a>

</c:if>
</center>






</body>
</html>