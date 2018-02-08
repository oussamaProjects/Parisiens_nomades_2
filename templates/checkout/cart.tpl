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
{extends file=$layout}

{block name='content'}

  <section id="main">
    <div class="row">

      <!-- Left Block: cart product informations & shpping -->
      <div class="col-xs-12 col-lg-12">

        <!-- cart products detailed -->
        <div class="cart-container">
          <div class="cart-block">
            <h1 class="h1">{l s='Your shopping cart' d='Shop.Theme.Checkout'}</h1>
          </div>
          
          {block name='cart_overview'}
            {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
          {/block}
        </div>

        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          {* {hook h='displayShoppingCartFooter'} *}
        {/block}

      </div>

      {block name='cart_summary'}
        <!-- Right Block: cart subtotal & cart total -->
        <div class="cart-grid-right col-xs-12 col-lg-12">
          <div class="cart-summary">

            {block name='hook_shopping_cart'}
              {hook h='displayShoppingCart'}
            {/block}

            {block name='cart_totals'}
              {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
            {/block}
          
          </div>
        </div>
        
        <div class="clearfix"></div>
        
        <div class="col-md-6">
          {block name='continue_shopping'}
            <a class="btn btn-black" href="{$urls.pages.index}">
              <i class="fa fa-angle-left" aria-hidden="true"></i>
              {l s='Continue shopping' d='Shop.Theme.Actions'}
            </a>
          {/block}
        </div>

        <div class="col-md-6">
          {block name='cart_actions'}
            {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
          {/block}
        </div>
      {/block}

        <div class="clearfix"></div>
<br>

        <div class="clearfix"></div>
      {block name='hook_reassurance'}
        {hook h='displayReassurance'}
      {/block}

    </div>

  </section>
{/block}
