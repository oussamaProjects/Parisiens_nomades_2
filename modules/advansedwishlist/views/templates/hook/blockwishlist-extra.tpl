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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if $logged}
    <div id="wishlist_button_block" class="buttons_bottom_block {if $issetProduct}wrap_allert{/if}">
    {if isset($wishlists) && count($wishlists) > 1}

		<select id="idWishlist">
			{foreach $wishlists as $wishlist}
				<option value="{$wishlist.id_wishlist|escape:'htmlall':'UTF-8'}">{$wishlist.name|escape:'htmlall':'UTF-8'}</option>
			{/foreach}
		</select>
		<button class="btn btn-primary" onclick="WishlistCart('wishlist_block_list', 'add', '{$id_product|intval}', $('#idCombination').val(), 1, $('#idWishlist').val()); return false;"  title="{l s='Add to wishlist' mod='advansedwishlist'}">
        {if $advansedwishlistis17 == 1}
        <i class="material-icons">favorite</i>
        {else}
        <i class="icon-heart"></i>
        {/if}
        {l s='Add' mod='advansedwishlist'}
		</button>

    {else}
        {if $issetProduct}
            <a href="#" id="wishlist_button" class="checked product-link" onclick="return false;">
            {if $advansedwishlistis17 == 1}
            <i class="material-icons">favorite</i>
            {else}
            <i class="icon-heart"></i>
            {/if}
            {l s='Added to wishlist' mod='advansedwishlist'}</a>
            <div class="allert_note">{l s='This product has been added to wishlist' mod='advansedwishlist'}</div>
        {else}
 	      <a id="wishlist_button" href="#" class="product-link"onclick="WishlistCart('wishlist_block_list', 'add', '{$id_product|intval}', $('#idCombination').val(), 1, {$id_wishlist|intval}); return false;" rel="nofollow"  title="{l s='Add to my wishlist' mod='advansedwishlist'}">
		  {if $advansedwishlistis17 == 1}
            <i class="material-icons">favorite</i>
            {else}
            <i class="icon-heart"></i>
            {/if}
        {l s='Add to wishlist' mod='advansedwishlist'}
	    </a>
        {/if}

    {/if}
        </div>
{else}
    <div class="wrap_allert">
        <div class="buttons_bottom_block"><a href="#" id="wishlist_button" onclick="return false;">
            {if $advansedwishlistis17 == 1}
                <i class="material-icons">favorite</i>
            {else}
                <i class="icon-heart"></i>
            {/if}
            {l s='Add to wishlist' mod='advansedwishlist'}</a>
        </div>

        <div class="allert_note">{l s='You must be logged' mod='advansedwishlist'}
            <p class="login_links">
                <a class="inline" href="{url entity='my-account'}">{l s='Sign in' mod='advansedwishlist'}</a> | 
                <a class="inline" href="{url entity='my-account'}">{l s='Register' mod='advansedwishlist'}</a>
            </p>
        </div>
    </div>
{/if}
