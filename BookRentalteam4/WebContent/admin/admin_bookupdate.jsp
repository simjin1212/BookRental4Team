<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규도서 등록</title>
</head>
<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/admin/bookupdate.js"></script>

<body>
<form action="<%=request.getContextPath()%>/bookupdate.do"  method="post" enctype="multipart/form-data">
<table border=1 width=600 align=center>
	<caption>신규도서 등록</caption>			
	<!-- <tr><td>도서번호(ISBN)</td>		순차로 대체
		<td><input type=text id="book_num" name="book_num">
		</td>
	</tr> -->
	<tr><td>도서명</td>
		<td><input type=text id="book_name" name="book_name"></td>
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
		<td><input type=text id="publisher" name="publisher"></td>
	</tr>
	<tr><td>저자</td>
		<td><input type=text id="writer" name="writer">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">책표지</div>
		</td>
		<td>
			<input name="book_cover" type="file"/>
		</td>
	</tr>	
	<tr><td>등록일</td>
		<td> <p><input type="date" id="book_regdate" name="book_regdate"></p>
		</td>
	</tr>
	<tr><td>작가의말</td>
		<td>
			<textarea id="writer_talks" name="writer_talks" rows="5" cols="50"></textarea>
		</td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="등록">
			<input type=reset value="삭제">
		</td>
	</tr>		
</table>
</form>


</body>
</html>