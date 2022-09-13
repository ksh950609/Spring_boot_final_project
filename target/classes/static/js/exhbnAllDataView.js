$(document).ready(function () {
    $.ajax({
        type: "post",
        url: "/selectAllDate",
        success: function (result) {
            console.log(result);
        },
        error: function () {
            alert("전송 실패");
        },
    });
});