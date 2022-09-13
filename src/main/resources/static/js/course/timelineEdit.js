document.write('<script type=\"text/javascript\" src=\"mapEdit.js\"><\/script>');
document.write('<script type=\"text/javascript\" src=\"mapView.js\"><\/script>');

let count = 0;
let sites_copy = [];
let listItems = [];
let tags = []; // 코스 태그
let $memoArea;
let listItem;


$( function() {
    // 페이지 구성을 위한 데이터 호출
    $.ajax({
        type: "POST",
        url: "/course/getCourse",
        data: {"courseId": $("#courseId").val()},
        dataType: "json",
        success: function (result) {
            positions = result;
            for (var i=0; i<positions.length; i++) {
                addCourseMarker2(positions[i].y, positions[i].x, i);
            }
            panTo(positions[0].y, positions[0].x);
        },
        error: function () {
            alert("새로운 코스를 작성할 준비가 되셨나요?");
            const firstExhbnTitle = $("#firstExhbnTitle").text();
            const firstExhbnAddr = $("#firstExhbnAddr").text();
            const firstMemo = "";
        }
    });

    // 태그 배열 초기화
    let tagItem = document.getElementsByClassName("tagItem");
    getTags();
    // .태그 배열 초기화.

    // 선택된 전시명으로 코스짜기 버튼
    const selectBtn = document.getElementsByClassName("courseSelect");
    const textBox = document.getElementById("selectedExhbn");
    const selectedBox = document.getElementById("selected");

    for (let i = 0; i < selectBtn.length; i++) {
        selectBtn[i].addEventListener('click', function () {
            const radioId = selectBtn[i].id;
            const query = 'label[for="' + radioId + '"]';
            const text = document.querySelector(query).innerHTML;
            textBox.innerHTML = text;
            selectedBox.style.visibility = "visible";
        });
    }

    // 태그 검색
    const ul = document.getElementById("tagList"),
        input = document.getElementById("inner-searchbar");

    input.addEventListener("keyup", addTag);

    // 태그 삭제 버튼
    let removeBtns = document.getElementsByClassName("closeBtn");

    /* 태그 추가 함수 */
    function addTag(e) {
        if (e.key == "Enter") {
            let tag = e.target.value.replace(" ", ""); // 태그에서 다수 공백 삭제
            tag.trim();
            if (tag.length > 1 && !tags.includes(tag)) { // 아직 없는 태그, // 태그 생성
                if (tags.length > 3) {
                    alert("태그는 3개까지 입력 가능합니다.")
                } else {
                    tags.push(tag);
                }
                createTag();
            }
            e.target.value = ""; // 내용 지우기
        }
    }

    /* createTag 함수 */
    function createTag() {
        ul.querySelectorAll("li").forEach(li => li.remove())
        tags.slice().reverse().forEach(tag => {
            let liTag = `<li class="li-item tagItem" value="${tag}"> ${tag} <i class="fa-solid fa-xmark closeBtn" onclick="remove(this, '${tag}')"></i></li>`;
            input.insertAdjacentHTML("beforebegin", liTag); // tag 추가
        });
        console.log(tags)
    }

    // 정렬 가능한 리스트
    // 순서 바꿔 배열 다시 저장하기
    $("#sortable").sortable({
        cursor: "move",
        delay: 100,
        helper: "clone",
        items: "> li",
        opacity: 0.5,
        revert: 10,
        // handle: ".moveHandler",
        start: function (event, ui) {
            startIdx = ui.item.index();
        },
        change: function (event, ui) {
        },
        update: function (event, ui) {
            var item = positions.splice(startIdx,1);
            positions.splice(ui.item.index(), 0, item[0]);
            // html 비우기
            $(".courseItem").remove();
            // 새로 작성
            createList();
        },
        axis: 'y'
    });
    $("#sortable").disableSelection();
    // .순서 바꿔 다시 저장하기. //

    $(".portlet-toggle").on("click", function () {
        let icon = $(this);
        icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
        icon.closest(".portlet").find(".portlet-content").toggle();
    });

    // 태그 init //
    function getTags() {
        tags = [];
        for (let i = 0; i < tagItem.length; i++) {
            let input = tagItem[i].textContent.trim();
            tags.push(input);
        }
        console.log(tags)
    }

    // 수정 -> 저장 //
    $("#saveBtn").on("click", function () {
        updateCourse();
    });

    // 새 포스트 작성 //
    $("#writePostBtn").on("click", function () {
        insertCourse();
    });

} );

/** insertCourse */
function insertCourse() {
    let courseTag = "";

    let courseTitle = $("#courseTitle").val();
    let exhbnId = $("#exhbnId").val();
    let userId = $("#userId").val();
    let courseId = $("#courseId").val();

    if($("#courseStatus").prop("checked")){
        $("#courseStatus").val(1);
    } else {
        $("#courseStatus").val(2);
    }
    let courseState = $("#courseStatus").val();

    for (let i=0; i<tags.length; i++){
        if (i==(tags.length-1)){
            courseTag += tags[i];
        } else {
            courseTag += tags[i] + ";;";
        }
    }
    console.log(courseTag)

    let param = {
        "exhbnId": exhbnId,
        "courseTitle": courseTitle,
        "courseTag": courseTag,
        "courseState": courseState,
        "courseListItem": positions
    };

    console.log(JSON.stringify(param));
    $.ajax({
        url:"/course/createCourse",
        contentType: 'application/json; charset=utf-8',
        type:"POST",
        data:JSON.stringify(param),
        success:function(result){
            if (result=="FAIL") {
                alert("다시 로그인 해주세요.")
            } else {
                alert("작성 완료!");
                window.location.href="/course/list";
            }
        },
        error:function(request,status,error) {
            alert("error!");
            console.log("code="+request.status+"message="+request.responseText+"error="+error); //실패시처리
        }
    });
}

