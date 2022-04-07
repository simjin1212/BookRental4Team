<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>회원상세</title>
</head>

<body>
<center>
<form method="post" action="">
<table border=1 width=600 align=center>
	<caption>회원 상세</caption>
	<tr><td>ID</td>
		<td><input type=text Placeholder=11111111111 id="" name="">
		</td>
	</tr>
	<tr><td>이름</td>
		<td><input type=text Placeholder="싱징누" id="" name=""></td>
	</tr>
	<tr><td>핸드폰</td>
		<td><select id="phone1" name="phone1">
				<option value="">번호선택</option>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>-
			<input type=text size=4 id="phone2" name="phone2" maxlength=4>-
			<input type=text size=4 id="phone3" name="phone3" maxlength=4>
		</td>
	</tr>
	<tr><td>E-Mail</td>
		<td><input type=text size=10 id="mailid" name="mailid">@
		    <input type=text size=10 id="domain" name="domain">
		    <select id="email">
		    	<option value="">직접입력</option>
		    	<option value="naver.com">네이버</option>
		    	<option value="daum.net">다음</option>
		    	<option value="nate.com">네이트</option>
		    	<option value="gmail.com">gmail</option>
		    </select>		    
		 </td>
	</tr>
	<t><td>주소</td>
		<td><input type=text size=45 id="address" name="address"></td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">가입일
			<div align="center"></div>
		</td>
		<td>
			<input type=text Placeholder="2020-05-03" id="" name="">
			
		</td>
	</tr>	
	<tr><td>회원등급</td>
		<td><input type=text Placeholder="관리자or회원" id="" name="">
		</td>
	</tr>
	
	<tr><td colspan=2 align=center>
			<input type=submit value="수정">
			<input type=submit value="삭제">
		</td>
	</tr>		
</table>
</form>
</center>



<!-- 아래부터 테이블 탭 -->
<div class="wrap">
  <div class="tab_menu">
    <ul class="list">
      <li class="is_on">
        <a href="#tab1" class="btn">대출내역/건</a>
        <div id="tab1" class="cont">
        	
        	<table border=1 height="200" width="700" align=center>
        <caption align="right">
        	<tr bgcolor=lightgrey>
				<th>도서번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>대출일</th>
				<th>반납예정일</th>
			</tr>
			<tr>
				<th>1</th>
				<th>자바의 정석</th>
				<th>홍길동</th>
				<th>심진심진</th>
				<th>2022-04-04</th>
				<th>2022-04-24</th>
			</tr>
			<tr>
				<th>2</th>
				<th>자바의 정석</th>
				<th>홍길동</th>
				<th>심진심진</th>
				<th>2022-04-04</th>
				<th>2022-04-24</th>
			</tr>
			<tr>
				<th>3</th>
				<th>자바의 정석</th>
				<th>홍길동</th>
				<th>심진심진</th>
				<th>2022-04-04</th>
				<th>2022-04-24</th>
			</tr>
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