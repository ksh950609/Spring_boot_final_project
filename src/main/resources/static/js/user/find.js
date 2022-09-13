$(document).ready(function () {

    var id_check_flag = true;
    var pw_check_flag = true;


    $('#btn_next').val("Login");

    $('.pw').hide();
    $('.email_check1').hide();
    $('.email_check2').hide();
    $('.complete1').hide();
    $('.complete2').hide();


    $('#id_check').on('click', function () {

        if (id_check_flag) {

            var email = $('#id').val();

            if (validEmailCheck(email)) {
                $("#id").attr("readonly",true);
                $('#id_check').css('color', 'gray');
                $('#id').css('color', 'gray');
                $.ajax({
                    type: "post",
                    url: "/user/selectUserFromEmail",
                    data: {
                        "email": email
                    },
                    success: function (result) {
                        if (result) {
                            $.ajax({
                                type: "post",
                                url: "/find/id",
                                data: {
                                    "email": email
                                },
                                success: function (result) {
                                    if (result) {
                                        id_check_flag = false;
                                        alert("등록하신 이메일로 인증번호가 발송되었습니다!");

                                        $('#id_check').css('color', 'Green');
                                        $('.email_check1').show();
                                    } else {
                                        $("#id").attr("readonly",false);
                                        $('#id_check').css('color', 'red');
                                        $('#id').css('color', 'black');
                                        alert("인증번호 발송에 실패했습니다!");
                                    }

                                },
                                error: function () {
                                    alert('오류!')
                                },
                            });
                        } else {
                            $("#id").attr("readonly",false);
                            $('#id_check').css('color', 'red');
                            $('#id').css('color', 'black');
                            alert("등록된 이메일이 없거나 잘못 입력되었습니다!");
                        }

                    },
                    error: function () {
                        alert('오류!')
                    },
                });

            } else {
                alert("올바른 이메일 형식을 입력해 주세요!");
            }
        }
    });

    $('#id_check2').on('click', function () {
        var email = $('#id').val();
        var certifyNum = $('#email_check1').val();
        $('#id_check2').css("color",'gray');
        $.ajax({
            type: "post",
            url: "/find/id/certify",
            data: {
                "email": email,
                "certifyNum": certifyNum
            },
            success: function (result) {
                if (result == "FAIL") {
                    $('#id_check2').css("color",'red');
                    alert("인증번호가 다릅니다!");
                } else {
                    $('#id_check').css('color', 'Green');
                    $('.id').hide();
                    $('.email_check1').hide();
                    $('.complete1').text('회원님의 아이디는  ' + result + '  입니다');
                    $('.complete1').show();
                }
            },
            error: function () {
                alert('오류!')
            },
        });
    });

    $('#pw_check').on('click', function () {

        if (pw_check_flag) {

            var email = $('#pw').val();

            if (validEmailCheck(email)) {
                $("#pw").attr("readonly",true);
                $('#pw_check').css('color', 'gray');
                $('#pw').css('color', 'gray');
                $.ajax({
                    type: "post",
                    url: "/user/selectUserFromEmail",
                    data: {
                        "email": email
                    },
                    success: function (result) {
                        if (result) {
                            $.ajax({
                                type: "post",
                                url: "/find/pw",
                                data: {
                                    "email": email
                                },
                                success: function (result) {
                                    if (result) {
                                        pw_check_flag = false;
                                        alert("등록하신 이메일로 인증번호가 발송되었습니다!");
                                        $('#pw_check').css('color', 'Green');
                                        $('.email_check2').show();
                                    } else {
                                        $("#pw").attr("readonly",false);
                                        $('#pw_check').css('color', 'red');
                                        $('#pw').css('color', 'black');
                                        alert("인증번호 발송에 실패했습니다!")
                                    }

                                },
                                error: function () {
                                    $("#pw").attr("readonly",false);
                                    $('#pw_check').css('color', 'red');
                                    $('#pw').css('color', 'black');
                                    alert('오류!');
                                },
                            });
                        } else {
                            $("#pw").attr("readonly",false);
                            $('#pw_check').css('color', 'red');
                            $('#pw').css('color', 'black');
                            alert("등록된 이메일이 없거나 잘못 입력되었습니다!");
                        }

                    },
                    error: function () {
                        alert('오류!')
                    },
                });

            } else {
                alert("올바른 이메일 형식을 입력해 주세요!");
            }
        }
    });

    $('#pw_check2').on('click', function () {
        var email = $('#pw').val();
        var certifyNum = $('#email_check2').val();
        $('#email_check2').css('color', 'gray');
        $('#pw_check2').css('color', 'gray');
        $.ajax({
            type: "post",
            url: "/find/pw/certify",
            data: {
                "email": email,
                "certifyNum": certifyNum
            },
            success: function (result) {
                if (result) {
                    $('.pw').hide();
                    $('.email_check1').hide();
                    $('.email_check2').hide();
                    $('.complete2').text(email + ' 주소로 초기화된  Password를 보냈습니다');
                    $('.complete2').show();
                } else {
                    $('#email_check2').css('color', 'black');
                    $('#pw_check2').css('color', 'red');
                    alert("인증번호가 다릅니다!");
                }
            },
            error: function () {
                $('#email_check2').css('color', 'red');
                $('#email_check2').css('color', 'red');
                alert('오류!')
            },
        });
    });

    $('.tab_id').on('click', function () {
        $('.id').show();
        $('.pw').hide();
        $('.email_check1').hide();
        $('.email_check2').hide();
        $('.complete1').hide();
        $('.complete2').hide();
    });

    $('.tab_pw').on('click', function () {
        $('.id').hide();
        $('.pw').show();
        $('.email_check1').hide();
        $('.email_check2').hide();
        $('.complete1').hide();
        $('.complete2').hide();
    });

});

function validEmailCheck(email) {
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    return exptext.test(email)
}