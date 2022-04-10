<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
	<title>qna 문의 글 쓰기</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	

<style>
table{ width:800px;}
input{ height:30px; }
td{ padding:6px; }
div{ font-size:16px; }
</style>

</head>
<body>

<form action="<%=request.getContextPath() %>/qna_BoardAddAction.do" method="post">
	  
<table cellpadding="0" cellspacing="0" style="border-:collapse:collapse;" align=center border="1">
    <col width="20%">
    <col width="80%">    
	<tr align="center" valign="middle">
		<td colspan="5">문의게시판작성</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">ID</div>
		</td>
		<td>
		${sessionScope.id}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="qb_subject" id="qb_subject" type="text" />
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="qb_content" id="qb_content" cols="67" rows="15"></textarea>
		</td>

	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>

	<tr align="center" valign="middle">
		<td colspan="5">			
			<input type=submit value="등록">
			<input type=reset value="취소" onClick="location.href='./qna_BoardListAction.do' ">
			
		</td>
	</tr>
</table>
</form>

</body>
</html>