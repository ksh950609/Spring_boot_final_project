/**
 * reviewUpdate.js
 */
 
 $(document).ready(function () {
    $('#summernote').summernote({
        tabsize: 2,
        width: 800,
        height: 400,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });

    $('#back').on('click', function () {
        window.history.back();
    });

    $('#reviewUpdate').on('click', function () {
        if ($('#reviewNoteTitle').val().length > 3) {
            $.ajax({
                type: "POST",
                url: "/review/updateReviewNote",
                data: {
                    "reviewNoteTitle": $('#reviewNoteTitle').val(),
                    "reviewNoteId": $('#reviewNoteId').val(),
                    "userId": $('#userId').val(),
                    "reviewNote": $('#summernote').summernote('code')
                },
                success: function (data) {
                    alert("수정 완료!");
                    window.history.back();
                },
                error: function () {
                    console.log('fail');
                    alert("오류 발생!");
                }
            });
        } else {
            alert("게시글 제목을 입력해 주세요!");
        }
    });

});