/**
 * search.js
 */
 
 $(document).ready(function() {
	// 돋보기 이미지 클릭했을 때 검색창 나타내기
	$('#loginBox img').on('click',function(){
		$('#searchBox').css('visibility','visible');
	});
	
	$('#searchBox img').on('click',function(){
		$('#searchBox').css('visibility','hidden');

	});
	

});