$(document).ready(function () {
    $('#like').on('click', function () {

    });
});

function commentLikeClick(commentId) {
    $.ajax({
        type: "post",
        url: "/comment/commentLike",
        data: {
            "commentId": commentId
        },
        success: function (result) {
            if (result == "TRUE") {
                $('#' + 'commentLike' + commentId).css('color', 'red');
                var likeNum = $('#' + 'commentNum' + commentId).text();
                likeNum *= 1;
                $('#' + 'commentNum' + commentId).text(++likeNum);
            } else {
                $('#' + 'commentLike' + commentId).css('color', 'black');
                var likeNum = $('#' + 'commentNum' + commentId).text();
                likeNum *= 1;
                $('#' + 'commentNum' + commentId).text(--likeNum);
            }
        },
        error: function () {
            alert('오류!')
        },
    });
}