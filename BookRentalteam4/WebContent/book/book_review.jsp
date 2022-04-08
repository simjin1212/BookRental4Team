<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
	<title>리뷰게시판글작성</title>
<!--<script src="http://code.jquery.com/jquery-latest.js"></script>-->
<!--<script src="<%=request.getContextPath() %>/board/script.js"></script>-->
</head>
<body>

<form action="" method="post" 
	  enctype="multipart/form-data">
<table cellpadding="0" cellspacing="0" align=center border=1>
	<tr align="center" valign="middle">
		<td colspan="5">리뷰 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16"  >
			<div align="center">도서명</div>
		</td>
		<td>
			<input name="board_name" id="board_name" type="text" size="10" maxlength="10" 
				value=""/ disabled = "disabled">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="board_subject" id="board_subject" type="text" size="50" maxlength="100" 
				value=""/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="board_content" id="board_content" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			<input name="board_file" type="file"/>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5">			
			<input type=reset value="취소">
			<input type=submit value="저장">
		</td>
	</tr>
</table>
</form>

</body>
</html>