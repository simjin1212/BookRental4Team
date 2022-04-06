<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<a href="./bookupdate.do">도서 작성</a> <br>
도서 개수 : ${listcount} 개<br>

      <table border=1 width=700 align=center>
        <caption align="right">
        <input type="text" name="text" placeholder="검색어">
        <input type="submit" value="검색"></caption>
        
		<tr bgcolor=lightgrey>
		<th>분류기호</th>
		<th>도서명</th>
		<th>회원명</th>
		<th>대출일</th>
		<th>반납예정일</th>
		<th>문자발송</th>
		</tr>
		
		<c:set var="num" value="${listcount - (page-1) * 10}" />
	<c:forEach var="b" items="${admin_booklist}">
	<tr>
		<td>${num}
			<c:set var="num" value="${num-1}" />
		</td>
		<td>
			<!-- 댓글 제목 앞에 여백 처리 -->
			<c:if test="${b.book_re_lev > 0}">
				<c:forEach var="i" begin="0" end="${b.book_re_lev}">
					&nbsp;
				</c:forEach>
			</c:if>
			
<a href="./admin_bookmanagement.do&page=${page}">			
			${b.board_subject}
		</a>	
			
		</td>
		<td>${b.board_name}</td>
		<td>
			<fmt:formatDate value="${b.board_date}"
				            pattern="yyyy-MM-dd HH:mm:ss EEE요일"/>
		</td>
		<td>${b.board_readcount}</td>
	</tr>
	</c:forEach>

</table> <br><br>
		
</table>
</form>




</body>
</html>