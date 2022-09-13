/**
 * withdraw.js
 */
 
 $(document).ready(function(){
 
 // 탈퇴
	$('#quitUser').on('click', function() {
		// 기본 기능 중단
		event.preventDefault();
		
		var chkConfirm = confirm("정말로 탈퇴하시겠습니까?");
		var userPw = $('#userPw').val();
		
		if(chkConfirm) {
			 $.ajax({
	 			type:"post",
	 			url:"/myPage/quitUser",
	 			data:{ 
	 				"userPw": userPw
	 			},
				dataType:"text",
				success:function(result){
					// 성공 시 결과 받음
					if(result == "SUCCESS"){
						alert("탈퇴되었습니다.");
						location.href="/";
					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				},
				error:function(){
					// 오류있을 경우 수행 되는 함수
					alert("전송 실패");
				}
	 		}); 
		} else {
			return false;
		}
	});
	
}); // document.ready
	