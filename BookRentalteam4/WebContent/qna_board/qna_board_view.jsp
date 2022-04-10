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


<table cellpadding="0" cellspacing="0" style="border-:collapse:collapse;" align=center border="1">
    <col width="20%">
    <col width="80%">    
	<tr align="center" valign="middle">
		<td colspan="5">상세</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">회원 ID</div>
		</td>
		<td>
			${board.id}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			${board.qb_subject}
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<pre>${board.qb_content}</pre>
		</td>
	</tr>
	
	
	<tr align="center" valign="middle">
		<td colspan="5">		
		     <input type=button value="목록" onclick ="location.href='./qna_BoardListAction.do?page=${page}' ">			
			<input type=button value="수정" onclick="location.href='./qna_BoardModifyAction.do?qb_num=${board.qb_num}&page=${page}' ">
		</td>
	</tr>
</table>


</body>
</html>