 $(document).ready(function(){

 	$('#exhbnSearchFrm').on('click', function(){
 		//alert($('#inner-searchbar').val());
 		var title = $('#inner-searchbar').val();
 		// 기본 기능 중단
 		//event.preventDefault();
 		$.ajax({
            type: "post",
            url: "/exhbn/searchResult222",
            data: {
                "exhbnTitle": title
                
            },
            success: function (result) {
            // alert("검색 결과를 보여드릴게요");
            $('#searchResultl').empty();
            $('#searchResultl').append(result);
            
			console.log(result);            },
            error: function () {
                alert('검색어를 확인하세요')
            },
        });
 		
 	}); // submit 끝 
 });  // ready 끝
 

	 $(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		
	})

})
// 박물관 탭
 $(document).ready(function(){

 	$('#Museum').on('click', function(){
 		var type = $('#Museum').on('click').val();
 		$.ajax({
            type: "post",
            url: "/exhbn/tab_exhbnSearch",
           	dataType : "html",
            data: {
                "exhbnType": type
                
            },
           success: function (result_museum) {
            $('#searchResultl').html(result_museum);
            
			console.log(result_museum);
			},
            error: function () {
            alert("오류");
            },
        });
        
        
 		
 	}); // submit 끝 
 });  // ready 끝
 
  $(document).ready(function(){

 	$('#Art_Exhbn').on('click', function(){
 		var type = $('#Art_Exhbn').on('click').val();
 		$.ajax({
            type: "post",
            url: "/exhbn/tab_exhbnSearch2",
           	dataType : "html",
            data: {
                "exhbnType": type
                
            },
           success: function (result_Art_Exhbn) {
            $('#searchResultl').html(result_Art_Exhbn);
            
			console.log(result_Art_Exhbn);
			},
            error: function () {
            alert("오류");
            },
        });
        
        
 		
 	}); // submit 끝 
 });  // ready 끝
 
   $(document).ready(function(){

 	$('#Festival').on('click', function(){
 		var type = $('#Festival').on('click').val();
 		$.ajax({
            type: "post",
            url: "/exhbn/tab_exhbnSearch3",
           	dataType : "html",
            data: {
                "exhbnType": type
                
            },
           success: function (result_Festival) {
            $('#searchResultl').html(result_Festival);
            
			console.log(result_Festival);
			},
            error: function () {
            alert("오류");
            },
        });
        
        
 		
 	}); // submit 끝 
 });  // ready 끝
 
    $(document).ready(function(){

 	$('#Edu_Ex').on('click', function(){
 		var type = $('#Edu_Ex').on('click').val();
 		$.ajax({
            type: "post",
            url: "/exhbn/tab_exhbnSearch4",
           	dataType : "html",
            data: {
                "exhbnType": type
                
            },
           success: function (result_Edu_Ex) {
            $('#searchResultl').html(result_Edu_Ex);
            
			console.log(result_Edu_Ex);
			},
            error: function () {
            alert("오류");
            },
        });
        
        
 		
 	}); // submit 끝 
 });  // ready 끝
 
     $(document).ready(function(){

 	$('#Etc_Ex').on('click', function(){
 		var type = $('#Etc_Ex').on('click').val();
 		$.ajax({
            type: "post",
            url: "/exhbn/tab_exhbnSearch5",
           	dataType : "html",
            data: {
                "exhbnType": type
                
            },
           success: function (result_Edu_Ex) {
            $('#searchResultl').html(result_Edu_Ex);
            
			console.log(result_Edu_Ex);
			},
            error: function () {
            alert("오류");
            },
        });
        
        
 		
 	}); // submit 끝 
 });  // ready 끝
 
      $(document).ready(function(){

 	$('#"allArea"').on('click', function(){
 		var type = $('#"allArea"').on('click').val();
 		$.ajax({
            type: "post",
            url: "/exhbn/tab_exhbnSearch6",
           	dataType : "html",
            data: {
                "exhbnType": type
                
            },
           success: function (result_allArea) {
            $('#searchResultl').html(result_allArea);
            
			console.log(result_allArea);
			},
            error: function () {
            alert("오류");
            },
        });
        
        
 		
 	}); // submit 끝 
 });  // ready 끝
 
 	$(document).ready(function() {
			var listForm = $("#listForm");
			
			$(".pagination_button a").on("click", function(e) {
				e.preventDefault();
				
				listForm.find("input[name='pageNum']").val($(this).attr("href"));
				listForm.submit();
			});
		});
 
