            <?php if ($live_search_ajax_status):?>
                <script type="text/javascript"><!--
                    var live_search = {
        				selector: '#search',
						text_no_matches: '<?php echo $text_empty; ?>',
						height: '50px',
						delay: 400
					}

					$(document).ready(function() {
						var html = '';
						html += '<div id="live-search">';
						html += '	<ul>';
						html += '	</ul>';
						html += '<div class="result-text"></div>';
						html += '</div>';

						$(live_search.selector).after(html);
						$('#search input[name=\'search\']').autocomplete({
							'source': function(request, response) {
								if ($(live_search.selector + ' input[type=\'text\']').val() == '') {
									$('#live-search').css('display','none');
								}
								else{
									var html = '';
									html += '<li>';
									html +=	'<img class="loading" src="image/catalog/loading.gif" />';
									html +=	'</li>';
									$('#live-search ul').html(html);
									$('#live-search').css('display','block');
								}
								var filter_name = $(live_search.selector + ' input[type=\'text\']').val();

								if (filter_name.length>0) {
									$.ajax({
										url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(request),
										dataType: 'json',
										success: function(result) {
											var products = result.products;
											$('#live-search ul li').remove();
											$('.result-text').html('');
											if (!$.isEmptyObject(products)) {
												var show_image = <?php echo $live_search_show_image;?>;
												var show_price = <?php echo $live_search_show_price;?>;
												var show_description = <?php echo $live_search_show_description;?>;
												$('.result-text').html('<a href="<?php echo $live_search_href;?>'+filter_name+'" style="display:block;"><?php echo $text_view_all_results;?> ('+result.total+')</a>');

												$.each(products, function(index,product) {
													var html = '';

													html += '<li>';
													html += '<a href="' + product.url + '" title="' + product.name + '">';
													if(product.image && show_image){
														html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
													}
													html += '	<div class="product-name">' + product.name ;
													if(show_description){
														html += '<p>' + product.extra_info + '</p>';
													}
													html += '</div>';
													if(show_price){
														if (product.special) {
															html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
														} else {
															html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
														}
													}
													html += '<span style="clear:both"></span>';
													html += '</a>';
													html += '</li>';
													$('#live-search ul').append(html);
												});
											} else {
												var html = '';
												html += '<li style="text-align: center;height:10px;">';
												html +=	live_search.text_no_matches;
												html +=	'</li>';

												$('#live-search ul').html(html);
											}
											$('#live-search ul li').css('height',live_search.height);
											$('#live-search').css('display','block');
											return false;
										}
									});
								}
							},
							'select': function(product) {
								$('input[name=\'search\']').val(product.name);
							}
						});

						$(document).bind( "mouseup touchend", function(e){
						  var container = $('#live-search');
						  if (!container.is(e.target) && container.has(e.target).length === 0)
						  {
						    container.hide();
						  }
						});
					});
				//--></script>
			<?php endif;?>

<div class="actions">
    <button type="submit" title="Search" class="action search"  id="head-search"></button>
</div>
<div id="search">
  <input type="text" id="search-input" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
  </span>
</div>
