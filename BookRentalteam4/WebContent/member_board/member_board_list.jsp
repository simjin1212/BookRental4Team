<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--
int count=(Integer)request.getAttribute("listcount");
--%> 
<!-- 총 게시글 수 : <%--=count--%><br> -->
 현재 아이디 : ${sessionScope.id} <br>
 현재 등급 : ${sessionScope.grade } <br>
<table border="1" width="700" align="center">
	<caption>자유게시판</caption>
	<tr>
		<td colspan=3 align="left" border="0"> 총 게시글 수 : ${listcount} </td>
		<td colspan=2 align="right" border="0"><a href="">작성</a></td> 
		
		<td align="right" border="0"><a href="">삭제</a></td>
		<!-- 삭제는 관리자가 들어갈 때만 보이게 설정... checked 위에. -->
	</tr>
	<tr>   
		<th width="50">No.</th>
		<th width="400">Subject</th>
		<th width="100">Writer</th>
		<th width="100">Date</th>
		<th width="50">Count</th>
		
		<th width="50" >Checked</th> 
		<!-- 관리자가 들어갈 때만 컬럼이 보이게 설정 -->
	</tr>
<!-- 글이 존재할 때만 리스트 출력 -->
<c:if test="${listcount>0}">

<!-- 공지부분 출력 -->
<c:set var="num" value="1" />
	<c:forEach var="n" items="${nt_list}">
	<tr bgcolor="#D9E5FF"> 
		<td align="center"> ${num} 
			<c:set var="num" value="${num+1 }"/> </td>
		<td> 
			<a href="./member_board_view.do?num=${n.mb_Num }&page=${page}">${n.mb_Subject }</a>
 		</td>
		<td> ${n.id } </td>
		<td> <fmt:formatDate value="${n.mb_Regdate}" pattern="yy.MM.dd HH:mm"/> </td>
		<!-- 날짜 표기 시, date클래스 객체 생성해 현재시간 구해서 비교해보고
		날짜가 같으면 시간만 표시, 날짜가 다를 경우 작성 날짜가 뜨도록 변경 -->
		<td align="center"> ${n.mb_Readcount } </td>
		<td> check </td>
	</tr>
	</c:forEach>

<!-- 일반게시판 출력 -->
<!-- <c:set var="num" value="${listcount-(page-1)*10}" /> -->	
	<c:forEach var="b" items="${mb_list}">
	<tr> 
		<td align="center"> ${b.mb_Num} </td>
		<td> 
			<c:if test="${b.mb_LEV>0}">
				<c:forEach var="i" begin="0" end="${b.mb_LEV }">
					&nbsp;
				</c:forEach>
			</c:if>
			<a href="./member_board_view.do?num=${b.mb_Num }&page=${page}">${b.mb_Subject }</a>
 		</td>
		<td> ${b.id } </td>
		<td> <fmt:formatDate value="${b.mb_Regdate}" pattern="yy.MM.dd hh:mm"/> </td>
		<!-- 날짜 표기 시, date클래스 객체 생성해 현재시간 구해서 비교해보고
		날짜가 같으면 시간만 표시, 날짜가 다를 경우 작성 날짜가 뜨도록 변경 -->
		<td align="center"> ${b.mb_Readcount } </td>
		<td> check </td>
	</tr>
	</c:forEach>
	
</c:if> 
</table>
<br><br>

<!-- 페이지 목록 -->
<center>
<c:if test="${listcount>0}"> <!-- 글이 존재하는 경우에만 페이지 출력 -->
<!-- 1페이지로 -->
	<a href="./member_board_list.do?page=1" style="text-decoration:none"> << </a>
<!-- 이전 페이지 -->
	<c:if test="${page>1 }">
		<a href="./member_board_list.do?page=${page-1 }"> < </a>
	</c:if>

	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i==page }">  <!-- 현재 페이지 -->
			[${i}]
		</c:if>
		<c:if test="${i!=page }"> <!-- 현재 페이지가 아닌 경우 -->
			<a href="./member_board_list.do?page=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>
	
<!-- 다음 페이지 -->
	<c:if test="${page <pageCount}">
		<a href="./member_board_list.do?page=${page+1 }"> > </a></c:if>
<!-- 끝페이지로 -->
	<a href="./member_board_list.do?page=${pageCount}" style="text-decoration:none"> >> </a>
		
</c:if>
</center>