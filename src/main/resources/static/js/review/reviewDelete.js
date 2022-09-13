/**
 * 	reviewDelete.js
 */
 
 $(document).ready(function(){
 	$('#reviewDelete').on('click',function(){
 		 $.ajax({
            type: "POST",
            url: "/review/deleteReviewNote",
            data: {
                "reviewNoteId": $('#reviewNoteId').val()
            },
            success: function (data) {
                alert("삭제 완료!");
                window.history.go(-2);
            },
            error: function () {
                console.log('fail');
                alert("오류 발생!");
            }
        });
 	
 	});
 
 });