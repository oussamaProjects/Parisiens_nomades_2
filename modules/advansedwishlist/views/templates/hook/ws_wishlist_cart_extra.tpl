{*
* 2007-2017 PrestaShop
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
* International Registered Trademark & Property of PrestaShop SA
*}
{if $logged}
        <a class="add_to_ws_wishlist" data-id-product="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}"
        data-ids="{$product['id_product']|escape:'htmlall':'UTF-8'}_{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}_0_{$id_address_delivery|escape:'htmlall':'UTF-8'}">
            {if $advansedwishlistis17 == 1}
            <i class="material-icons">schedule</i>
            {else}
            <i class="fa fa-clock-o"></i>
            {/if}
        </a>
{/if}