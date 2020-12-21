
<div id="carousel-<?php echo $module; ?>" class="brand">
  <div class="manufacture-slider owl-carousel" id="module-<?php echo $module; ?>-carousel">
    <?php foreach ($banners as $banner) { ?>
    	<div class="item">
		<div class="product-thumb">		
			<?php if ($banner['link']) { ?>
   <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
		</div></div>
    <?php } ?>
  </div>
</div>
<script type="text/javascript"><!--

$(document).ready(function(){
$('.manufacture-slider').owlCarousel({
		items: 5,
		autoPlay: false,
		singleItem: false,
		navigation: true,		
		pagination: false,
		itemsDesktop : [1199,4],
		itemsDesktopSmall :	[991,3],
		itemsTablet : [767,3],
		itemsTabletSmall : [479,2],
		itemsMobile : [360,1]
	});
	
});	
--></script>
