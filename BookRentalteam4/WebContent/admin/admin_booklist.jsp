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
		






</body>
</html>