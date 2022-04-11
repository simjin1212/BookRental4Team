<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>


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

</style>
<meta charset="UTF-8">
<center>
<title>회원상세</title>
</head>

<body>

<table border=1 width=600 align=center>
	<caption>회원 상세</caption>
	<tr><td>ID</td>
		<td>${member.id}</td>
	</tr>
	<tr><td>이름</td>
		<td>${member.name}</td>
	</tr>
	<tr><td>핸드폰</td>
		<td>${member.phone1}-
		${member.phone2}-
		${member.phone3}</td>	
	</tr>
	<tr><td>E-Mail</td>
		<td>${member.mailid}@ 
		    ${member.domain}</td>	    
	</tr>
	<tr><td>주소</td>
		<td>${member.address}</td>
	</tr>
	<tr>
		<td>가입일</td>
		<td>
		<fmt:formatDate value="${member.reg_Date}"
				            pattern="yyyy-MM-dd"/></td>
	</tr>	
	<tr><td>회원등급</td>
		<td>
		<c:if test="${member.member_Grade == 0}">
			일반회원		
			<input type="button" value="관리자로 변경" 
			onClick="location.href='./membergrademodify.do?id=${member.id}&member_grade=${member.member_Grade}' ">			
			</c:if>
		<c:if test="${member.member_Grade == 1}">
			관리자		
			<input type="button" value="일반회원으로 변경"
			onClick="location.href='./membergrademodify.do?id=${member.id}&member_grade=${member.member_Grade}' ">				
		</c:if>
		
		</td>
	</tr>
	<tr><td colspan=2 align=center>
				<input type=submit value="회원 강제 탈퇴"
				onClick="location.href='./memberdelete.do?id=${member.id}'">
			</td>
	</tr>		
	</table>
</center>

<!-- 아래부터 테이블 탭 -->
<div class="wrap">
  <div class="tab_menu">
    <ul class="list">
      <li class="is_on">
        <a href="#tab1" class="btn">대출내역/건</a>
        <div id="tab1" class="cont">
        	
        	<table border=1 height="200" width="700" align=center>
        <caption align="right"></caption>
        	<tr bgcolor=lightgrey>
				<th>도서번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>대출일</th>
				<th>반납예정일</th>
			</tr>
		<c:forEach var="rent" items="${rentlist }">
			<tr>
				<th>${rent.book_Num}</th>
				<th>${rent.temp_book_Name }</th>
				<th>${rent.temp_Writer }</th>
				<th>${rent.temp_Publisher }</th>
				<th>${rent.rent_Date }</th>
				<th>${rent.return_Date}</th>
			</tr>
		</c:forEach>
			
			</table>
			</div>
      </li>
      <li>
        <a href="#tab2" class="btn">예약내역/건</a>
        <div id="tab2" class="cont">
        <table border=1 height=200 width=700>
        
        	<tr bgcolor=lightgrey>
				<th>도서번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>예약신청일</th>
				<th>도서상태</th>
			</tr>
			<tr>
				<th>1</th>
				<th>자바의 정석</th>
				<th>홍길동</th>
				<th>심진심진</th>
				<th>2022-04-04</th>
				<th>대출중</th>
			</tr>
			<tr>
				<th>2</th>
				<th>자바의 정석</th>
				<th>홍길동</th>
				<th>심진심진</th>
				<th>2022-04-04</th>
				<th>대출가능</th>
			</tr>
			<tr>
				<th>3</th>
				<th>자바의 정석</th>
				<th>홍길동</th>
				<th>심진심진</th>
				<th>2022-04-04</th>
				<th>대출가능</th>
			</tr>
			</table>
			</div>
       
      </li>
      
    </ul>
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


	</body>
</html>