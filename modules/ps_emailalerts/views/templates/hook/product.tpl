{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

<div class="js-mailalert mailalert" data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'add']}">
	{if isset($email) AND $email}
		<p>{l s='Notify me when available' d='Modules.Mailalerts.Shop'}</p>
		<input type="email" placeholder="{l s='Your e-mail' d='Modules.Mailalerts.Shop'}"/> 
		<a href="#" rel="nofollow" onclick="return addNotification();" class="envoyer">{l s='OK' d='Modules.Mailalerts.Shop'}</a>
	{else}
		<a href="#" rel="nofollow" onclick="return addNotification();"><p>{l s='Notify me when available' d='Modules.Mailalerts.Shop'}</p></a>
	{/if}
	<input type="hidden" value="{$id_product}"/>
	<span style="display:none;"></span>
	<input type="hidden" value="{$id_product_attribute}"/>
</div>