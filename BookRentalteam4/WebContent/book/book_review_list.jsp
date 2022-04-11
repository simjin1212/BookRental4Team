<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세</title>
</head>
<body>
 현재 아이디 : ${sessionScope.id} <br>
 
<form method="post" action="<%=request.getContextPath() %>/member/main.jsp">

 <table border = 1 width=600 height=300 align=center cellpadding=15px>
         <caption align=center>
            <h2>도서 상세 페이지</h2>
         </caption>
         <tr valign="top">
            <td width=150></td>
            <td left=5px>저자  ; ${book.writer}<br> <br> 출판사 ; ${book.publisher}<br> <br> 장르  ;${book.genre}<br>
               <br> 도서번호  ; ${book.book_num}<br>
            </td>
         </tr>
         <tr>
            <td colspan = 2 align = center>
            <input align=center type="submit" value="대출 신청">
            <input type="submit" value="예약 신청">
            </td>
         </tr>
      </table>
      
      
      <table table border="1" width="600" align=center cellpadding = 10px>
         <caption align=center>
            <h2>리뷰</h2>
         </caption>   
<!--       <tr>
            <td colspan = 3 align = left><h2></h2></td>
         </tr>
 -->      <tr align = center>
            <td border = 1 width = 350>제목</td>
            <td>작성자</td>
            <td>작성일</td>
         </tr>
         
         <c:set var="num" value="${reviewlistcount - (page-1) * 10}" />
         <c:forEach var="b" items="${reviewlist}">
         
         <tr height = 10></tr>
         <tr align = center>
            <td>${b.rb_Subject}</td>         
            <td>${b.id}</td>         
            <td><fmt:formatDate value="${b.rb_Regdate}"
				            pattern="yyyy-MM-dd HH:mm:ss EEE요일"/></td>         
         </tr>
         </c:forEach>
         
         <tr height = 10></tr>
         <tr valign="top">
            <td colspan = 3 align = right>
            <input type="submit" align="right" value="홈으로">
            </td>
         </tr>
         
      </table>
      
<!-- 페이지 처리 -->
<center>
<c:if test="${reviewlistcount > 0}">

<!-- 1페이지로 이동 -->
<a href="./ReviewListAction.do?page=1" style="text-decoration:none"> << </a>

<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="./ReviewListAction.do?page=${startPage-10}">[이전]</a>
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">	<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">	<!-- 현재 페이지가 아닌 경우 -->
		<a href="./ReviewListAction.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동  -->
<c:if test="${endPage < pageCount}">
	<a href="./ReviewListAction.do?page=${startPage+10}">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="./ReviewListAction.do?page=${pageCount}"
	style="text-decoration:none"> >> </a>

</c:if>
</center>
   </form>



</body>
</html>