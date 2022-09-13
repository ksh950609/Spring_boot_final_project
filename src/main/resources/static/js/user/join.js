let state = 0;
let id_check = false;
let email_check = false;
let emailNum_check = false;
let nickname_check = false;

$(document).ready(function () {
    stateController(state);
    $('#btn_next').val("NEXT");

    $('.fa-eye').show();
    $('.fa-eye-slash').hide();

    $('.fa-eye').on('click', function () {
        $('.fa-eye').hide();
        $('.fa-eye-slash').show();
        $('#pw').prop('type', 'text');
    });

    $('.fa-eye-slash').on('click', function () {
        $('.fa-eye').show();
        $('.fa-eye-slash').hide();
        $('#pw').prop('type', 'password');
    });

    $('#id_check').on('click', function () {
        if (!($('#id').val().length >= 6 && $('#id').val().length <= 20)) {
            $('#id').next('label').addClass('warning');
            setTimeout(function () {
                $('label').removeClass('warning');
            }, 1500);
            return;
        }
        $('#id_check').css('color', 'gray');
        $('#id').css('color', 'gray');
        $.ajax({
            type: "post",
            url: "/user/idCheck",
            data: {
                "id": $('#id').val()
            },
            success: function (result) {
                if (result) {
                    $('#id_check').css('color', 'green');
                    $('#id').css('color', 'green');
                    id_check = true;
                    alert("사용가능한 ID 입니다!");
                    console.log("ID 중복없음!");
                } else {
                    $('#id_check').css('color', 'red');
                    $('#id').css('color', 'red');
                    id_check = false;
                    alert("이미 사용중인 ID 입니다!");
                }
            },
            error: function () {
                alert('오류!')
            },
        });
    });

    $('#id').on('keyup', function () {
        if (id_check) {
            $('#id').css('color', 'Red');
        }
        id_check = false;
        $('#id_check').css('color', 'Red');
    });

    $('#nickname').on('keyup', function () {
        if (nickname_check) {
            $('#nickname').css('color', 'Red');
        }
        nickname_check = false;
        $('#nicknameCheckBtn').css('color', 'Red');
    });

    $('#btn_next').on('click', function () {
        if (state == 0) {
            if ($('#id').val() == "" || !id_check || !($('#id').val().length >= 6 && $('#id').val().length <= 20)) {
                $('#id').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else if ($('#pw').val() == "" || !validPwCheck($('#pw').val())) {
                $('#pw').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else {
                $.ajax({
                    type: "post",
                    url: "/user/idCheck",
                    data: {
                        "id": $('#id').val()
                    },
                    success: function (result) {
                        if (result) {
                            state = 1;
                            stateController(state);
                        } else {
                            $('#id').next('label').addClass('warning');
                            setTimeout(function () {
                                $('label').removeClass('warning');
                            }, 1500);
                        }
                    },
                    error: function () {
                        alert('오류!')
                    },
                });
            }
        } else if (state == 1) {

            if ($('#email').val() == "" || !email_check || !validEmailCheck($('#email').val())) {
                $('#email').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else if ($('#nickname').val() == "" || !nickname_check) {
                $('#nickname').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else if ($('#email_check').val() == "" || !emailNum_check) {
                $('#email_check').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else {
                state = 2;
                stateController(state);
            }
        } else if (state == 2) {
            if ($('#birth').val() == "") {
                alert("생년월일을 선택하세요!")
            } else {
                state = 3;
                stateController(state);
            }

        } else if (state == 3) {
            state = 4;
            stateController(state);
        }
    });

    $('#btn_back').on('click', function () {
        if (state == 0 || state == 3) {
            location.href = "/";
        } else {
            state--;
        }
        stateController(state);
    });

    $('#emailCheckBtn').on('click', function () {
        if (!email_check) {
            if ($('#email').val() == "") {
                $('#email').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else if (!validEmailCheck($('#email').val())) {
                $('#email').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);

            } else {
                if (!confirm($("#email").val() + " 주소가 맞습니까?")) {
                    return;
                }
                $("#email").attr("readonly", true);
                $("#emailCheckBtn").css("color", "gray");
                $.ajax({
                    type: "post",
                    url: "/user/emailCheck",
                    data: {
                        "email": $('#email').val()
                    },
                    success: function (result) {
                        if (result) {
                            email_check = true;
                            $("#emailCheckBtn").css("color", "green");
                            $('.email_check').show();
                            alert("이메일로 인증번호을 발송했습니다!");
                        } else {
                            email_check = false;
                            $("#emailCheckBtn").css("color", "red");
                            $("#email").attr("readonly", false);
                            $('#email').next('label').addClass('warning');
                            setTimeout(function () {
                                $('label').removeClass('warning');
                            }, 1500);
                            alert("이미 사용중인 이메일입니다!");
                        }
                    },
                    error: function () {
                        email_check = false;
                        alert('오류!')
                    },
                });
            }
        }
    });

    $('#emailNumCheckBtn').on('click', function () {
        if (!emailNum_check) {
            if ($('#email_check').val() == "") {
                emailNum_check = false;
                alert("인증번호를 입력해 주세요!");
            } else {
                $('#email_check').attr("readonly", true);
                $('#emailNumCheckBtn').css("color", "gray");
                $.ajax({
                    type: "post",
                    url: "/user/emailNumCheck",
                    data: {
                        "email": $('#email').val(),
                        "email_check": $('#email_check').val()
                    },
                    success: function (result) {
                        if (result) {
                            emailNum_check = true;
                            $("#emailNumCheckBtn").css("color", "green");
                        } else {
                            emailNum_check = false;
                            $("#emailNumCheckBtn").css("color", "red");
                            $("#email_check").attr("readonly", false);
                            $('#email_check').next('label').addClass('warning');
                            setTimeout(function () {
                                $('label').removeClass('warning');
                            }, 1500);
                            alert("인증번호가 다릅니다!");
                        }
                    },
                    error: function () {
                        emailNum_check = false;
                        alert('오류!')
                    },
                });
            }
        }
    });

    $('#nicknameCheckBtn').on('click', function () {
        if (!nickname_check) {
            if ($('#nickname').val() == "") {
                $('#nickname').next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else {
                $.ajax({
                    type: "post",
                    url: "/user/nicknameCheck",
                    data: {
                        "nickname": $('#nickname').val()
                    },
                    success: function (result) {
                        if (result) {
                            nickname_check = true;
                            $("#nicknameCheckBtn").css("color", "green");
                            $("#nickname").css("color", "green");
                            alert("사용가능한 닉네임 입니다!");
                        } else {
                            nickname_check = false;
                            $("#nicknameCheckBtn").css("color", "red");
                            $('#nickname').next('label').addClass('warning');
                            setTimeout(function () {
                                $('label').removeClass('warning');
                            }, 1500);
                            alert("이미 사용중인 닉네임 입니다!");
                        }
                    },
                    error: function () {
                        nickname_check = false;
                        alert('오류!')
                    },
                });
            }
        }

    });


});

function stateController(state) {
    if (state == 0) {
        $('.id').show();
        $('.pw').show();
        $('.email').hide();
        $('.email_check').hide();
        $('.nickname').hide();
        $('.birth').hide();
        $('.gender').hide();
        $('.complete').hide();

        $('.progressbar>li:eq(0)').addClass('active');
        $('.progressbar>li:eq(1)').removeClass('active');
        $('.progressbar>li:eq(2)').removeClass('active');
        $('.progressbar>li:eq(3)').removeClass('active');

        $('#btn_next').val("NEXT");
        $('#btn_back').text("Home");

    } else if (state == 1) {
        $('.id').hide();
        $('.pw').hide();
        $('.email').show();
        if (email_check) {
            $('.email_check').show();
        } else {
            $('.email_check').hide();
        }
        $('.nickname').show();
        $('.birth').hide();
        $('.gender').hide();
        $('.complete').hide();

        $('.progressbar>li:eq(0)').addClass('active');
        $('.progressbar>li:eq(1)').addClass('active');
        $('.progressbar>li:eq(2)').removeClass('active');
        $('.progressbar>li:eq(3)').removeClass('active');

        $('#btn_next').val("NEXT");
        $('#btn_back').text("Back");

    } else if (state == 2) {
        $('.id').hide();
        $('.pw').hide();
        $('.email').hide();
        $('.email_check').hide();
        $('.nickname').hide();
        $('.birth').show();
        $('.gender').show();
        $('.complete').hide();

        $('.progressbar>li:eq(0)').addClass('active');
        $('.progressbar>li:eq(1)').addClass('active');
        $('.progressbar>li:eq(2)').addClass('active');
        $('.progressbar>li:eq(3)').removeClass('active');

        $('#btn_next').val("COMPLETE");
        $('#btn_back').text("Back");

    } else if (state == 3) {

        console.log($('#birth').val());

        $.ajax({
            type: "POST",
            url: "/user/insertUser",
            data: {
                "id": $('#id').val(),
                "pw": $('#pw').val(),
                "email": $('#email').val(),
                "nickname": $('#nickname').val(),
                "gender": $("input[name='gender']:checked").val(),
                "birth": $('#birth').val()
            },
            success: function (data) {
                console.log('success');
            },
            error: function () {
                console.log('fail');
            }
        });

        $('.id').hide();
        $('.pw').hide();
        $('.email').hide();
        $('.email_check').hide();
        $('.nickname').hide();
        $('.birth').hide();
        $('.gender').hide();
        $('.complete').show();

        $('.progressbar>li:eq(0)').addClass('active');
        $('.progressbar>li:eq(1)').addClass('active');
        $('.progressbar>li:eq(2)').addClass('active');
        $('.progressbar>li:eq(3)').addClass('active');

        $('#btn_next').val("Login");
        $('#btn_back').text("Home");


    } else if (state == 4) {
        location.href = "/login";
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

function validEmailCheck(email) {
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    return exptext.test(email)
}