<div class="owl-carousel home-subbanner-inner">
    <?php for($k=0;$k<=3;$k++) { ?>
     <div class="owl-item">
           <div class="home-subbanner">
              <div class="home-img">
                <a href="<?php echo $modules[$k]['title'][3]; ?>"><?php echo $modules[$k]['description']; ?></a>
              </div>
              <div class="cms-desc">
                <div class="cms-desc-inner">
                   <div class="cms-button"><a href="<?php echo $modules[$k]['title'][3]; ?>"><?php echo $modules[$k]['title'][0]; ?></a></div>
                   <div class="cms-name"> <?php echo $modules[$k]['title'][1]; ?></div>
                   <div class="cms-data"><?php echo $modules[$k]['title'][2]; ?></div>
                </div>
              </div>
           </div>
       </div>
    <?php } ?>
</div>
<div class="owl-carousel home-subbanner-inner">
    <?php for($k=4;$k<=7;$k++) { ?>
     <div class="owl-item">
           <div class="home-subbanner">
              <div class="home-img">
                <a href="<?php echo $modules[$k]['title'][3]; ?>"><?php echo $modules[$k]['description']; ?></a>
              </div>
              <div class="cms-desc">
                <div class="cms-desc-inner">
                   <div class="cms-button"><a href="<?php echo $modules[$k]['title'][3]; ?>"><?php echo $modules[$k]['title'][0]; ?></a></div>
                   <div class="cms-name"> <?php echo $modules[$k]['title'][1]; ?></div>
                   <div class="cms-data"><?php echo $modules[$k]['title'][2]; ?></div>
                </div>
              </div>
           </div>
       </div>
    <?php } ?>
</div>