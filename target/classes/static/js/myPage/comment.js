/**
 * comment.js
 */
 
 $(document).ready(function () {
});
function deleteComment(commentId) {

    if (confirm("해당 게시글을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/myPage/deleteMpComment",
            data: {
                 "commentId": commentId
            }, success: function (data) {
                if (data == "SUCCESS") {
                    alert("삭제 완료!");
                    location.href="/myPage/comment/" 
                   
                } else {
                    alert("삭제 실패!");
                }

            }, error: function (request,status,error) {
           		 console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                console.log('fail');
                alert("오류 발생!");
            }
        });
    }


}