<?php 

/* @var $transaction PayEngine3Cw_Entity_Transaction */

?>
<h2><?php echo PayEngine3Cw_Language::_('Transactions'); ?></h2>
<table class="form">
	<tr>
		<th><?php echo PayEngine3Cw_Language::_('#') ?></th>
		<th><?php echo PayEngine3Cw_Language::_('Amount') ?></th>
		<th><?php echo PayEngine3Cw_Language::_('Created On') ?></th>
		<th><?php echo PayEngine3Cw_Language::_('Is Authorized') ?></th>
		<th><?php echo PayEngine3Cw_Language::_('Payment Method'); ?></th>
	</tr>

	<?php foreach ($transactions as $transaction): ?>
	
		<?php if (is_object($transaction->getTransactionObject())): ?>
		<tr>
			<td><?php echo $transaction->getTransactionExternalId(); ?></td>
			<td><?php echo $transaction->getTransactionObject()->getAuthorizationAmount(); ?></td>
			<td><?php echo $transaction->getCreatedOn()->format(Customweb_Core_Util_System::getDefaultDateTimeFormat());?></td>
			<td><?php echo $transaction->getTransactionObject()->isAuthorized() ? PayEngine3Cw_Language::_('Yes') : PayEngine3Cw_Language::_('No'); ?></td>
			<td><?php echo $transaction->getTransactionObject()->getPaymentMethod()->getPaymentMethodDisplayName(); ?></td>
		</tr>
		<?php else: ?>
		<tr>
			<td><?php echo $transaction->getTransactionExternalId(); ?></td>
			<td><?php echo '--'; ?></td>
			<td><?php echo $transaction->getCreatedOn()->format(Customweb_Core_Util_System::getDefaultDateTimeFormat());?></td>
			<td><?php echo PayEngine3Cw_Language::_('no'); ?></td>
			<td><?php echo '--'; ?>
		</tr>
		<?php endif;?>
	<?php endforeach;?>

</table>
<br />


