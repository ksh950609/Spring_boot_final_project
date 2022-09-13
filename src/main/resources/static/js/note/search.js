$(document).ready(function () {

    $('#searchTEXT').val(getParameterByName('keyword'));

    if (getParameterByName('sort') == 'new') {
        $('#filter_innerbox').append("<li onclick=\"sortMove('new')\" class=\"filter-active\">New</li>")
        $('#filter_innerbox').append("<li onclick=\"sortMove('popular')\" class=\"\">Popular</li>")
    } else if (getParameterByName('sort') == 'popular') {
        $('#filter_innerbox').append("<li onclick=\"sortMove('new')\" class=\"\">New</li>")
        $('#filter_innerbox').append("<li onclick=\"sortMove('popular')\" class=\"filter-active\">Popular</li>")
    } else {
        $('#filter_innerbox').append("<li onclick=\"sortMove('new')\" class=\"filter-active\">New</li>")
        $('#filter_innerbox').append("<li onclick=\"sortMove('popular')\" class=\"\">Popular</li>")
    }

    var test = getParameterByName('page');
    test *= 1;
    test--;

    var maxCount = parseInt($('#maxDataNum').val() / 10) + 2;
    // console.log(maxCount);

    // console.log(parseInt(test / 5) * 5);
    // console.log(parseInt(test / 5) * 5 + 1);
    // console.log((parseInt(test / 5) + 1) * 5);
    // console.log((parseInt(test / 5) + 1) * 5 + 1);

    var temp = parseInt(test / 5) * 5;
    temp = (temp == 0) ? 1 : temp;
    $('#page-box').append("<div class='nav_btn' onclick='pagemove(" + temp + ")'>" + "<" + "</div>");

    var num = parseInt(test / 5) * 5 + 1;
    test++;
    for (let i = 0; i < 5; i++) {
        if (num < maxCount) {
            if (num == test)
                $('#page-box').append("<div class='nav_btn nav_active' onclick='pagemove(" + num + ")'>" + num + "</div>");
            else
                $('#page-box').append("<div class='nav_btn' onclick='pagemove(" + num + ")'>" + num + "</div>");
        }
        num = (num < maxCount) ? num + 1 : maxCount;
    }
    num = (num >= maxCount) ? num - 1 : num;
    $('#page-box').append("<div class='nav_btn' onclick='pagemove(" + num + ")'>" + ">" + "</div>");

    $('#searchBtn2').on('click', function () {
        var queryParams = {
            page: 1,
            category: getParameterByName('category'),
            sort: getParameterByName('sort'),
            keyword: $('#searchTEXT').val()
        }
        location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
    })

    $("#searchTEXT").on("keyup", function (key) {
        if (key.keyCode == 13) {
            var queryParams = {
                page: 1,
                category: getParameterByName('category'),
                sort: getParameterByName('sort'),
                keyword: $('#searchTEXT').val()
            }
            location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
        }
    });
});

function pagemove(page) {
    var queryParams = {
        page: page,
        category: getParameterByName('category'),
        sort: getParameterByName('sort'),
        keyword: getParameterByName('keyword')
    }
    location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
}

function sortMove(sort) {
    var queryParams = {
        page: 1,
        category: getParameterByName('category'),
        sort: sort,
        keyword: getParameterByName('keyword')
    }
    location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}