<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">

 <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
</head>

<body style="padding-top:120px; z-index:1; padding-bottom:120px;">
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

 <div style="margin-top:1%; margin-left: 20%; width:60%;">
<table border="0" width="600" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
<tr><td colspan=8 style="border:0;">
<div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">회원정보</div></td></tr></table></div>
 <div style="margin-left: 30%; width:40%;">
<table border="0" width="600" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	<tr><th>ID</th>
		<td>${member.id}</td>
	</tr>
	<tr><th>이름</th>
		<td>${member.name}</td>
	</tr>
	<tr><th>핸드폰</th>
		<td>${member.phone1}-
		${member.phone2}-
		${member.phone3}</td>	
	</tr>
	<tr><th>E-Mail</th>
		<td>${member.mailid}@ 
		    ${member.domain}</td>	    
	</tr>
	<tr><th>주소</th>
		<td>${member.address}</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td>
		<fmt:formatDate value="${member.reg_Date}"
				            pattern="yyyy-MM-dd"/></td>
	</tr>	
	<tr><th style="vertical-align :middle;">회원등급</th>
		<td >
		<c:if test="${member.member_Grade == 0}">
			일반회원&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="관리자로 변경" class="btn btn-outline-success btn-sm"
			onClick="location.href='./membergrademodify.do?id=${member.id}&member_grade=${member.member_Grade}' ">			
			</c:if>
		<c:if test="${member.member_Grade == 1}">
			관리자	&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="일반회원으로 변경" class="btn btn-outline-success btn-sm"
			onClick="location.href='./membergrademodify.do?id=${member.id}&member_grade=${member.member_Grade}' ">				
		</c:if>
		
		</td>
	</tr>
	<tr><td colspan=2 align=center>
				<input type=submit value="회원 강제 탈퇴" class="btn btn-primary  btn-sm flex-shrink-0" 
				onClick="location.href='./memberdelete.do?id=${member.id}'">
			</td>
	</tr>		
	</table>
</div>

 <div style="margin-top:1%; margin-left: 20%; width:60%;" style="font-family: 'Nanum Gothic', sans-serif;">
    <ul class="nav nav-tabs" role="tablist">
      <li class="nav-item">
        <a  class="nav-link active" data-toggle="tab" href="#tab1" >대출내역/건</a>
      </li>
       <li class="nav-item">
         <a class="nav-link" data-toggle="tab"  href="#tab2">예약내역/건</a>
      </li>
    </ul>
    <div class="tab-content">
    	<div id="tab1"  class="container tab-pane active"><br>
        	<table border="0" width="100%" align="center" class="table-bordered">
        	<tr bgcolor=lightgrey align=center>
				<th width="5%">No.</th>
				<th width="25%">도서명</th>
				<th width="15%">저자</th>
				<th width="15%">출판사</th>
				<th width="20%">대출일</th>
				<th width="20%">반납예정일</th>
			</tr>
		<c:forEach var="rent" items="${rentlist}">
			<tr>
				<td>${rent.book_Num}</td>
				<td>${rent.temp_book_Name }</td>
				<td>${rent.temp_Writer }</td>
				<td>${rent.temp_Publisher }</td>
				<td>${rent.rent_Date }</td>
				<td>${rent.return_Date}</td>
			</tr>
		</c:forEach>
			</table>
		</div>
    	<div id="tab2" class="container tab-pane fade"><br>
       	<table border="0" width="100%" align="center" class="table-bordered">
        	<tr bgcolor=lightgrey align=center>
				<th width="5%">No.</th>
				<th width="20%">도서명</th>
				<th width="10%">저자</th>
				<th width="10%">출판사</th>
				<th width="20%">예약신청일</th>
				<th width="20%">반납예정일</th>
				<th width="15%">강제예약취소</th>
			</tr> 
        	<c:forEach var="rv" items="${reservelist}">
			<tr>
				<th>${rv.book_Num}</th>
				<th><a href="./ReviewListAction.do?num=${rv.book_Num}">
					${rv.book_Name }
				</a></th>
				<th>${rv.writer}</th>
				<th>${rv.publisher} </th>
				<th>${rv.reserve_Date}</th>
				<th>${rv.return_date}</th>
				<th align=center><input type=button value="강제 예약 취소" class="btn btn-outline-danger"
				onClick="location.href='<%=request.getContextPath()%>/reservedelete.do?book_num=${rv.book_Num}'"></th>
			</tr>
			</c:forEach>
			</table>
			</div>
    </div>
  </div>



<%-- 

<!-- <style>
*{margin:0; padding:0;}
ul{list-style:none;}
a{text-decoration:overline; color:#333;}
.wrap{width:700px; margin:0 auto; border:1px solid #00;}
.tab_menu{position:relative;}
.tab_menu .list{overflow:hidden;}
.tab_menu .list li{float:left; margin:0 auto;}
.tab_menu .list .btn{font-size:13px;}
.tab_menu .list .cont{display:none; position:absolute; top:25px; left:0;  text-align:center;}
.tab_menu .list li.is_on .btn{font-weight:bold; color:green;}
.tab_menu .list li.is_on .cont{display:block;}
</style> -->

 <div style="margin-top:1%; margin-left: 20%; width:60%;">
<!-- 아래부터 테이블 탭 -->
<div class="wrap">
  <div class="tab_menu">
    <ul class="list">
      <li class="is_on">
        <a href="#tab1" class="btn">대출내역/건</a>
        <div id="tab1" class="cont">
        	
        	<table border=1>
        <caption align="right"></caption>
        	<tr bgcolor=lightgrey>
				<td>도서번호</td>
				<td>도서명</td>
				<td>저자</td>
				<td>출판사</td>
				<td>대출일</td>
				<td>반납예정일</td>
			</tr>
		<c:forEach var="rent" items="${rentlist}">
			<tr>
				<td>${rent.book_Num}</td>
				<td>${rent.temp_book_Name }</td>
				<td>${rent.temp_Writer }</td>
				<td>${rent.temp_Publisher }</td>
				<td>${rent.rent_Date }</td>
				<td>${rent.return_Date}</td>
			</tr>
		</c:forEach>
			
			</table>
			</div>
      </li>
      <li>
        <a href="#tab2" class="btn">예약내역/건</a>
        <div id="tab2" class="cont">
        <table border=1>
        	<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>예약신청일</th>
				<th>현 대출자 반납일</th>
				<th>강제예약취소</th>
			</tr> 
        	<c:forEach var="rv" items="${reservelist}">
			<tr>
				<th>${rv.book_Num}</th>
				<th><a href="./ReviewListAction.do?num=${rv.book_Num}">
					${rv.book_Name }
				</a></th>
				<th>${rv.writer}</th>
				<th>${rv.publisher} </th>
				<th>${rv.reserve_Date}</th>
				<th>${rv.return_date}</th>
				<th align=center><input type=button value="강제 예약 취소"
				onClick="location.href='<%=request.getContextPath()%>/reservedelete.do?book_num=${rv.book_Num}'"></th>
			</tr>
			</c:forEach>
			</table>
			</div>
       
      </li>
      
    </ul>
  </div>
</div>
</div>
		<script>
		const tabList = document.querySelectorAll('.tab_menu .list li');
		for(var i = 0; i < tabList.length; i++){
		  tabList[i].querySelector('.btn').addEventListener('click', function(e){
		    e.preventDefault();
		    for(var j = 0; j < tabList.length; j++){
		      tabList[j].classList.remove('is_on');
		    }
		    this.parentNode.classList.add('is_on');
		  });
		}
		</script>

 --%>
	</body>
</html>