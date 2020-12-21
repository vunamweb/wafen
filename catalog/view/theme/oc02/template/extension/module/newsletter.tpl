<script type="text/javascript">
    function validatemail() {
        var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (!pattern.test($('#email').val())) {
            alert("Please Enter Valid Email");
            return false;
        } else {
            $.ajax({
                url: 'index.php?route=extension/module/newsletter/jsonnewsletter',
                type: 'post',
                data: 'email=' + $('#email').val(),
                dataType: 'json',
                success: function(json) {
                    $('.alert').remove();
                    if (json.fail) {
                        $('#content').parent().before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json.fail + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    } else {
                        $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json.success + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
                }
            });
            return false;
        }
    }
</script>
    <script type="text/javascript">
    function validatpopupemail() {
        var pattern1 = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (!pattern1.test($('#email-popup').val())) {
            alert("Please Enter Valid Email");
            return false;
        } else {
            $.ajax({
                url: 'index.php?route=extension/module/newsletter/jsonnewsletter',
                type: 'post',
                data: 'email=' + $('#email-popup').val(),
                dataType: 'json',
                success: function(json) {
                    $('.alert').remove();
                    if (json.fail) {
                        $('#content').parent().before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json.fail + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    } else {
                        $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json.success + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
					$(".common-home #subscribe-me").modal('hide');
                }
            });
            return false;
        }
    }
</script>

<!--
<div id="subscribe-mez" class="modal animated fade" role="dialog" data-keyboard="true" tabindex="-1">
<div class="newsletter-popup">
<div class="newsletter-popup-static newsletter-popup-top">
<div class="popup-text">
<div class="popup-title">20% <span>off</span></div>
<div class="popup-desc">
<div>Sign up and get 20% off your</div>
<div>Next Order</div>
</div>
</div>

<a class="xout">x</a>
<form  onsubmit="return validatpopupemail();" method="post">
    <div class="form-group required">
     <input type="email" name="email-popup" id="email-popup" placeholder="<?php echo $newsletter_placeholder; ?>" class="form-control input-lg" required />
    <button type="submit" class="btn btn-default btn-lg"><?php echo $subscribe; ?></button>
    </div>
</form>

</div></div>
</div>


<div class="newsletters">
<h4><?php echo $newsletter_title; ?></h4>
<h5 class="collapsed" data-target="#dropdown-news" data-toggle="collapse"><?php echo $newsletter_title; ?> <span class="icon"></span></h5>
<ul class="collapse" id="dropdown-news">
<li>
<form onsubmit="return validatemail();" method="post">
		<div class="form-group required">
            <div class="col-sm-12">
              <input type="email" name="email" id="email" placeholder="<?php echo $newsletter_placeholder; ?>" class="form-control input-lg" required />
			  <button type="submit" class="btn btn-default btn-lg"><?php echo $subscribe; ?></button>
        </div>
		</div>
		</form>
        </li>
        </ul>
</div>
-->