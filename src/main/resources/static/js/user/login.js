$(document).ready(function () {
    $('#btn').on('click', function () {
        login();
    });

    $('#pw').on('keyup', function (key) {
        if (key.keyCode == 13) {
            login();
        }
    });

});

function login() {
    if ($('#id').val() == "") {
        $('#id').next('label').addClass('warning');
        $('#id').focus();
        setTimeout(function () {
            $('label').removeClass('warning');
        }, 1500);
    } else if ($('#pw').val() == "") {
        $('#pw').next('label').addClass('warning');
        $('#pw').focus();
        setTimeout(function () {
            $('label').removeClass('warning');
        }, 1500);
    } else {
        $.ajax({
            type: "POST",
            url: "/user/selectUser",
            data: {
                "id": $('#id').val(),
                "pwTemp": $('#pwTemp').val(),
                "pw": $('#pw').val()
            },
            success: function (data) {
                if (data == "SUCCESS") {
                    location.href = "/";
                } else if (data == "TEMP") {
                    alert("임시 비밀번호로 입력하셨습니다!\n비밀번호 변경창으로 이동합니다");
                    location.href = "/user/pwTemp?id="+$('#id').val();
                } else if (data == "AWAY") {
                   alert("회원 탈퇴한 아이디입니다.")
                } else {
                    alert("아이디 또는 비밀번호가 틀렸습니다");
                }
            },
            error: function () {
                console.log('fail');
            }
        });
    }
}
