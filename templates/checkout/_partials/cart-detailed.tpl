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
{block name='cart_detailed_product'}
  <div class="cart-overview js-cart" data-refresh-url="{url entity='cart' params=['ajax' => true, 'action' => 'refresh']}">
    {if $cart.products}

    <ul class="cart-items">

      <li class="cart-item cart-item-header">
        <div class="product-line-grid"> 
          <!--  product top content: image-->
          <div class="product-line-grid-image"> 
            <span>{l s='Produit' d='Shop.Theme.Checkout'}</span>
          </div>

          <!--  product top content: description -->
          <div class="product-line-grid-description"> 
          </div>

          <!--  product top content: prix -->
          <div class="product-line-grid-prix"> 
            <span>{l s='Prix untaire' d='Shop.Theme.Checkout'}</span>
          </div> 

          <!--  product top content: actions -->
          <div class="product-line-grid-actions product-line-actions"> 
            <div class="qty"> 
              <span>{l s='Quantité' d='Shop.Theme.Checkout'}</span>
            </div>
            <div class="price"> 
              <span>{l s='Prix total' d='Shop.Theme.Checkout'}</span>
            </div> 
            <div class="delete"> 
            </div> 
          </div>

          <div class="clearfix"></div>
        </div>
      </li> 

      {foreach from=$cart.products item=product}
        <li class="cart-item cart-item-body">
          {block name='cart_detailed_product_line'}
            {include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}
          {/block}
        </li>
        {if $product.customizations|count >1}<hr>{/if}
      {/foreach}
    </ul>
    {else}
      <span class="no-items">{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}</span>
    {/if}
  </div>
{/block}
