/**
 * bookMark.js
 */
 
 $(document).ready(function () {
});

function deleteBookMark(bookmarkId) {

    if (confirm("해당 전시를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/deleteBookMark",
            data: {
                 "bookmarkId": bookmarkId
            }, success: function (data) {
                if (data == "SUCCESS") {
                    alert("삭제 완료!");
                    window.open('http://localhost:8080/myPage/scrap');
                   
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