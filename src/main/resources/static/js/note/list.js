$(document).ready(function () {

    var movedIndex = 0;

    setInterval(() => moveSlide(movedIndex++), 4000);

    function moveSlide(movedIndex) {
        //console.log(movedIndex);
        movedIndex = movedIndex % 5;
        //슬라이드 이동
        var moveLeft = -(movedIndex * 1000); // 왼쪽으로 이동 거리
        $('#slidePanel').animate({'left': moveLeft}, 'slow');
    }


    $('.search_bar').on('focus', function () {
        $('.search_box').css('border', 'solid 3px rgba(0, 0, 0, 0.3)')
    });

    $('.search_bar').on('blur', function () {
        $('.search_box').css('border', 'solid 2px rgba(0, 0, 0, 0.3)')
    });

    $('#like').on('click', function () {
        if ($('#like').hasClass('like-active')) {
            $('#like').css('color', 'Black');
            $('#like').removeClass('like-active');
        } else {
            $('#like').css('color', 'Red');
            $('#like').addClass('like-active');
        }
    });

    $('#write_btn').on('click', function () {
        location.href = "/note/write";
    })


});

//슬라이드 패널을 움직이는 함수
