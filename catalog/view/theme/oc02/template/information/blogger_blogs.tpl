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
    <div id="content" class="<?php echo $class; ?> all-blog"><?php echo $content_top; ?>
      <h1><?php echo $text_blogs; ?></h1>
      <?php if ($blogs) { ?>
      <?php foreach ($blogs as $blog) { ?>
      <div class="panel-default">
        <h4><?php echo $blog['name']; ?></h4>
        <?php if ($blog['blog_data']) { ?>
        <?php foreach ($blog['blog_data'] as $topic) { ?>
        <div class="panel panel-default">
          <div class="panel-body">

    	   <?php if ($topic['image']) { ?>
		   <div class="blog-left-content">
		  <div class="blog-image">
	  		<img src="<?php echo $topic['image']; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
			<div class="post-image-hover"> </div>
<p class="post_hover"><a rel="group" class="icon zoom fancybox" title="Click to view Full Image " href="<?php echo $topic['image']; ?>"><i class="fa fa-search-plus"></i> </a><a class="icon readmore_link" title="Click to view Read More " href="<?php echo $topic['href']; ?>"><i class="fa fa-link"></i></a></p>

	  	  </div>
		  </div>
		  <?php } ?>
            <h3><a href="<?php echo $topic['href']; ?>"><?php echo $topic['title']; ?></a></h3>
           <div class="blog-date"> <i class="fa fa-calendar"></i>  <?php echo $topic['date_added']; ?></div><div class="dash"> |</div>
			<div class="write-comment"> <a href="<?php echo $topic['href']; ?>"><?php echo $topic['total_comments']; ?> <?php echo $entry_comment; ?></a> </div>


          <div class="blog-desc"><?php echo $topic['description']; ?> </div>
          <div class="read-more"> <a href="<?php echo $topic['href']; ?>"> <?php echo $text_read_more; ?></a> </div>
          </div>
        </div>
        <?php } ?>
        <?php } else { ?>
        <div class="panel-body text-center"><?php echo $text_no_blogs; ?></div>
        <?php } ?>
        </div>
        <?php } ?>
      <?php } else { ?>
      <div class="panel-body text-center"><?php echo $text_no_blogs; ?></div>
      <?php } ?>
    <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
