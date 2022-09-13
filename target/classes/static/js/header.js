/**
 * header.js
 */
 
 $(document).ready(function() {
	// 윈도우 스크롤시 메인 메뉴 고정 
	$(window).on('scroll',function(){
		if($(document).scrollTop()>=$('#headerBox').height()){
			$('#mainMenuBox').addClass('mainMenuFixed');
		}else{
			$('#mainMenuBox').removeClass('mainMenuFixed');
		}
	});
	
	$(window).on('scroll',function(){
		// 스크롤되는 문서의 top 그림자 표시
		if($(document).scrollTop()>=$('#headerBox').height()){
			$('#mainMenuBox').addClass('boxshadow');
		}else{
			$('#mainMenuBox').removeClass('boxshadow');
		}
	});
	
	// moveToTop 이미지 클릭 시 top 으로 이동
	$('#footerBoxRight img').on('click',function(){
		$('html, body').animate({scrollTop:0}, 500);
	});

	 $('.dropdown').each(function(){
		 $(this).find('.dropdownMenu').hide();
	 });

	 // 드랍다운
	 $('.dropdown').hover(function(){
			 $(this).find('.dropdownMenu').slideDown();
		 },
		 function(){
			 $(this).find('.dropdownMenu').slideUp();
		 });
});