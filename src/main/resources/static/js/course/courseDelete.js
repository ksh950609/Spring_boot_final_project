$(document).ready(function () {
    $("#deleteBtn").on("click", function (){
        if(confirm("정말 게시물을 삭제하시겠습니까?")) {
            let courseId = $("#courseId").val();
            console.log(courseId);

            $.ajax({
                url: "/course/deleteCourse",
                type: "POST",
                data: {
                    "courseId": courseId,
                },
                success: function (result) {
                    alert("삭제 완료!");
                    window.history.go(-2);
                },
                error: function (request, status, error) {
                    alert("code=" + request.status + "message=" + request.responseText + "error=" + error); //실패시처리
                }
            });
        }
    })
    $("#deleteBtn_view").on("click", function (){
        if(confirm("정말 게시물을 삭제하시겠습니까?")) {
            let courseId = $("#courseId").val();
            console.log(courseId);

            $.ajax({
                url: "/course/deleteCourse",
                type: "POST",
                data: {
                    "courseId": courseId,
                },
                success: function (result) {
                    alert("삭제 완료!");
                    window.history.go(-1);
                },
                error: function (request, status, error) {
                    alert("code=" + request.status + "message=" + request.responseText + "error=" + error); //실패시처리
                }
            });
        }
    })
});
