<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html>
<head>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<!-- --------------------------------------------------------------- -->

<title>리뷰게시판글작성</title>
</head>
<body style="padding-top: 120px; z-index: 1;">
	<%@ include file="../top.jsp"%>
	<form method="post" enctype="multipart/form-data"
		action="<%=request.getContextPath()%>/book_review_writeAction.do?num=${b_num}">
		<div class="container col-sm-8">

			<table border=0 width=450 align=center cellpadding=15px class="table"
				style="font-family: 'Nanum Gothic', sans-serif;">
				<div
					style="font-family: 'Black Han Sans', sans-serif; font-size: 40px; color: #6f42c1;">리뷰쓰기</div>
				<tr valign="top">
					<td>
						<div align="center" valign="center" style="font-size: 25px;">도서명</div>
					</td>
					<td><input name="book_name" id="book_name" type="text"
						size="50" maxlength="100" disabled="disabled" value="${book}"></td>

				</tr>
				<tr>
					<td>
						<div align="center" valign="center" style="font-size: 25px;">
						제	목</div>
					</td>
					<td><input name="rb_subject" id="rb_subject" type="text"
						size="50" maxlength="100" value="" /></td>
				</tr>
				<tr>
					<td>
						<div align="center" valign="center" style="font-size: 25px;">내
							용</div>
					</td>
					<td><textarea name="rb_content" id="rb_content" size = 100 cols="100"
							rows="15"></textarea></td>
				</tr>
				<tr>
					<td>
						<div align="center" valign="center" style="font-size: 25px;">파일첨부</div>
					</td>
					<td><input name="rb_file" id="rb_file" type="file" /></td>
				</tr>
				<tr bgcolor="cccccc">
					<td colspan="2" style="height: 1px;"></td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="5"><input type=submit value="작성"> <input
						type=button value="취소"
						onClick="location.href='./rentListAction.do?num=${b_num}'">
					</td>
				</tr>
			</table>
		</div>
	</form>

</body>
</html>