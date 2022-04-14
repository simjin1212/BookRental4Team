<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>회원가입 화면 샘플 - Bootstrap</title> 
<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
<style> body { min-height: 100vh; background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); } 
.input-form { max-width: 680px; 
margin-top: 80px; 
padding: 32px; 
background: #fff; 
-webkit-border-radius: 10px; 
-moz-border-radius: 10px; 
border-radius: 10px; 
-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) } 
</style> 

<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="./member/member.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('post').value = data.zonecode;
				document.getElementById('address').value = data.address;

			}
		}).open();
	}
</script>
</head> 
<body> 
<form method="post" action="/BookRentalteam4/memberjoin.do">
<div class="container"> 
<div class="input-form-backgroud row"> 
<div class="input-form col-md-12 mx-auto"> 
<h4 class="mb-3">회원가입</h4> 
<form class="validation-form" novalidate> 

<div class="col-md-6 mb-3"> 
<label for="id">ID</label> 
<input type="text" class="form-control" id="id" name="id" placeholder="" value="" required> 
<input type=button value="ID중복검사" id="idcheck">
<div id="myid"></div>
<div class="invalid-feedback"> ID를 입력해주세요. </div> 
</div> <br />
<div class="col-md-6 mb-3"> 
<label for="pw">비밀번호</label> 
<input type="password" class="form-control" id="passwd" name="passwd" placeholder="" value="" required> 
<div class="invalid-feedback"> 비밀번호를 입력해주세요. </div> 
</div>
<div class="col-md-6 mb-3"> 
<label for="name">이름</label> 
<input type="text" class="form-control" id="name" name="name" placeholder="" value="" required> 
<div class="invalid-feedback"> 이름을 입력해주세요. </div> 
</div> 

<div class="row"> 
<div class="col-md-4 mb-3"> 
<label for="jumin">주민번호 앞자리</label>
<input type="text" class="form-control" size=6 maxlength=6 id="jumin" name="jumin" placeholder="" value="" required></div>
<div class="col-md-6 mb-3">
<label for="jumin2">주민번호 뒷자리</label><input type=text class="form-control" size=7 maxlength=7 id="jumin2" name="jumin2">
<div class="invalid-feedback"> 주민번호를 입력해주세요. </div> 
</div>
</div>

<div class="row"> 
<div class="col-md-4 mb-3"> 
<label for="email">E-Mail</label> 
<input type="text" class="form-control" size=10 id="mailid" name="mailid" placeholder="you@example.com" required></div>
<div class="col-md-4 mb-3">　
<label for="email">　</label><input type=text class="form-control" size=10 id="domain" name="domain"></div>
<div class="col-md-4 mb-3">　
<select id="email" class="form-control">　
<option value="">직접입력</option>
<option value="naver.com">네이버</option>
<option value="daum.net">다음</option>
<option value="nate.com">네이트</option>
<option value="gmail.com">gmail</option>
</select>
</div>
<div class="invalid-feedback"> 이메일을 입력해주세요. </div> 
</div> 

<div class="row"> 
<div class="col-md-2 mb-3">
<label for="phone">핸드폰</label>
<select id="phone1" name="phone1" class="form-control">
						<option value="">번호선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="018">018</option>
						<option value="019">019</option>
</select></div>
<div class="col-md-2 mb-3"> 
<label for="phone2">　</label><input type=text class="form-control" size=4 id="phone2" name="phone2" maxlength=4></div>
<div class="col-md-2 mb-3"> 
<label for="phone3">　</label><input type=text class="form-control" size=4 id="phone3" name="phone3" maxlength=4></div>
<div class="invalid-feedback"> 핸드폰 번호를 입력해주세요. </div> 
</div> 

<div class="col-md-6 mb-3"> 
<label for="post">우편번호</label> 
<input type="text" class="form-control"size=5 id="post" name="post" placeholder="" value="" required> 
<input type=button value="우편번호검색" onClick="openDaumPostcode()">
<div class="invalid-feedback"> 우편번호를 입력해주세요. </div> 
</div> 
<div class="mb-3"> 
<label for="address">주소</label> 
<input type="text" class="form-control" size=45 id="address" name="address" placeholder="서울특별시 강남구" required> 
<div class="invalid-feedback"> 주소를 입력해주세요. </div> 
</div> 
<div class="mb-3"> 
<label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label> 
<input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요."></div> 
<div class="row"> 
</div> 
<button class="btn btn-primary btn-lg btn-block" type="submit" value="회원가입">회원가입</button> 
<button class="btn btn-primary btn-lg btn-block" type="reset" value="취소">취소</button> 
</form> 
</div> 
</div>
</div> 
<script> window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); 
Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { 
	if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); }
	form.classList.add('was-validated'); }, false); }); }, false); 
	</script> 
</body> 
</html>

