$(document).ready(function () {

    $('#commentPost').on('click', function () {
        $.ajax({
            type: "POST",
            url: "/comment/createComment",
            data: {
                "noteId": $('#noteId').val(),
                "comment": $('#comment').val()
            },
            success: function (data) {
                if (data == "SUCCESS") {
                    alert("작성 완료!");
                    $("#comment").val("");
                    $("#comment-box").load(window.location.href + " #comment-box > *"); //띄어쓰기 주의!!!

                    var commentNum = $('#commentNumMain').text();
                    commentNum *= 1;
                    $("#commentNumMain").text(++commentNum);
                } else {
                    alert("로그인을 해주세요!");
                }

            },
            error: function () {
                console.log('fail');
                alert("오류 발생!");
            }
        });
    });

});



