/**
 * indexheader.js
 */
 
  $(document).ready(function() {
	// 윈도우 스크롤시 메인 메뉴 고정 
		/*$(window).on('scroll',function(){
		if($(document).scrollTop()>=$('#headerBox').height()){
			$('#mainMenuBox').addClass('mainMenuFixed');
		}else{
			$('#mainMenuBox').removeClass('mainMenuFixed');
		}
	});*/
	
	/* 메뉴 배경 색상변경 */
	$(window).on('scroll',function(){
		// 스크롤되는 문서의 top이 #headerBox 이상이면 메인메뉴 고정되고 그림자 표시
		if($(document).scrollTop()>=$('#headerBox').height()){
			$('#mainMenuBox').css("background" , "#fff");
			$('#searchBtn').css("background" , "#000");
		}else{
			$('#mainMenuBox').css("background" , "");
			$('#searchBtn').css("background" , "");
		}
	});
	
	/* 메뉴 글씨 색상변경 */	
	$(window).on('scroll',function(){
		// 스크롤되는 문서의 top이 #headerBox 이상이면 메인메뉴 고정되고 그림자 표시
		if($(document).scrollTop()>=$('#headerBox').height()){
			 $('.color').css("color" , "#000");
			 $('.userName').css("color" , "#000");
		}else{
			$('.color').css("color" , "#000");
			$('.userName').css("color" , "#000");
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
	
	/*마우스 스크롤시 검색 이미지 변경*/
	$(window).on('scroll',function(){
		if($(document).scrollTop()>=$('#headerBox').height()){
			$('#loginBox img').attr('src','image/searchBlack.png');
			$('#searchBox img').attr('src','image/x.png');
		}else{
			$('#loginBox img').attr('src','image/search.png');
			$('#searchBox img').attr('src','image/whiteX.png');
			
		}
});
	
	/* 검색 메뉴 */
	$(window).on('scroll',function(){
		// 스크롤되는 문서의 top이 #headerBox 이상이면 메인메뉴 고정되고 그림자 표시
		if($(document).scrollTop()>=$('#headerBox').height()){
			$('#searchBox').css("background" , "#fff");
		}else{
			$('#searchBox').css("background" , "");
		}
	});
	
	// moveToTop 이미지 클릭 시 top 으로 이동
	$('#footerBoxRight img').on('click',function(){
		$('html, body').animate({scrollTop:0}, 500);
	});
	
});