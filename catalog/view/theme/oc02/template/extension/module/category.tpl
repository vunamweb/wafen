<div style="display:block" class="sidebar section">
  <div class="section-heading"><?php echo $heading_title; ?></div>
  <div class="section-block">
    <ul class="left-category">
      
    <?php foreach ($categories as $category) { ?>
    <?php if ($category['category_id'] == $category_id) { ?>
    <li  data-target="#cat<?php echo preg_replace('/[^A-Za-z0-9\-]/', '', $category['name']); ?>">
        <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
    <?php } else { ?>
    <li   data-target="#cat<?php echo preg_replace('/[^A-Za-z0-9\-]/', '', $category['name']); ?>">
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        <?php } ?>
        <?php if ($category['children']) { ?>
        <span><i class="fa fa-plus menu-level2"></i></span>
        <ul class="collapse" id="cat<?php echo preg_replace('/[^A-Za-z0-9\-]/', '', $category['name']); ?>">
            <?php foreach ($category['children'] as $child) { ?>
            
                <?php if ($child['category_id'] == $category_1_id) { ?>
                  <li   data-target="#cat<?php echo preg_replace('/[^A-Za-z0-9\-]/', '', $child['name']); ?>">
                    <a class="active" href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
                  <?php } else { ?>
                  <li  data-target="#cat<?php echo preg_replace('/[^A-Za-z0-9\-]/', '', $child['name']); ?>">
                    <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                <?php } ?>
				<?php if ($child['children']) { ?>
				<span><i class="fa fa-plus menu-level2"></i></span>
                
				<ul class="collapse" id="cat<?php echo preg_replace('/[^A-Za-z0-9\-]/', '', $child['name']); ?>">
					<?php foreach ($child['children'] as $child_2) { ?>
					<li>
						<?php if ($child_2['category_id'] == $child_id) { ?>
						<a href="<?php echo $child_2['href']; ?>" class="active"><?php echo $child_2['name']; ?></a>
						<?php } else { ?>
						<a href="<?php echo $child_2['href']; ?>"><?php echo $child_2['name']; ?></a>
						<?php } ?>
					</li>
					<?php } ?>
				</ul>
				<?php } ?>
            </li>
            <?php } ?>
        </ul>
        <?php } ?>
    </li>
    <?php } ?>
    </ul>	
    

  </div>
</div>
