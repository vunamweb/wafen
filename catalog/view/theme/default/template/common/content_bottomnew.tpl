<div class="col-md-3">
  <?php echo $modules[10]['description']; ?>
</div>
<div class="col-md-3">
  <?php echo $modules[11]['description']; ?>
</div>
<div class="col-md-3">
  <?php echo $modules[12]['description']; ?>
</div>
<div class="col-md-3">
  <?php echo $modules[13]['description']; ?>
</div>
<div class="clearfix"></div>
<div class="col-md-3">
  <?php echo $modules[14]['description']; ?>
</div>
<div class="col-md-3">
  <?php echo $modules[15]['description']; ?>
</div>
<div class="col-md-3">
  <?php echo $modules[16]['description']; ?>
</div>
<div class="col-md-3">
  <?php echo $modules[17]['description']; ?>
</div>

<?php //print_r($modules); die();   ?>
<div class="cms_parallax" data-source-url="/image/verlauf.jpg">
   <div class="shipping-outer container">
     <div class="shipping-inner roc">
         <?php for($i=1;$i<=3;$i++) {?>
            <div class="subtitle-part subtitle-part<?php echo $i ?> col-md-4 col-sm-4 col-xs-12">
               <div class="subtitle-part-inner">
                 <div class="subtitile">
                    <div class="subtitile1"><?php echo $modules[$i]['title']; ?></div>
                    <div class="subtitile2"><?php echo $modules[$i]['description']; ?></div>
                 </div>
               </div>
            </div>
         <?php } ?>
     </div>
   </div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12 team">
			<h3><?php echo $modules[0]['title']; ?></h3>			
			<?php echo $modules[0]['description']; ?>
			<img src="/image/catalog/interna-team/waffen-bock-team.jpg" class="img-responsive">
		</div>
	</div>
</div>

