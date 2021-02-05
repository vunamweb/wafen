<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
/* JS is for Newsletter popup */
function popupnewsletter(){
    //alert($(window).width());
    if ($(window).width() >= 810)
    {
         $(".common-home #subscribe-me").modal('show');
         $(".xout").click(function(){ $(".common-home #subscribe-me").modal('hide');});
             var modal = document.getElementById('subscribe-me');
            window.onclick = function(event) {
            if (event.target == modal) {
        		modal.style.display = "none";
			}

			}
	}else{
		$(".common-home #subscribe-me").modal('hide');
	}
}

$(window).ready(function(){popupnewsletter();});</script>

<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
<?php /*
<meta property="og:url"                content="http://www.nytimes.com/2015/02/19/arts/international/when-great-minds-dont-think-alike.html" />
<meta property="og:type"               content="article" />
<meta property="og:title"              content="When Great Minds Don’t Think Alike" />
<meta property="og:description"        content="How much does culture influence creative thinking?" />
<meta property="og:image"              content="http://static01.nyt.com/images/2015/02/19/arts/international/19iht-btnumbers19A/19iht-btnumbers19A-facebookJumbo-v2.jpg" />
*/ ?>

<script type="text/javascript" src="catalog/view/javascript/template_js/template.js"></script>
<script type="text/javascript" src="catalog/view/javascript/template_js/YouTubePopUp.jquery.js"></script>
<script type="text/javascript" src="catalog/view/javascript/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery.fancybox.js"></script>
<script type="text/javascript" src="catalog/view/javascript/parallax.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery.elevatezoom.min.js"></script>
<script type="text/javascript">
        jQuery(function(){
			jQuery(".video").YouTubePopUp();
		});
</script>

<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/stylesheet.css" rel="stylesheet" />
<link href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/YouTubePopUp.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/bootstrap.min.css" />
<link href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/live_search.css" rel="stylesheet">
<?php if($direction=='rtl'){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/rtl.css">
<?php } ?>
<link href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/jquery.fancybox.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script>
$(document).ready(function(){
	$(".quickview").fancybox({
		type: 		'iframe'
	});


	$(".fancybox").fancybox();

});
</script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>


<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<?php if ($column_left && $column_right) { ?>
<?php $layoutclass = 'layout-3'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php if ($column_left){ ?>
<?php $layoutclass = 'layout-2 left-col'; ?>
<?php } elseif ($column_right) { ?>
<?php $layoutclass = 'layout-2 right-col'; ?>
<?php } ?>
<?php } else { ?>
<?php $layoutclass = 'layout-1'; ?>
<?php } ?>

<body class="<?php echo $class;echo " " ;echo $layoutclass; ?>">


<nav id="top">
  <div class="container">
    <div class="row">
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <span class="responsive-bar"><i class="fa fa-bars"></i></span>
      <div class="col-md-2 col-sm-3 col-xs-5 header-logo">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <a href="<?php echo $home; ?>" class="header__logo"><?php echo $name; ?></a>
          <?php } ?>
        </div>
      </div>
     <div class="header-middle col-md-8 col-sm-3 col-xs-3">

            <!-- ======= Menu Code START ========= -->
            <?php if ($categories) { ?>
            <!-- Opencart 3 level Category Menu-->
            <div id="menu" class="navbar">
              <div class="nav-responsive">
                <ul class="nav navbar-nav main-navigation">
                  <!-- 			<li class="main_cat"> <a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>				-->
                  <?php foreach ($categories as $category) { ?>
	                  <?php if ($category['children']) { ?>
					  	<li class="main_cat dropdown"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>

                    <div class="dropdown-menu megamenu column<?php echo $category['column']; ?>">
                      <div class="dropdown-inner">

                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <ul class="list-unstyled childs_1">
                          <?php foreach ($children as $child) { ?>
                          <!-- 2 Level Sub Categories START -->
                          <?php if ($child['childs']) { ?>
                          <li class="dropdown"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                            <div class="dropdown-menu">
                              <div class="dropdown-inner">
                                <?php foreach (array_chunk($child['childs'], ceil(count($child['childs']) / $child['column'])) as $childs_col) { ?>
                                <ul class="list-unstyled childs_2">
                                  <?php foreach ($childs_col as $childs_2) { ?>
                                  <li><a href="<?php echo $childs_2['href']; ?>"><?php echo $childs_2['name']; ?></a></li>
                                  <?php } ?>
                                </ul>
                                <?php } ?>
                              </div>
                            </div>
                          </li>
                          <?php } else { ?>
                          <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                          <?php } ?>
                          <!-- 2 Level Sub Categories END -->
                          <?php } ?>
                        </ul>
                        <?php } ?>
                      </div>

                      <?php if ($category['thumb']) { ?>
                    <img src="<?php echo $category['thumb']; ?>" alt="" title="" class="img-thumbnail" />
                     <?php } ?>
                      </div>
                  </li>
                  <?php } else { ?>
                  <li class="main_cat"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>

                    <div class="dropdown-menu">
                  	  <?php if ($category['thumb']) { ?>
				  	  		<img src="<?php echo $category['thumb']; ?>" alt="" title="" class="img-thumbnail" />
				  	  	<?php } ?>
                     </div>

                  </li>

                  <?php } ?>
                  <?php } ?>

                  <li class="main_cat" style="display:nonez"> <a href="/messer-hersteller">HERSTELLER</a></li>

                </ul>
              </div>
            </div>
            <?php } ?>

            <!-- Opencart 3 level Category Menu-->



          <!-- ======= Menu Code END ========= -->
