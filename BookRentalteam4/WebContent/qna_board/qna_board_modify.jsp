<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
	<title>qna</title>
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

<form action="<%=request.getContextPath()%>/qna_BoardModify.do" method="post">
<input type="hidden" name="qb_num" value="${dto.qb_num}">
<input type="hidden" name="page" value="${page}">
	  
	  
	  
<table cellpadding="0" cellspacing="0" style="border-:collapse:collapse;" align=center border="1">
    <col width="20%">
    <col width="80%">    
	<tr align="center" valign="middle">
		<td colspan="5">게시판수정</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">ID</div>
		</td>
		<td>
			${dto.id}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="board_subject" id="board_subject" type="text" size="50" maxlength="100" 
				value="${dto.qb_content}"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="board_content" id="board_content" cols="67" rows="15">${dto.qb_content}</textarea>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>

	<tr align="center" valign="middle">
		<td colspan="5">			
			<input type=submit value="수정">
		</td>
	</tr>
</table>
</form>

</body>
</html>