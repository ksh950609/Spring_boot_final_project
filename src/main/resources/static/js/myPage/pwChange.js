/**
 *  pwChange
 */
 
 $(document).ready(function(){
 	
 	
 	
 	// 버튼 클릭시
	$('#editBtn').on('click', function () {
       
       
       // 비밀번호
        var userPw = $('#userPw').val();
 	
       // 비밀번호 확인
       var userPwCfm = $('#userPwCfm').val();
       
       
       if(!userPw || !userPwCfm){
       	alert("비밀번호를 입력해주세요.");
       } else if(userPw!=userPwCfm){
       	alert("비밀번호가 일치하지 않습니다.");
       } else if(!validPwCheck(userPw)){
       		alert("비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
       }
       	else {
           $.ajax({
                type: "POST",
                url:"/myPage/updatePw/",
                data: {
                    "userPw": userPw,
                },
                success: function (data) {
                    alert("수정 완료!");
                    location.href="/myPage/home/"  // 세션 아이디 추가
                },
                error: function () {
                    console.log('fail');
                    alert("오류 발생!");
                } 
            });
         } // else
    });  // editBtn.click
	
	
	function validPwCheck(pw) {

    var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    if (false === reg.test(pw)) {
        console.log('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
        return false;
    } else {
        console.log("통과");
        return true;
    }

}
	
	
   	// 글자 수 제한
   	$('.pwInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	$('.pwCfmInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
   
 }); // document.ready