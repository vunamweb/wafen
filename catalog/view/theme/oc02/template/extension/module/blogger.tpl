<div class="section blog">
 <?php
    	$sliderFor = 2;
		$blogCount = sizeof($blogs);
  ?>
  <div class="section-heading"><?php echo $heading_title; ?></div>
  <div class="section-block">
    <div class="section-product <?php if ($blogCount > $sliderFor){?> owl-carousel blogcarousel <?php }else{?>grid<?php }?>" id="<?php if ($blogCount >= $sliderFor){?>blog-carousel<?php }else{?>blog-grid<?php }?>">
    <?php foreach ($blogs as $blog) { ?>
    <div class="<?php if ($blogCount > $sliderFor){?>blog-item<?php }else{?>product-items col-sm-6<?php }?>">
	<div class="product-thumb">
     <?php if ($blog['image']) { ?>

	  <div class="blog-image">
	  <img src="<?php echo $blog['image']; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
	  <div class="post-image-hover"> </div>
<div class="post_hover">
 <h4><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a> </h4>
      <div class="blog-desc"> <?php echo $blog['description']; ?> </div>
	  <div class="view-blog">
	  	<div class="write-comment"> <a href="<?php echo $blog['href']; ?>"> <?php echo $blog['total_comments']; ?> <?php echo $entry_comment; ?></a> </div>
		<div class="read-more"> <a href="<?php echo $blog['href']; ?>"> <i class="fa fa-link"></i> <?php echo $text_read_more; ?></a> </div>
	  </div>
      <div class="date-time"> <i class="fa fa-calendar"></i>  <?php echo $blog['date_added']; ?></div></div>

	  </div>

	 <?php } ?>



    </div>
	</div>
    <?php } ?>

  </div>
   <div class="buttons text-center">
      <button type="button" onclick="location='<?php echo $all_blogs; ?>';" class="btn btn-primary"><?php echo $button_all_blogs; ?></button>
    </div>
  </div>

</div>

<script type="text/javascript"><!--

$(document).ready(function(){
$('.blogcarousel').owlCarousel({
		items: 2,
		autoPlay: false,
		singleItem: false,
		navigation: true,
		pagination: false,
		itemsDesktop : [1000,2],
		itemsDesktopSmall :	[991,2],
		itemsTablet : [675,1],
		itemsMobile : [479,1]
	});
	});
--></script>
