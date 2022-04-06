$(document).ready(function(){	
	 document.getElementById('book_regdate').value = new Date().toISOString().substring(0, 10);;
	// 유효성 검사
	$("form").submit(function(){	
//		if($("#book_num").val() == ""){
//			alert("책번호를 입력하세요");
//			$("#book_num").focus();
//			return false;
//		}		
		if($("#phone1").val()==""){
			alert("장르를 선택하세요");			
			return false;
		}		
		if($("#book_name").val()==""){
			alert("도서명을 입력하세요");
			$("#book_name").focus();
			return false;
		}
		if($("#publisher").val()==""){
			alert("출판사를 입력하세요");
			$("#publisher").focus();
			return false;
		}
		if($("#writer").val()==""){
			alert("저자를 입력하세요");
			$("#writer").focus();
			return false;
		}
		if($("#dookupdateday").val()==""){
			alert("등록일을 입력하세요");
			$("#dookupdateday").focus();
			return false;
		}
		if($("#wirter_talks").val()==""){
			alert("작가의 말을 입력하세요");
			$("#wirter_talks").focus();
			return false;
		}
	}); // submit() end	
});  // ready() end