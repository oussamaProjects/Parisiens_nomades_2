{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="img_content">
	<img class="product-image img-responsive" src="{$product.cover.small.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}">
	<span class="product-quantity">{$product.quantity}x</span>
</div>
<div class="right_block">
	<span class="product-name">{$product.name}</span>
	<a  class="remove-from-cart"
		rel="nofollow"
		href="{$product.remove_from_cart_url}"
		data-link-action="remove-from-cart"
		title="{l s='Remove from cart' d='Shop.Theme.Actions'}"
	>
		<i class="material-icons">&#xE14C;</i>
	</a>
	<div class="attributes_content">
		{foreach from=$product.attributes item="property_value" key="property"}
		  <span><strong>{$property}</strong>: {$property_value}</span><br>
		{/foreach}
	</div>
	<span class="product-price">{$product.price}</span>
</div>