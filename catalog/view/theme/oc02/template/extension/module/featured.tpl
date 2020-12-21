
<div class="section featured">
  <div class="section-heading"><?php echo $heading_title; ?></div>
  <div class="section-block">
	<?php
		$sliderFor = 4;
		$productCount = sizeof($products);
	?>
	<?php if ($productCount >= $sliderFor): ?>
		<div class="customNavigation">
			<a class="fa prev fa-arrow-left">&nbsp;</a>
			<a class="fa next fa-arrow-right">&nbsp;</a>
		</div>
	<?php endif; ?>

	<div class="section-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>">
  <?php foreach ($products as $product) { ?>
  <div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items col-sm-3<?php }?>">
    <div class="product-thumb transition">
		<div class="image">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>

            <?php if (!$product['special']) { ?>
			 <?php } else { ?>
			<span class="sale">Sale</span>
			 <?php } ?>
		</div>

      	<div class="product-details">
			<div class="caption">

 <?php if ($review_status) { ?>
 		<div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x blank"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
 <?php } ?>

                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
				<?php /*?><p class="desc"><?php echo $product['description']; ?></p><?php */?>

				<?php if ($product['price']) { ?>
				<p class="price">
				  <?php if (!$product['special']) { ?>
				  <?php echo $product['price']; ?>
				  <?php } else { ?>
				  <span class="price-old"><?php echo $product['price']; ?></span><span class="price-new"><?php echo $product['special']; ?></span>
				  <?php } ?>
				  <?php if ($product['tax']) { ?>
				  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				  <?php } ?>
				</p>
				<?php } ?>
			</div>
 	    <div class="button-group">
				<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>
				<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
			<a class="quickview" href="<?php echo $product['quick']; ?>"><i class="fa fa-eye"></i></a>
            </div>

	  	</div>

	</div>
</div>

  <?php } ?>
</div>
  </div>
</div>

