<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
 <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
</head>

<body style="padding-top:120px; z-index:1;">
 <%@ include file="../top.jsp"%>


<c:if test="${sessionScope.member_grade==1}">
	<c:if test="${!empty sessionScope.id}">
	<ul class="admin_page">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<li class="admin" > <a style="text-decoration: none;" href="<%=request.getContextPath()%>/admin/admin_main.jsp">ADMIN</a></li>

	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">게시판 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/adminmemberlist.do">회원 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/booklistaction.do">도서 관리</a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/adminrentlist.do">대출 관리 </a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">문의 관리</a> </li>
	</ul>
	</c:if>
</c:if>
	<c:if test="${sessionScope.member_grade==0}">
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
	</c:if>
<!-- nav 끝 -->
		<h5>~관리자님 환영합니다~</h5>
		<br>
		<!-- 일반회원일 때만 문의 작성하기 보이게 만들기 -->

	<div style="margin-top:1%; margin-left: 20%; width:60%;">
		<table border="0" width="600" align="center" class="table table-striped" style="font-family: 'Nanum Gothic', sans-serif;">
			<thead>
			<tr>
				<td colspan=8 style="border: 0;"><div
						style="font-family: 'Black Han Sans', sans-serif; font-size: 40px; color: #6f42c1;">1:1게시판</div></td>
			</tr>
			<thead>
			<tr align="center" bgcolor=lightgrey>   
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			</tr>
			<c:forEach var="b" items="${boardlist}">
			<tr>
				<td><c:if test="${b.qb_lev>0}">
				&nbsp;ㄴ
			</c:if> <a href="./qna_BoardDetailAction.do?qb_num=${b.qb_num}&page=${page}">${b.qb_subject }</a>
				</td>
				<td>${b.id}</td>
				<td><fmt:formatDate value="${b.qb_regdate}"
									pattern="yy.MM.dd" /></td>
							<!-- 날짜 표기 시, date클래스 객체 생성해 현재시간 구해서 비교해보고
		날짜가 같으면 시간만 표시, 날짜가 다를 경우 작성 날짜가 뜨도록 변경 -->

						</tr>
					</c:forEach>
				</table>
		</div>

				<!-- 다음 블럭으로 이동  -->
				<!-- 페이지 목록 -->
				<center>
					<c:if test="${listcount>0}">
						<!-- 글이 존재하는 경우에만 페이지 출력 -->
						<!-- 1페이지로 -->
						<a href="./qna_BoardListAction.do?page=1"
							style="text-decoration: none"> << </a>
						<!-- 이전 페이지 -->
						<c:if test="${page>1 }">
							<a href="./qna_BoardListAction.do?page=${page-1 }"> < </a>
						</c:if>

						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${i==page }">
								<!-- 현재 페이지 -->
			[${i}]
		</c:if>
							<c:if test="${i!=page }">
								<!-- 현재 페이지가 아닌 경우 -->
								<a href="./qna_BoardListAction.do?page=${i}">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음 페이지 -->
						<c:if test="${page <pageCount}">
							<a href="./qna_BoardListAction.do?page=${page+1 }"> > </a>
						</c:if>
						<!-- 끝페이지로 -->
						<a href="./qna_BoardListAction.do?page=${pageCount}"
							style="text-decoration: none"> >> </a>

					</c:if>
				</center>
	</div>
	</table>
<c:if test="${sessionScope.member_grade==0 }">


<div class="container col-sm-8" style="font-family: 'Nanum Gothic', sans-serif;">
<div style="float:right;"><input type="button" class="btn btn-outline-secondary btn-sm" value=" 문의 작성   " onClick="location.href='./qna_BoardForm.do'"></div>
	</c:if>
<div class="container text-center d-flex align-items-center" style="font-family: 'Nanum Gothic', sans-serif; width:30%">
			<select name="sel" class="form-control form-control-sm text-center" id="sel1" style="width:20%">
				<option value="0">제목</option>
         		<option value="1">작성자</option>
			</select>
			<input type=text  name="find" id="find"  class="form-control form-control-sm" aria-label="Search" style="width:60%">
			<button type="submit"  class="btn btn-primary  btn-sm flex-shrink-0" id="searchBtn" style="width:20%">검색</button>
</div>
				<!-- 마지막 페이지로 이동 -->
</center>
</body>

</html>
