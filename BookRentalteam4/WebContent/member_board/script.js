$(document).ready(function(){
	//글작성 유효성
			$("form[name='writeform']").submit(function(){
				if($("#mb_subject").val()==""){
					alert("제목을 입력하세요");
					$("#mb_subject").focus();
					return false;
				}
				if($("#mb_content").val()==""){
					alert("내용을 입력하세요");
					$("#mb_content").focus();
					return false;
				}				
			});	
	//체크박스
			$("form[name='form1']").submit(function(){			
				if($("input:checkbox[name=chk]:checked").length < 1){
					alert("삭제할 글을 체크해주세요");
					return false;
				}
				if($("input:checkbox[name=chk]:checked").length >=1){
					var del=confirm("삭제하시겠습니까?");
					if(del) document.form.submit();
					else return false;
				}
			});	 
			
			$("#allchk").click(function(){
				if($("#allchk").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
	//검색
			$("form[name='form2']").submit(function(){
				if($("#find").val()==""){
					alert("검색어를 입력하세요");
					$("#find").focus();
					return false;
				} 	
			});
			
});	