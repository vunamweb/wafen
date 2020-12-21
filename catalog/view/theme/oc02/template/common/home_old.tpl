<?php echo $header; ?>
       
<?php echo $content_top; ?>
  
<div class="home-subbanner-outer">
  <div class="owl-carousel home-subbanner-inner">       
     <?php echo $content_topbanner; ?>
  </div>
</div>  
<?php echo $content_bottom; ?>                    
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <!--<div id="content" class="<?php echo $class; ?>"><?php //echo $content_bottom; ?></div>!-->
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript"><!--

$(document).ready(function(){
$('.product-carousel').owlCarousel({
		items: 4,
		autoPlay: false,
		singleItem: false,
		navigation: true,		
		pagination: false,
		itemsDesktop : [1199,3],
		itemsDesktopSmall :	[991,3],
		itemsTablet : [650,2],
		itemsMobile : [479,1]
	});	
	
	$('.testimonial').owlCarousel({
		items: 1,
		autoPlay: true,
		singleItem: true,
		navigation: true,	
		pagination: false
	});
	
	$('.home-subbanner-inner').owlCarousel({
		items: 4,
		autoPlay: false,
		singleItem: false,
		navigation: false,
		pagination: false,
		itemsDesktop : [1320,3],
		itemsDesktopSmall :	[767,2]
	});
		
});	
--></script>


<?php echo $footer; ?>