<!-- <?php if ($category['thumb']) { ?>
                    <img src="<?php echo $category['thumb']; ?>" alt="" title="" class="img-thumbnail" />
                     <?php } ?>-->


      <div class="header-middle-outer closetoggle">
     <ul class="nav nav-tabs">
             <li class="active"><a href="#responsive-menu" data-toggle="tab">Menu</a></li>
            <li><a href="#tab-account" data-toggle="tab">Account</a></li>
			 <!--<li><a href="#tab-settings" data-toggle="tab">Settings</a></li>-->
          </ul>
           <div class="tab-content">

      <div id="responsive-menu" class="nav-container1 nav-responsive tab-pane active navbar">

    <div class="navbar-collapse navbar-ex1-collapse collapse in">
              <ul class="nav navbar-nav">
                <?php foreach ($categories as $category) { ?>
               <li class="collapsed" data-toggle="collapse" data-target="#<?php echo str_replace(' ', '', $category['name']); ?>"><a href="javascript:void(0)"><?php echo $category['name']; ?></a>
                  <?php if ($category['children']) { ?>
                  <?php for ($i = 0; $i < count($category['children']);) { ?>
                  <span><i class="fa fa-plus"></i></span>
                  <ul class="menu-dropdown collapse" id="<?php echo str_replace(' ', '', $category['name']); ?>">
                    <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                    <?php for (; $i < count($category['children']); $i++) { ?>
                    <?php if (isset($category['children'][$i])) { ?>
                    <li>
                      <?php if(count($category['children'][$i]['childs'])>0){ ?>
                      <a href="<?php echo $category['children'][$i]['href']; ?>" class="activSub" ><?php echo $category['children'][$i]['name'];?></a>
                      <?php } else { ?>
                      <a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                      <?php } ?>
                      <?php if ($category['children'][$i]['childs']) { ?>
                      <ul class="col<?php echo $j; ?>">
                        <?php for ($wi = 0; $wi < count($category['children'][$i]['childs']); $wi++) { ?>
                        <li><a href="<?php echo $category['children'][$i]['childs'][$wi]['href']; ?>"  ><?php echo $category['children'][$i]['childs'][$wi]['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                      <?php } ?>
                    </li>
                    <?php } ?>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                  <?php } ?>
                </li>
                <?php } ?>

              </ul>
            </div>
            </div>
      <div class="header_links tab-pane" id="tab-account">


            </div>
             <div class="settings tab-pane" id="tab-settings">

            </div>
       </div>
            </div>
            </div>
      <div class="header-right col-md-2 col-sm-6 col-xs-4">
        <div class="pull-right header-cart"><?php echo $cart; ?></div>

        <div class="header_menu_dropdown pull-right">
          <div class="haeder_icon">
            <div class="haeder_icon_image">&nbsp;</div>
          </div>
          <div id="top-links" class="nav">
            <ul class="list-inline">
              <li class="dropdown myaccount"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
                <ul class="dropdown-menu dropdown-menu-right myaccount-menu">
                  <?php if ($logged) { ?>
                  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                  <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                  <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                  <?php } else { ?>
                  <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                  <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                  <?php } ?>
                  <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                  <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"> <?php echo $text_checkout; ?></a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>

        <div class="header-search pull-right"><?php echo $search; ?> </div>

      </div>
    </div>
  </div>
</header>
<div class="content-top-breadcum">
</div>
<?php if ($categories) { ?>
<div class="btn btn-default seemore"><a href="<?php echo $category['href']; ?>">Weitere Produkte</a></div>
<?php } ?>
