/**
 *  check2.js
 */
 
 
  $(document).ready(function(){
 	
 	$("#submitBtn").on('click', function(){
		
		// 기본 기능 중단
		event.preventDefault();
		
		var userPw = $('#userPw').val();
		
		if(!userPw){
			alert("비밀번호를 입력해주세요.");
		} else {
		
 		$.ajax({
 			type:"post",
 			url:"/myPage/userPwCheck",
 			data: {
                    "userPw": userPw,
                },
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					alert("비밀번호 수정으로 이동합니다.");
					location.href="/myPage/pwChange/" 
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				} 				
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); // ajax 
 		} // if 
 	}); 
	
 	
 }); // document.ready