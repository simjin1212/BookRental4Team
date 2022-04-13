<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">


<!-- 게시판 유효성 검사 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/member_board/script.js"></script>

  <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
  
 </head>
 


   
<body style="padding-top:120px; z-index:1;">
   <%@ include file="../top.jsp" %>
    <!-- 세션이 있는 경우 -->
<c:if test="${sessionScope.member_grade==1}">
  <ul class="admin_page">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/admin/admin_main.jsp"> ADMIN</a></li>
 
	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">게시판 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/adminmemberlist.do">회원 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/booklistaction.do">도서 관리</a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/adminrentlist.do">대출 관리 </a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">문의 관리</a> </li>
</ul>
</c:if>

 <!-- 다중삭제기능  -->
 <form action="<%=request.getContextPath() %>/member_board_multidel.do" method="post" name="form1" id="form1">
     
 <input type=hidden id="page" name="page" value="${page }"> <!-- multidel로 넘어갈 page 정보 -->
 
 <div style="margin-top:1%; margin-left: 20%; width:60%;">
<table border="0" width="600" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
<tr><td colspan=8 style="border:0;">
<div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">자유게시판</div></td></tr>
	<tr>
	<td colspan=4 align="left" style="border-top:0;"> <c:if test="${not empty find}">[${find }] 검색 결과  총 ${listcount} 개</c:if></td>
		<c:if test="${sessionScope.member_grade==1 }">
		<td colspan=4 align="right" style="border-top:0;"><input type="submit" class="btn btn-primary  btn-sm flex-shrink-0"  value="삭제"></td>
		</c:if>
		<!-- 삭제는 관리자가 들어갈 때만 보이게 설정... checked 위에. -->
	</tr>
	</table>
</div>

 <div style="margin-top:1%; margin-left: 20%; width:60%;">
<table border="0" width="600" align="center" class="table table-hover" style="font-family: 'Nanum Gothic', sans-serif;"> 
 <thead>
	<tr align="center" >   
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
	</thead>
	<tbody>
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
	<tr bgcolor="#D9E5FF" style="font-weight:bolder"> 
		<td align="center"> ${num} 
			<c:set var="num" value="${num+1 }"/> </td>
		<td> 
			<a href="./member_board_view.do?num=${n.mb_Num }&page=${page}" style="text-decoration:none">${n.mb_Subject }</a>
 		</td>
		<td align="center"> ${n.id } </td>
		<td align="center"> <fmt:formatDate value="${n.mb_Regdate}" pattern="yy.MM.dd HH:mm"/> </td>
		<!-- 날짜 표기 시, date클래스 객체 생성해 현재시간 구해서 비교해보고
		날짜가 같으면 시간만 표시, 날짜가 다를 경우 작성 날짜가 뜨도록 변경 -->
		<td align="center"> ${n.mb_Readcount } </td>
	</tr>
	</c:forEach>

<!-- 일반게시판 출력 -->
<!-- <c:set var="num" value="${listcount-(page-1)*10}" /> -->	
	<c:forEach var="b" items="${mb_list}">
	<tr> 
		<td align="center" > ${b.mb_Num} </td>
		<td > 
			<c:if test="${b.mb_LEV>0}">
				<c:forEach var="i" begin="0" end="${b.mb_LEV }">
					&nbsp;
				</c:forEach>
			</c:if>
			<a href="./member_board_view.do?num=${b.mb_Num }&page=${page}" style="text-decoration:none">${b.mb_Subject }</a>
 		</td>
		<td align="center"> ${b.id } </td>
		<td align="center"> <fmt:formatDate value="${b.mb_Regdate}" pattern="yy.MM.dd hh:mm"/> </td>
		<!-- 날짜 표기 시, date클래스 객체 생성해 현재시간 구해서 비교해보고
		날짜가 같으면 시간만 표시, 날짜가 다를 경우 작성 날짜가 뜨도록 변경 -->
		<td align="center"> ${b.mb_Readcount } </td>
	<c:if test="${sessionScope.member_grade==1 }">
		<td align=center> <input type="checkbox" name="chk" value="${b.mb_Num }"> </td>   
	</c:if>
	</tr>
	</c:forEach>
	
</c:if>
</tbody> 
</table>
 </div>
 </form>
 <div style="margin-top:1%; margin-left: 20%; width:60%; font-family: 'Nanum Gothic', sans-serif;">

		<div style="float:left;"><input type="button" class="btn btn-primary  btn-sm flex-shrink-0" value="   목록   " onClick="location.href='./member_board_list.do'"></div>
	<c:if test="${not empty sessionScope.id }">
		<div style="float:right;"><input type="button" class="btn btn-primary  btn-sm flex-shrink-0"  value="   작성   " onClick="location.href='./member_board_writeform.do'"></div>
	</c:if>

</div>

 <div class="container text-center" style="margin-left:12%; font-family: 'Nanum Gothic', sans-serif;">
<!-- 페이지 목록 -->
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
</div>

<br>
<form name="form2" id="form2" action="<%=request.getContextPath() %>/member_board_list.do" method="post" >
<div class="container text-center d-flex align-items-center" style="font-family: 'Nanum Gothic', sans-serif; width:30%">
			<select name="sel" class="form-control form-control-sm text-center" id="sel1" style="width:40%">
				<option value="all">제목+내용</option>
				<option value="id">작성자</option>
				<option value="mb_subject">제목</option>
				<option value="mb_content">내용</option>
			</select>
			<input type=text  name="find" id="find"  class="form-control form-control-sm" aria-label="Search" >
			<button type="submit"  class="btn btn-primary  btn-sm flex-shrink-0" id="searchBtn" style="width:20%">검색</button>
</div>
</form>

<br><br><br><br><br>

</body>

</html>