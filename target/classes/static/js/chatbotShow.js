/**
 * 
 */
 
 $(document).ready(function(){
 	$('#chatImage img')
	.on('click',function(){
		$('#chatImage img').fadeOut(300);
		$('#chatbotTest').slideDown(700);
	});
	
	$('#map_jeju').on('click',function(){
		$('#closeButton').css('visibility','visible');
		$('#mapIntro').fadeOut(300);
	});
	
	$('#closeButton img')
	.on('click',function(){
		$('#closeButton').css('visibility','hidden');
		$('#mapIntro').fadeIn(2000);
		});
		
	$('#btnClose')
	.on('click',function(){
		$('#chatImage img').fadeIn(2000);
		$('#chatbotTest').slideUp(700);
	});
	
	/*$('#chatImage img')
	.on('click',function(){
		$('#chatbotTest').slideUp(1000);
	});*/
 });