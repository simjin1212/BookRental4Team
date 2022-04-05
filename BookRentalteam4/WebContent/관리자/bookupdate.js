$(document).ready(function(){	
	

	// 유효성 검사
	$("form").submit(function(){
		
		if($("#book_num").val() == ""){
			alert("책이름를 입력하세요");
			$("#book_num").focus();
			return false;
		}		
		if($("#ganre").val()==""){
			alert("장르를 입력하세요");
			$("#ganre").focus();
			return false;
		}		
		if($("#book_name").val()==""){
			alert("도서명을 입력하세요");
			$("#name").focus();
			return false;
		}
		if($("#publisher").val()==""){
			alert("출판사를 입력하세요");
			$("#publisher").focus();
			return false;
		}
		if($("#writer").val().length != 6){
			alert("저자를 입력하세요");
			$("#writer").val("").focus();
			return false;
		}
		if(isNaN($("#dookupdateday").val())){
			alert("등록일을 입력하세요");
			$("#dookupdateday").val("").focus();
			return false;
		}
		if($("#wirter_talks").val()==""){
			alert("작가의 말을 입력하세요");
			$("#wirter_talks").focus();
			return false;
		}
		
		
	}); // submit() end		
	
});  // ready() end