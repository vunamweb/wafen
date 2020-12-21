<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="page-title"><?php echo $heading_title; ?></h1>
      <?php if ($products) { ?>
      <div class="filter-product">
        <div class="btn-grid-list">
          <div class="btn-group btn-group-sm">
              <button type="button" id="grid-view" class="btn btn-default grid" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>

            <button type="button" id="list-view" class="btn btn-default list" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
          </div>
        </div>
		<div class="compare-total"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
		<div class="filter-product-right text-right">
		 <div class="sort-filter">
			<div class="col-xs-4 col-sm-4 col-md-4 text-right">
			  <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
			</div>
			<div class="col-xs-8 col-sm-8 col-md-8 text-right">
			  <select id="input-sort" class="form-control" onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
		 </div>

		 <div class="show-filter">
			<div class="col-xs-6 col-sm-6 col-md-6 text-right">
			  <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 text-right">
			  <select id="input-limit" class="form-control" onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
				<?php if ($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
		</div>
      </div>
	  </div>
      <br />
      <div class="row product-layoutrow">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
			<?php if (!$product['special']) { ?>
				<?php } else { ?>
				<div class="saleback">
				<span class="sale">Sale</span>
				</div>
			<?php } ?>
			</div>
			<div class="product-details">
            <div class="caption">
             <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x blank"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>


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
              <p class="desc"><?php echo $product['description']; ?></p>
            </div>
            <div class="button-group">
              <button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></button>
              <button type="button" class="wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" class="compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
               <a class="quickview" href="<?php echo $product['quick']; ?>"><i class="fa fa-eye"></i></a>
            </div>
			</div>
			</div>

        </div>
        <?php } ?>
      </div>
      <div class="bottom-pagination">
			<div class="col-sm-6 text-left bottom-pagination-link"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right bottom-pagination-result"><?php echo $results; ?></div>
	   </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>