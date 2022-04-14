<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- --------------------------------------------------------------- -->

<title >도서 상세</title>
</head>
<body style="padding-top:120px; z-index:1;">
<%@ include file="../top.jsp" %>
<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<ul class="admin_page">
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/UpdateForm.do"> MENU</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/UpdateForm.do">내 정보</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/booksearchaction.do">도서검색</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/rentListAction.do">대출 목록</a> </li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/ReserveList.do">예약 목록</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">회원게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">1:1문의 게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/Logout.do">로그아웃</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/DeleteMember.do">회원탈퇴</a></li>
</ul>
</c:if>
	<form method="post" action="<%=request.getContextPath() %>/member/main.jsp" >
		<div style="margin-top:1%; margin-left: 20%; width:60%;">
		<div align = "right">ID : ${sessionScope.id}</div>
	 	<table border = 0 width=450 align=center cellpadding=15px class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	         <div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">도서상세페이지</div>
	         <tr valign="top">
	            <td width=150><img src = "./admin/bookfileupload.jsp?file_name=${book.book_Cover} " style="width:300px; height:300px;"/></td>
	            <td style="font-size:25px; color:#331B3F;">
	            		저자  :${book.writer}<br> <br> 
	            		출판사 :${book.publisher}<br> <br> 
	            		장르  :${book.genre} <br><br> 
	               		도서번호  :${book.book_Num}<br>
	            </td>
	         </tr>
	         
	         <tr height = 100>
	            <td colspan = 2 align = center valign = center>
	   			    <c:if test="${rentcheck == -1}">
				            <input type="button" value="대출 신청" 
				            onClick="location.href='./rent_add.do?book_num=${book.book_Num}&rent_num=${rent}&id=${id}'">
					</c:if>
					<c:if test="${rentcheck == 1}">
					 	<input type="button" disabled value="대출 불가"/>
					</c:if>
					
				    <c:if test="${rentcheck == 1}">
				            <input type="button" value="예약 신청" 
				            onClick="location.href='./reserve_add.do?book_num=${book.book_Num}&rent_num=${rent}&id=${id}'">
					</c:if>
					<c:if test="${rentcheck == -1}">
					 	<input type="button" disabled value="예약신청불가(대출가능)"/>
					</c:if>
	            </td>
	         </tr>
			
	  </table>
	</div>
	      
	<div style="margin-top:1%; margin-left: 20%; width:60%;">      
	      <table border = 0 width=450 align=center cellpadding=15px class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	        <div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">도서리뷰</div>
		     <tr align = center style = font-size:25px; >
	            <td border = 1 width = 350>제목</td>
	            <td>작성자</td>
	            <td>작성일</td>
	         </tr>
	         
	         <c:set var="num" value="${reviewlistcount - (page-1) * 10}" />
	         <c:forEach var="b" items="${reviewlist}">
	         
	         
	         <tr align = center>
	            <td>
	            <a href="./review_board_detailAction.do?board_num=${b.rb_Num}&page=${page}&num=${book.book_Num}">			
				${b.rb_Subject}	</a>
			</td>         
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
	 </div>    
			<!-- 페이지 처리 -->
			<center>
			<c:if test="${reviewlistcount > 0}">
			
			<!-- 1페이지로 이동 -->
			<a href="./ReviewListAction.do?page=1&num=${book.book_Num}" style="text-decoration:none"> << </a>
			
			<!-- 이전 블럭으로 이동 -->
			<c:if test="${startPage > 10}">
				<a href="./ReviewListAction.do?page=${startPage-10}&num=${book.book_Num}">[이전]</a>
			</c:if>
			
			<!-- 각 블럭에 10개의 페이지 출력 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == page}">	<!-- 현재 페이지 -->
					[${i}]
				</c:if>
				<c:if test="${i != page}">	<!-- 현재 페이지가 아닌 경우 -->
					<a href="./ReviewListAction.do?page=${i}&num=${book.book_Num}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<!-- 다음 블럭으로 이동  -->
			<c:if test="${endPage < pageCount}">
				<a href="./ReviewListAction.do?page=${startPage+10}&num=${book.book_Num}">[다음]</a>
			</c:if>
			
			<!-- 마지막 페이지로 이동 -->
			<a href="./ReviewListAction.do?page=${pageCount}&num=${book.book_Num}"
				style="text-decoration:none"> >> </a>
			
			</c:if>
	</center>
	
	   </form>
	
	
	
</body>
</html>