/**
 * 
 */


document.addEventListener("DOMContentLoaded",function(){

    // 슬라이드쇼 구현 기능
    const slides = document.querySelector('.sliding-box');
    const slide = document.querySelectorAll('.review-box');
    let currentIdx = 0;
    const slideCount = slide.length;
    const slideWidth = 360;
    const leftBtn = document.querySelector('#prevBtn');
    const rightBtn = document.querySelector('#nextBtn');

    makeClone();

    
    function makeClone() {
	    // 슬라이드 반복
	    for(let i = 0; i<slideCount; i++) {
	        // a.cloneNode(), a.cloneNode(true):a 자식요소까지 모두 복사
	        var cloneSlide = slide[i].cloneNode(true);
	        cloneSlide.classList.add('clone');
	        // a.appendChild(b) : 뒤에 추가
	        slides.appendChild(cloneSlide);
	    }
	
	    for (let i = slideCount-1; i>=0; i--) {
	        var cloneSlide = slide[i].cloneNode(true);
	        cloneSlide.classList.add('clone');
	        // a.prepend(b) : 앞에 추가
	        slides.prepend(cloneSlide);
	    }
	
	    updateWidth();
        setInitialPos();
        setTimeout(function(){
            slides.classList.remove('animate');
        },100);
	}

    rightBtn.addEventListener('click',function(){
        moveSlide(currentIdx+1);
    });
    leftBtn.addEventListener('click',function(){
        moveSlide(currentIdx-1);
    });

	function updateWidth() {
	    let currentSlides = document.querySelectorAll('.sliding-box article');
	    let newSlideCount = currentSlides.length;
	    let newWidth = newSlideCount*slideWidth + 'px';
	    slides.style.width = newWidth;
	}

    function setInitialPos(){
        let initialTranslateValue = -(slideWidth*slideCount);
        slides.style.transform = 'translateX('+initialTranslateValue+'px)';
    }
    
    function moveSlide(num) {
    	slides.classList.add('animate');
        slides.style.left = - (num)*slideWidth +'px';
        slides.style.transition = `${0.5}s ease-out`;

        currentIdx = num;
        if (currentIdx == slideCount+1){
            slides.style.transition = `${0}s ease-out`;
            slides.style.left = "0px";
            currentIdx = 0;
        }

        if (currentIdx == -slideCount-1){
            slides.style.transition = `${0}s ease-out`;
            slides.style.left = "0px";
            currentIdx = 0;
        }
    }
});
