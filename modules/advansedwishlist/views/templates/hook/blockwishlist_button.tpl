{*
* 2007-2016 PrestaShop
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
    {if isset($wishlists) && count($wishlists) > 1}
        <div class="wishlist">
            <a data-id-product="{$ws_product.id_product|intval}" data-id-product-attribute="{$ws_product.id_product_attribute|intval}" class="open_wishlist_popup product-link" href="#wishlist_popup_form"  title="{l s='Wishlist' mod='advansedwishlist'}">
                <i class="material-icons favorite">&#xE87E;</i>
            </a>
        </div>
    {else}
        {if $issetProduct}
            <div class="wishlist wrap_allert">
                <a href="#" class="checked product-link" onclick="return false;">
                    {if $advansedwishlistis17 == 1} 
                     <i class="material-icons favorite">&#xE87D;</i>
                    {else}
                    <i class="icon icon-heart"></i>
                    {/if} 
                </a>
                <div class="allert_note">{l s='This product has been added to wishlist' mod='advansedwishlist'}</div>
            </div>
        {else}
        <div class="wishlist">
            <a class="addToWishlist product-link wishlistProd_{$ws_product.id_product|intval}" 
            href="#" rel="{$ws_product.id_product|intval}" 
            onclick="WishlistCart('ws_wishlist_block_list', 'add', '{$ws_product.id_product|intval}',{$ws_product.id_product_attribute|intval}, 1, {$id_wishlist|intval}); return false;">
                {if $advansedwishlistis17 == 1}
                 <i class="material-icons favorite">&#xE87E;</i>
                {else}
                <i class="icon icon-heart"></i>
                {/if} 
            </a>
        </div>
        {/if}
    {/if}
{else}
    <div class="wrap_allert">
        <div class="buttons_bottom_block">
            <a href="#" id="wishlist_button" class="product-link" onclick="return false;">
                {if $advansedwishlistis17 == 1}
                <i class="material-icons favorite">&#xE87E;</i>
                {else}
                <i class="icon icon-heart"></i>
                {/if}
            </a>
        </div>

        <div class="allert_note">{l s='You must be logged' mod='advansedwishlist'}
            <p class="login_links">
                <a class="inline" href="{$login_link|escape:'htmlall':'UTF-8'}">{l s='Sign in' mod='advansedwishlist'}</a> | 
                <a class="inline" href="{$login_link|escape:'htmlall':'UTF-8'}">{l s='Register' mod='advansedwishlist'}</a>
            </p>
        </div>

    </div>
{/if}