$(document).ready(function(){

			$("form[name='login']").submit(function(){
				if($.trim($("#id").val())==""){
					alert("ID를 입력하세요");
					$("#id").focus();
					return false;
				}
				
				if($.trim($("#passwd").val())==""){
					alert("비밀번호를 입력하세요");
					$("#passwd").focus();
					return false;
				}		
			});	

			$("form[name='search']").submit(function(){			
				if($.trim($("#find").val())==""){
					alert("검색어를 입력하세요");
					$("#find").focus();
					return false;
				}
			});	 
//신착 도서 1
			$.ajax({
				type:"post",
				url:"/BookRentalteam4/newbook.do",
				data:{"num":1},
				success:function(data){
					
							
				}
			});		
});	