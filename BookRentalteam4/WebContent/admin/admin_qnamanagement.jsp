<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>문의 관리</title>
</head>


<boby style="padding-top:120px; z-index:1;"> 
	<%@ include file="../top.jsp"%>

<form method="post">
      <div class="container col-sm-8">
		<table border="0" width="600" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
      		<tr>
				<td colspan=8 style="border: 0;"><div
						style="font-family: 'Black Han Sans', sans-serif; font-size: 40px; color: #6f42c1;">문의관리</div></td>
			</tr>
			<tr>
				<td colspan=4 align="right" style="border-top:0;"><input type="submit" class="btn btn-outline-secondary btn-sm"  value="삭제"></td>
			</tr>
		<tr bgcolor=lightgrey>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>삭제</th>
		</tr>
		
		<tr>
		<th>1</th>
		<th><a href="">신규도서 신청</th>
		<th>홍길동</th>
		<th>2022-04-04</th>
		<th>1</th>
		<th><input type="checkbox" name="" value=""></th>
		</tr>
		
		<tr>
		<th>2</th>
		<th><a href="">이클립스 교재 신청</th>
		<th>안화수</th>
		<th>2022-05-01</th>
		<th>3</th>
		<th><input type="checkbox" name="" value=""></th>
		</tr>
		  
	<div class="container col-sm-8" style="font-family: 'Nanum Gothic', sans-serif;">
		<div style="float:right;"><input type="button" class="btn btn-outline-secondary btn-sm" value="   작성   " onClick=""></div>
    </div>    
</table>
</form>




</body>
</html>