/** updateCourse */
function updateCourse() {
    let courseSitesArr = "";
    let courseAddressArr = "";
    let courseMemoArr = "";
    let courseTag = "";

    let courseTitle = $("#courseTitle").val();
    let exhbnId = $("#exhbnId").val();
    let userId = $("#userId").val();
    let courseId = $("#courseId").val();

    if($("#courseStatus").prop("checked")){
        $("#courseStatus").val(1);
    } else {
        $("#courseStatus").val(2);
    }
    let courseStatus = $("#courseStatus").val();

    for (let i=0; i<sites.length; i++){
        if (i==(sites.length)){
            courseSitesArr += sites[i];
            courseAddressArr += addresses[i];
            courseMemoArr += memos[i];
        } else {
            courseSitesArr += sites[i] + ";;";
            courseAddressArr += addresses[i] + ";;";
            courseMemoArr += memos[i] + ";;";
        }
    }
    for (let i=0; i<tags.length; i++){
        if (i==(tags.length-1)){
            courseTag += tags[i];
        } else {
            courseTag += tags[i] + ";;";
        }
    }
    console.log(courseTag)

    let param = {
        "courseId":courseId,
        "userId":userId,
        "exhbnId":exhbnId,
        "courseTitle":courseTitle,
        "courseTag":courseTag,
        "courseState":courseStatus,
        "courseSitesArr":courseSitesArr,
        "courseAddressArr":courseAddressArr,
        "courseMemoArr":courseMemoArr
    }
    // let json = JSON.stringify()

    $.ajax({
        url:"/course/updateCourse",
        contentType: 'application/json',
        type:"POST",
        traditional:true,
        data:JSON.stringify(param),
        success:function(result){
            alert("수정 완료!");
            window.history.back();
        },
        error:function(request,status,error) {
            alert("code="+request.status+"message="+request.responseText+"error="+error); //실패시처리
        }
    });

}

// 코스 item 삭제 함수
function deleteCourse(element, index) {
    if(confirm("항목을 삭제하시겠습니까?")){
        if (sites.length>1) {
            $("#route"+index).remove(); // jsp 태그 삭제
            // sites에서 값이 동일한 요소 삭제
            for (let i = 0; i < sites.length; i++) {
                if (sites[i] === sites_copy[index]) {
                    sites.splice(i, 1);
                    addresses.splice(i, 1);
                    memos.splice((i, 1));
                }
            }
        } else {
            alert("모든 항목을 삭제하실 수 없습니다.")
        }
        console.log(sites)
    }
}

// 태그 삭제 함수 //
function remove(element, tag) {
    let index = tags.indexOf(tag);
    tags.splice(index,1);
    console.log(tags);
    element.parentElement.remove(); // li 삭제
}

/** createList 함수 */
function createList() {
    for (let i = 0; i < positions.length; i++) {
        listItem = document.createElement('li');
        listItem.setAttribute('data-index', i);
        listItem.setAttribute("class", "route-row courseItem");
        listItem.setAttribute("id", "route" + i);
        listItem.setAttribute("draggable", "true");
        // listItem.setAttribute("value", sites[i] + ";;" + addresses[i] + ";;" + memos[i]);

        listItem.innerHTML = `
                        <div class="left-side">
                            <div class="moveHandler">
                                <i class="fa-solid fa-bars moveHandlerBtn"></i>
                            </div>
                            <div class="left-side">
                            <div class="line"></div>
                            <div class="left">
                                <div class="subCourse-dot">${i + 1}</div>
                            </div>
                            <div class="content">
                                <div class="where">
                                    <c:if test="${i != 0}">
                                            <span class="siteCategory">${positions[i].category_group_name}</span>&nbsp;
                                    </c:if>
                                    <h3 class="siteName">
                                        ${positions[i].place_name}
                                    </h3>
                                    <div class="siteAddress">${positions[i].road_address_name}</div>
                                    <div class="memo-box">
                                        <textarea id="memo_${i}" class="place-memo-input" placeholder="메모를 입력하세요.">${positions[i].place_memo}</textarea> 
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    <div class="delete" id="deleteBtnBox">
                        <i class="fa-solid fa-circle-minus fa-2xl deleteBtn" id="deleteBtn${i}" onclick="deleteCourse(this, '${i}')"></i>
                    </div>
                    `; //place-memo-input
        // ${sites[i]}
        listItems.push(listItem);

        $("#sortable").append(listItem);
        sites_copy = [...positions];
    }
    $memoArea = $(".place-memo-input");
    saveMemo();
    for (var i=0; i<positions.length; i++) {
        addCourseMarker2(positions[i].y, positions[i].x, i);
    }
}

function saveMemo() {
    $memoArea.each(function(i) {
        $(document).on("focusout", "#memo_"+i ,function(index){
            console.log($(this).val());
            positions[i].place_memo = $(this).val();
            console.log(positions[i].place_memo);
        });
    });
}