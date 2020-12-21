<?php 
		$bannerslide = 1;
		$bannercount = sizeof($banners); 	
?>

<div id="banner<?php echo $module; ?>" class="<?php if ($bannercount > $bannerslide){?> owl-carousel bannersslider<?php }else{?>singlebanner col-sm-6<?php }?>">
  
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <br />
    <br />
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <?php echo $banner['title']; ?><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('.bannersslider').owlCarousel({
	items: 1,
	autoPlay: 2000,
	singleItem: true,
	navigation: false,
	pagination: false,
	transitionStyle: 'fade'
});
--></script>
