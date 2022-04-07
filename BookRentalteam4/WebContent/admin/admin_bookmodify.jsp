<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정</title>
</head>
<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- <script src="<%=request.getContextPath() %>/admin/bookupdate.js"></script> --%>

<body>
<form action="<%=request.getContextPath()%>/bookModify.do"  method="post">
<input type="hidden" name="book_Num" value="${book.book_Num}">

<table border=1 width=600 align=center>
	<caption>도서정보 수정</caption>			
	<!-- <tr><td>도서번호(ISBN)</td>		순차로 대체
		<td><input type=text id="book_num" name="book_num">
		</td>
	</tr> -->
	<tr><td>도서명</td>
		<td><input type=text id="book_name" name="book_name" value="${book.book_Name}"></td>
	</tr>
	<tr><td>장르</td>
		<td><select id="genre" name="genre">
				<option value="">장르선택</option>
				<option value="sosul">소설</option>
				<option value="goyang">교양</option>
				<option value="comic">만화</option>
				<option value="chamgo">참고서</option>
			</select></td>
	</tr>
	
	
	<tr><td>출판사</td>
		<td><input type=text id="publisher" name="publisher" value="${book.publisher}"></td>
	</tr>
	<tr><td>저자</td>
		<td><input type=text id="writer" name="writer" value="${book.writer}">
		</td>
	</tr>
	

	<tr><td>작가의말</td>
		<td>
			<textarea id="writer_talks" name="writer_talks" rows="5" cols="50">${book.writer_talks}</textarea>
		</td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="수정">
			<input type=submit value="삭제"
			onClick="location.href='./bookDelete.do?book_Num=${book.book_Num}' ">
		</td>
	</tr>		
</table>
</form>


</body>
</html>