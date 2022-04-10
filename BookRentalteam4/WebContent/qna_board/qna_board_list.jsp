<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
select{height:35px; font-size:16px;}
input{height:35px; font-size:16px;}
th{height:35px; font-size:16px;}
td{height:30px; font-size:14px;}
.search_btn{height:33px;font-size:16px;}

</style>
<a href="./qna_BoardForm.do">문의 작성하기</a> <br>
<div>
   <div style="padding:10px; height:30px; border:0px solid red;" >
      <select name="key">
         <option value="0">제목</option>
         <option value="1">작성자</option>
      </select>
      
      <input type="text">
      
      <input type="button" value="검색하기" class="search_btn">
   
   </div>
	<table width=800 border="1" style="border-collapse:collapse;border-cellspacing:10px;">
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				
			</tr>	
		<c:forEach var="b" items="${boardlist}">			
			<tr>
				<td><a href="./qna_BoardDetailAction.do?qb_num=${b.qb_num}&page=${page}">
				${b.qb_subject}</a></td>
				<td>작성자${b.id}</td>
				<td>작성일${b.qb_regdate}</td>
				
			</tr>			
			</c:forEach>	
	</table>

<!-- 다음 블럭으로 이동  -->



<!-- 마지막 페이지로 이동 -->


</center>
