$(document).ready(function (){
    $("#postCommentBtn").on("click", function(){
        let words = $("#story").val().length;
        if (words>1 && words<500 ) {
            $.ajax({
                type: "POST",
                url: "/course/insertComment",
                data: {
                    "courseId": $("#courseId").val(),
                    "comment": $('#story').val()
                },
                success: function (data) {
                    $("#story").val("");
                    $('#comment').load(document.URL +  ' #comment > *');
                    // adsfasdfa$(".post-comment-box > span").text();
                },
                error: function () {
                    alert("오류 발생!");
                }
            })
        }
        if (words == 0) {
            alert("댓글 내용을 입력하세요.");
        }
        if (words >500) {
            alert("댓글은 500자를 넘길 수 없습니다.");
        }
    });
});