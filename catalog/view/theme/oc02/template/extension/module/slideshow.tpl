<div class="main-slider">
<div id="spinner"></div>
<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
</div>
<script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 1,
	autoPlay: 8000,
	singleItem: true,
	transitionStyle: "fade",
	navigation: true,
	pagination: true
});
</script>
<script type="text/javascript">
	// Can also be used with $(document).ready()
	$(window).load(function() {		
	  $("#spinner").fadeOut("slow");
	});	
</script>