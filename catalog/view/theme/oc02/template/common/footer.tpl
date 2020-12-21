<div class="container">
	<div class="row">
		<div class="col-md-12" style="text-align: center;">
			<div class="payments"><img src="/image/payments2.png" alt="paypapl visa amex mastercard sofortüberweisung"></div>
		</div>
	</div>
</div>

<div class="container-full footer01">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2" style="text-align: center;">
				<ul class="">
					<li><a href="/index.php?route=product/compare">Produktvergleich</a></li>
					<li><a href="/index.php?route=account/wishlist">Wunschliste</a></li>
				</ul>

				<p>“Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut
labore et dolore magna aliqua. Ut enim ad minim veniam.......“</p>
			</div>
		</div>
	</div>
</div>


<footer>
	<div id="footer" class="container">     
		<div class="col-md-12 footer__logo">
		   <img src="/image/bock.svg" alt="Waffen Bock Frankfurt" />
		</div>

		<div class="bottom-footer col-sm-12">
		  <ul class="list-unstyled">
		    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		    <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
		    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
		    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
		    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		    <li class="contact"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
		  </ul>
		</div>
		
		<div class="bottom-footer col-sm-12">
		  <ul class="list-unstyled">
		  <?php if ($informations) { ?>
		      <?php foreach ($informations as $information) { ?>
		      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
		      <?php } ?>
		      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
		      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		    </ul>
		  <?php } ?>
		  </ul>
		</div>
	</div>
</footer>

<div class="container-full footer02">
	<div class="container">
		<div class="row">
			&copy <?php echo date("Y"); ?> by Waffenbock
		</div>
	</div>
</div>


<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
<!-- This JS is for Testimonial slider -->

<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/owl-carousel/owl.transitions.css" />

<?php
/*
        <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
*/
?>
<?php

	$mail = "info@waffen-bock.de ";
	$kunde = "messer-bock.de ";

if (!isset($_COOKIE["disclaimer"])){?>

    <div id="cookie_disclaimer">
        <div>
            <?php echo $kunde; ?> benutzt Cookies, um seinen Benutzern das beste Shopping-Erlebnis zu ermöglichen. Außerdem werden teilweise auch Cookies von Diensten Dritter gesetzt. Weiterführende Informationen erhalten Sie in der Datenschutzerklärung. </span>
			<a href="/datenschutz" title="Weiterlesen …">Weiterlesen …</a>
            <a href="#" id="cookie_stop">Ich akzeptiere</a>
        </div>
    </div>
<?php }?>

	</body>
</html>
<?php
	if (!isset($_COOKIE["disclaimer"])){?>

<!-- Cookies -->
<script type="text/javascript">
$(function(){
     $('#cookie_stop').click(function(){
        $('#cookie_disclaimer').slideUp();

        var nDays = 60;
        var cookieName = "disclaimer";
        var cookieValue = "true";

        var today = new Date();
        var expire = new Date();
        expire.setTime(today.getTime() + 3600000*24*nDays);
        document.cookie = cookieName+"="+escape(cookieValue)+";expires="+expire.toGMTString()+";path=/";
     });
});
</script>
<!-- END COOKIES-->
<?php }?>


</body></html>