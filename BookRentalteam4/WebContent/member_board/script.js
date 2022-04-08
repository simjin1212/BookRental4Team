$(document).ready(function(){
			$("form").submit(function(){
				if($("#board_subject").val()==""){
					alert("제목을 입력하세요");
					$("#board_subject").focus();
					return false;
				}
				if($("#board_content").val()==""){
					alert("내용을 입력하세요");
					$("#board_content").focus();
					return false;
				}				
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
			
});	