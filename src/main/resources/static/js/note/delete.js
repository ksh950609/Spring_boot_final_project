$(document).ready(function () {
    $('#delete').on('click', function () {
        $.ajax({
            type: "POST",
            url: "/note/deleteNote",
            data: {
                "noteId": $('#noteId').val()
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