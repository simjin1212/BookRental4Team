<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border=1 width="400" align="center">
		<caption>상세 페이지</caption>
		<tr>
			<td>제목</td>
			<td>${board.rb_Subject}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${board.rb_Content}</pre> ${content}</td>
		</tr>
		<tr>
			<td>첨부 파일</td>
			<td>
				<!-- 첨부파일이 있을때만 첨부파일 출력 --> <c:if test="${board.rb_File != null}">
					<a href="./board/file_down.jsp?file_name=${board.rb_File}">
						${board.rb_File} </a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="button" value="목록"
				onClick="location.href='./ReviewListAction.do?page=${page}&num=${book_num}' ">

			</td>
		</tr>
	</table>

</body>
</html>