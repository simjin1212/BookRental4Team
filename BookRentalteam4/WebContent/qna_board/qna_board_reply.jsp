<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
	<title>qna댓글작성</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/board/script.js"></script>

<style>
table{ width:800px;}
input{ height:30px; }
td{ padding:6px; }
div{ font-size:16px; }
</style>

</head>
<body>

ref:${board.qb_ref}
<form action="<%=request.getContextPath() %>/qna_board_reply.do" method="post">
<input type=hidden name="qb_num" value="${board.qb_num}">
<input type=hidden name="qb_ref" value="${board.qb_ref}">
<input type=hidden name="qb_lev" value="${board.qb_lev}">
<input type=hidden name="qb_seq" value="${board.qb_seq}">
<input type=hidden name="page" value="${page}">   
<table cellpadding="0" cellspacing="0" style="border-:collapse:collapse;" align=center border="1">

	<tr align="center" valign="middle">
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제목</div>
		</td>
		<td>
			<input name="qb_subject" id="qb_subject" type="text" size="10" maxlength="10" 
				value="${board.qb_subject}"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="qb_content" id="qb_content" cols="67" rows="15" style="text-indent: 10px;">

======================================
${board.qb_content}	</textarea>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>

	<tr align="center" valign="middle">
		<td colspan="5">			
			<input type=submit value="등록">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>

</body>
</html>