$( function() {
    // Handler when the DOM is fully loaded

    // 태그 배열 초기화
    let tagItem = document.getElementsByClassName("tagItem");
    getTags();
    function getTags() {
        for(let i=0; i<tagItem.length; i++){
            tags.push(tagItem[i].textContent);
        }
        console.log(tags)
    }

    // 선택된 전시명으로 코스짜기 버튼
    const selectBtn = document.getElementsByClassName("courseSelect");
    const textBox = document.getElementById("selectedExhbn");
    const selectedBox = document.getElementById("selected");

    for (let i=0; i<selectBtn.length; i++) {
        selectBtn[i].addEventListener('click', function (){
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

    let removeBtns = document.getElementsByClassName("closeBtn");

    function addTag(e){
        if (e.key == "Enter") {
            let tag = e.target.value.replace(/\s+/g, ' '); // 태그에서 다수 공백 삭제
            if(tag.length>1 && !tags.includes(tag)) { // 아직 없는 태그, // 태그 생성
                if(tags.length>=3) {
                    const target = document.getElementById("tag-caution");
                    target.style.visibility = "visible";
                    setTimeout(function() {
                        target.classList.remove("vibration");
                    }, 500);
                } else {
                    tags.push(tag);
                }
                createTag();
            }
            e.target.value = ""; // 내용 지우기
        }
    }

    function createTag(){
        ul.querySelectorAll("li").forEach(li => li.remove())
        tags.slice().reverse().forEach(tag =>{
            let liTag = `<li class="li-item tagItem" value="${tag}"> ${tag} <i class="fa-solid fa-xmark closeBtn" onclick="remove(this, '${tag}')"></i></li>`;
            input.insertAdjacentHTML("beforebegin",liTag); // tag 추가
        });
        console.log(tags)
    }


}); // .document.eventlistner

let tags = [];
function remove(element, tag) {
    let index = tags.indexOf(tag);
    tags = [...tags.slice(0,index), ...tags.slice(index+1)]; // 태그 삭제
    element.parentElement.remove(); // li 삭제
}