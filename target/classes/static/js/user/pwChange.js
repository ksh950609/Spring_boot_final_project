$(document).ready(function () {

    $('.fa-eye').show();
    $('.fa-eye-slash').hide();

    $('#btn').on('click', function () {
        login();
    });

    $('#pw').on('keyup', function (key) {
        if (key.keyCode == 13) {
            login();
        }
    });

    $('#pwTemp_eye').on('click', function () {
        $('#pwTemp_eye').hide();
        $('#pwTemp_eye_slash').show();
        $('#pwTemp').prop('type', 'text');
    });

    $('#pwTemp_eye_slash').on('click', function () {
        $('#pwTemp_eye').show();
        $('#pwTemp_eye_slash').hide();
        $('#pwTemp').prop('type', 'password');
    });

    $('#pw_eye').on('click', function () {
        $('#pw_eye').hide();
        $('#pw_eye_slash').show();
        $('#pw').prop('type', 'text');
    });

    $('#pw_eye_slash').on('click', function () {
        $('#pw_eye').show();
        $('#pw_eye_slash').hide();
        $('#pw').prop('type', 'password');
    });

});

function login() {
    if ($('#pwTemp').val() == "") {
        $('#pwTemp').next('label').addClass('warning');
        $('#pwTemp').focus();
        setTimeout(function () {
            $('label').removeClass('warning');
        }, 1500);
    } else if ($('#pw').val() == $('#pwTemp').val()) {
        $('#pw').next('label').addClass('warning');
        $('#pw').focus();
        setTimeout(function () {
            $('label').removeClass('warning');
        }, 1500);
        alert("임시비밀번호와 다르게 설정해야 합니다!");
    } else if ($('#pw').val() == "" || !validPwCheck($('#pw').val())) {
        $('#pw').next('label').addClass('warning');
        $('#pw').focus();
        setTimeout(function () {
            $('label').removeClass('warning');
        }, 1500);
    } else {
        $.ajax({
            type: "POST",
            url: "/user/pwTempChange",
            data: {
                "id": $('#id').val(),
                "pwTemp": $('#pwTemp').val(),
                "pw": $('#pw').val()
            },
            success: function (data) {
                if (data == "SUCCESS") {
                    alert("비밀번호 변경 성공!\n로그인 창으로 이동합니다")
                    location.href = "/login";
                } else {
                    alert("임시 비밀번호를 잘못 입력하였습니다");
                }
            },
            error: function () {
                console.log('fail');
            }
        });
    }
}

function validPwCheck(pw) {

    var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    if (false === reg.test(pw)) {
        console.log('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
        return false;
    } else {
        console.log("통과");
        return true;
    }

}