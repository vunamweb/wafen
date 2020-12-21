
/* JS is for responsive search click */

function ressearch(){
if ($(window).width() < 768){
$('#search').css('display','none');
$('#head-search').click(function(){
  $('#search').show(function(){
    document.body.addEventListener('click', boxCloser, false);
  });
  $('#search').addClass('active');
});
}
else{
    $('#search').css('display','block');
}
}
$(window).ready(function(){ressearch();});
$(window).resize(function(){ressearch();});

function boxCloser(e){
  if(e.target.id != 'search-input'){
     document.body.removeEventListener('click', boxCloser, false);
     $('#search').hide();
     $('#search').removeClass('active');
  }
  else{
        $('#search').show();
        $('#search').addClass('active');
    }
}


function restab(){
if ($(window).width() < 992)
{
    $('.lang').prependTo('#tab-settings');
    $('.curr').prependTo('#tab-settings');
    $('#top-links').prependTo('#tab-account');

}
else{
    $('#top-links').prependTo('.header_menu_dropdown');
    $('.curr').appendTo('#top-links');
    $('.lang').appendTo('#top-links');


}
}
$(window).ready(function(){restab();});
$(window).resize(function(){restab();});

$(window).scroll(function(){
  if ($(window).scrollTop() > 0) {
    $('header').addClass('fixed');
   }
   else {
    $('header').removeClass('fixed');
   }
});



/* JS is for Load more product */

$(document).ready(function () {
    var size_item = $(".latest .section-product div.product-items").size();
    var x=8;
    $('.latest .nomore').hide();
    $('.latest .section-product div.product-items:lt('+x+')').fadeIn('slow');
    $('.loadmore').click(function () {
    if(x==size_item){
             $('.latest .nomore').show();
              $('.latest .loadmore').hide();
    }else{
        x= (x+4 <= size_item) ? x+4 : size_item;
        $('.latest .section-product div.product-items:lt('+x+')').fadeIn('slow');
    }
    });


    //*-----------------------Parallax------------------------ *//

    var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);
    if(!isMobile) {
		if($(".cms_parallax").length){  $(".cms_parallax").sitManParallex({  invert: false });};
	}else{
		$(".cms_parallax").sitManParallex({  invert: true });

	}

	//*--------------------------------------------------- *//

	$('#tabs a').tabs();
	$('#content h1').prependTo('ul.breadcrumb');
	$($('.left-category li:not(.collapsed) ul')).addClass('in');
    $('.seemore').prependTo('#morebutton');
});


/* JS for Top button */
$(document).ready(function(){
$("body").append("<a id='scrollup' title='Back To Top' href=''></a>");

(function($) {
    $(document).ready(function(){

        //When distance from top = 250px fade button in/out
        $(window).scroll(function(){
            if ($(this).scrollTop() > 0) {
                $('#scrollup').fadeIn(300);
            } else {
                $('#scrollup').fadeOut(300);
            }
        });

        //On click scroll to top of page t = 1000ms
        $('#scrollup').click(function(){
            $("html, body").animate({ scrollTop: 0 }, 1000);
            return false;
        });

    });
})(jQuery);
});



/* JS is for responsive menu dropdown */
$(document).ready(function(){
$(".responsive-bar").click(function(){
		if($('.header-middle-outer').hasClass('closetoggle')) {
        $($('.header-middle-outer')).removeClass('closetoggle').addClass('opentoggle');
		$($('.responsive-bar')).addClass('active');
		$($('body')).addClass('nav-open');

    }
    else{
        $($('.header-middle-outer')).removeClass('opentoggle').addClass('closetoggle');
		$($('.responsive-bar')).removeClass('active');
		$($('body')).removeClass('nav-open');
    }
    });
	$("#responsive-menu ul > li.dropdown > span").click(function(){
		if($('#responsive-menu ul > li.dropdown').hasClass('active')) {
        $($('#responsive-menu ul > li.dropdown')).removeClass('active').addClass('');
		$($('#responsive-menu ul > li.dropdown > ul')).addClass('menuopen');

    }
    else{
        $($('#responsive-menu ul > li.dropdown')).addClass('active');
		$($('#responsive-menu ul > li.dropdown > ul')).removeClass('menuopen');
    }
    });

});


/* JS is for Menu more link */
$(document).ready(function () {
			if ($(window).width() > 992 && $(window).width() < 1200){
				var max_elem = 6 ;
				$('.main-navigation > li').first().addClass('home_first');
				var items = $('.main-navigation > li.main_cat');
				var surplus = items.slice(max_elem, items.length);
				surplus.wrapAll('<li class="level-top hiden_menu menu-last"><ul>');
				$('.hiden_menu').prepend('<a href="#" class="level-top">Weitere</a>');
			}
			if ($(window).width() > 1199){
				var max_elem = 7;
				$('.main-navigation > li').first().addClass('home_first');
				var items = $('.main-navigation > li.main_cat');
				var surplus = items.slice(max_elem, items.length);
				surplus.wrapAll('<li class="level-top hiden_menu menu-last"><ul>');
				$('.hiden_menu').prepend('<a href="#" class="level-top">Weitere</a>');
			}
});
