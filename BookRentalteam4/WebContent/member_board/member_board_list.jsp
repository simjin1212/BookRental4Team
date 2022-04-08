<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/member_board/script.js"></script>


<!-- 총 게시글 수 : <%--=count--%><br> -->
 현재 아이디 : ${sessionScope.id} <br>
 현재 등급 : ${sessionScope.member_grade } <br>
 
 <!-- 다중삭제기능  -->
 <form action="<%=request.getContextPath() %>/member_board_multidel.do" method="post" name="form1" id="form1">
     
 <input type=hidden id="page" name="page" value="${page }"> <!-- multidel로 넘어갈 page 정보 -->

<table border="1" width="700" align="center">
	<caption>자유게시판</caption>
	<tr>
		<td colspan=3 align="left" border="0"> <c:if test="${not empty find}">[${find }] 검색 결과</c:if>  총 ${listcount} </td>
		<c:if test="${not empty sessionScope.id }">
		<td colspan=2 align="right" border="0"><input type="button" value="작성" onClick="location.href='./member_board_writeform.do'"></td> 
		</c:if>
		<c:if test="${sessionScope.member_grade==1 }">
		<td align="right" border="0" ><input type="submit" value="삭제"></td>
		</c:if>
		<!-- 삭제는 관리자가 들어갈 때만 보이게 설정... checked 위에. -->
	</tr>
	<tr>   
		<th width="60">No.</th>
		<th width="400">Subject</th>
		<th width="80">Writer</th>
		<th width="120">Date</th>
		<th width="40">Count</th>
<c:if test="${sessionScope.member_grade==1 }">
		<th width="50" ><input type="checkbox" id="allchk" name="allchk" ></th> <!-- 전체 체크 -->
</c:if>
		<!-- 관리자가 들어갈 때만 컬럼이 보이게 설정 -->
	</tr>
<!-- 글이 없다면 -->
<c:if test="${listcount==0 }">
	<tr> 
		<td align="center" colspan=6 > <h5>글이 없습니다</h5> </td>
	</tr>
</c:if>	
	
<!-- 글이 존재할 때만 리스트 출력 -->
<c:if test="${listcount>0}">

<!-- 공지부분 출력 -->
<c:set var="num" value="1" />
	<c:forEach var="n" items="${nt_list}">
	<tr bgcolor="#D9E5FF"> 
		<td align="center"> ${num} 
			<c:set var="num" value="${num+1 }"/> </td>
		<td> 
			<a href="./member_board_view.do?num=${n.mb_Num }&page=${page}" style="text-decoration:none">${n.mb_Subject }</a>
 		</td>
		<td> ${n.id } </td>
		<td> <fmt:formatDate value="${n.mb_Regdate}" pattern="yy.MM.dd HH:mm"/> </td>
		<!-- 날짜 표기 시, date클래스 객체 생성해 현재시간 구해서 비교해보고
		날짜가 같으면 시간만 표시, 날짜가 다를 경우 작성 날짜가 뜨도록 변경 -->
		<td align="center"> ${n.mb_Readcount } </td>
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
	<c:if test="${sessionScope.member_grade==1 }">
		<th> <input type="checkbox" name="chk" value="${b.mb_Num }"> </th>
	</c:if>
	</tr>
	</c:forEach>
	
</c:if> 
</table>
 </form>
 
<form name="form2" id="form2" action="<%=request.getContextPath() %>/member_board_list.do" method="post" >
<table border="0" width="700" align="center">
<tr>
	<td colspan=4>
			<select name="sel">
				<option value="all">제목+내용</option>
				<option value="id">작성자</option>
				<option value="mb_subject">제목</option>
				<option value="mb_content">내용</option>
			</select>
			<input type=text name="find" id="find">
			<input type="submit"  value="검색">
	</td>
	<td>
	<a href="./member_board_list.do">목록으로</a>
	</td>
</tr>
</table>
</form>

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




</html>