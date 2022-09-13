$(document).ready(function () {

    $('#back').on('click', function () {
        window.history.back();
    });

    $('#write_btn').on('click', function () {
        location.href = "/note/update/" + $('#noteId').val();
    });

});



