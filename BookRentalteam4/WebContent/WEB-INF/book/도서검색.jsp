<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
</head>

<body>
	<form action="" method="" align=center>
		<caption>도서 검색 목록</caption> <br>
			<select name="">
	    	<option value="">전체</option>
	    	<option value="">제목</option>
	    	<option value="">저자</option>
	    	<option value="">출판사</option>
	    	</select>
	    	<input type="hidden" name="page" value="1">
	    	<input type="text" name="text" placeholder="검색어">
	    	<input type="submit" value="검색">
	</form>
	
	<form method="post" action="">
		<table border=1 width=600 height=500 align="center">
			검색 결과
			
			<tr height=30 align="right">
				<td>
					<select name="">
	    			<option value="">정렬기준</option>
	    			<option value="">제목</option>
	    			<option value="">저자</option>
	    			<option value="">출판사</option>
	    			</select>
	    			
	    			<select name="">
	    			<option value="">정렬방법</option>
	    			<option value="">내림차순</option>
	    			<option value="">올림차순</option>
	    			</select>
	    			
	    			<select name="">
	    			<option value="">블럭수</option>
	    			<option value="">10</option>
	    			<option value="">20</option>
	    			<option value="">30</option>
	    			</select>
	    			
	    			<input type="submit" value="조회">
	    		</td>
	    	</tr>

			
			<tr>
				<td>1</td>
			</tr>
			
			<tr>
				<td>2</td>
			</tr>
			
			<tr>
				<td>3</td>
			</tr>
			
			<tr>
				<td>4</td>
			</tr>
			
		</table>
	</form>



</body>

</html>