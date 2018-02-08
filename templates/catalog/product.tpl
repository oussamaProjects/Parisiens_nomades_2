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

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
  <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
  <meta property="product:price:amount" content="{$product.price_amount}">
  <meta property="product:price:currency" content="{$currency.iso_code}">
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='breadcrumb'}   {/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row">

      <div class="col-md-5">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              {block name='product_flags'}
                <ul class="product-flags">
                  {foreach from=$product.flags item=flag}
                    <li class="product-flag {$flag.type}">{$flag.label}</li>
                  {/foreach}
                </ul>
              {/block}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
      </div>

      <div class="col-md-7">

        {block name='page_header_container'}
          {block name='page_header'}
            <h1 class="detail-product-title" itemprop="name">
              {block name='page_title'}
              {if $product.combname && isset($product.combname)}
                {$product.combname|strip_tags}
              {else}
                {$product.name}
              {/if}
              {/block}
            </h1>
            {if $product.reference}
              <div class="product-ref-title" >{l s='Ref' mod='product'}: {$product.reference}</div>
            {/if}
            <div class="product-category-title" >{block name='page_title'}{$product.category_name}{/block}</div>
          {/block}
        {/block}

        {block name='product_prices'}
          {include file='catalog/_partials/product-prices.tpl'}
        {/block}

        <div class="product-information">
          {block name='product_description_short'}
            <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
          {/block}

          {if $product.is_customizable && count($product.customizations.fields)}
            {block name='product_customization'}
              {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
            {/block}
          {/if}

          <div class="product-actions">
            {block name='product_buy'}
              <div id="accessory_info">
                <span class="accessory_name">
                  {$product.name}
                </span>
                {if $product.show_price}
                  <span class="accessory_prices">
                    {block name='product_discount'}
                      {if $product.has_discount}
                        <span class="product-discount">
                          {hook h='displayProductPriceBlock' product=$product type="old_price"}
                          <span class="regular-price">{$product.regular_price}</span>
                        </span>
                      {/if}
                    {/block}

                    {block name='product_price'}
                      <span
                      class="accessory-price {if $product.has_discount}has-discount{/if}"
                      itemprop="offers"
                      itemscope
                      itemtype="https://schema.org/Offer"
                      >
                        <link itemprop="availability" href="https://schema.org/InStock"/>
                        <meta itemprop="priceCurrency" content="{$currency.iso_code}">

                        <span class="accessory-price">
                          <span itemprop="price" content="{$product.price_amount}">{$product.price}</span>
                        </span>
                      </span>
                    {/block}
                  </span>
                {/if}
              </div>

              <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                {block name='product_variants'}
                  {include file='catalog/_partials/product-variants.tpl'}
                {/block}

                {block name='product_pack'}
                  {if $packItems}
                    <section class="product-pack">
                      <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                      {foreach from=$packItems item="product_pack"}
                        {block name='product_miniature'}
                          {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                        {/block}
                      {/foreach}
                  </section>
                  {/if}
                {/block}

                {block name='product_discounts'}
                  {include file='catalog/_partials/product-discounts.tpl'}
                {/block}

                {block name='product_out_of_stock'}
                  <div class="product-out-of-stock">
                    {hook h='actionProductOutOfStock' product=$product}
                  </div>
                {/block}

                {block name='product_add_to_cart'}
                      {include file='catalog/_partials/product-add-to-cart.tpl'}
                {/block}

                {block name='product_additional_info'}
                  {include file='catalog/_partials/product-additional-info.tpl'}
                {/block}

                {block name='product_refresh'}
                  <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}">
                {/block}
              </form>
            {/block}
          </div>

          {block name='hook_display_reassurance'}
            {hook h='displayReassurance'}
          {/block}
        </div>
      </div>

      <div class="col-md-12">
        <div class="product-information">

          {block name='product_tabs'}

            <ul class="nav" style="display: none;" >
              {if $product.description}
                <li class="nav-item">
                    <a
                      class="nav-link{if $product.description} active{/if}"
                      data-toggle="tab"
                      href="#description"
                      role="tab"
                      aria-controls="description"
                      {if $product.description} aria-selected="true"{/if}></a>
                </li>
              {/if}
              <li class="nav-item">
                <a
                  class="nav-link{if !$product.description} active{/if}"
                  data-toggle="tab"
                  href="#product-details"
                  role="tab"
                  aria-controls="product-details"
                  {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
              </li>
              {foreach from=$product.extraContent item=extra key=extraKey}
                <li class="nav-item">
                  <a
                    class="nav-link"
                    data-toggle="tab"
                    href="#extra-{$extraKey}"
                    role="tab"
                    aria-controls="extra-{$extraKey}">{$extra.title}</a>
                </li>
              {/foreach}
            </ul>

              {block name='product_details'}
                {include file='catalog/_partials/product-details.tpl'}
              {/block}

              <div class="description product-information-content" id="description">
                {block name='product_description'}

                  {if $product.description}

                    <div class="title">{l s='Description' d='Shop.Theme.Catalog'}</div>
                    <div class="product-description">{$product.description nofilter}</div>

                  {/if}

                {/block}
              </div>



              {foreach from=$product.extraContent item=extra key=extraKey}
                <div class="{$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                  {$extra.content nofilter}
                </div>
              {/foreach}
          {/block}
        </div>
      </div>

    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <div class="products-section-title">{l s='Product accessories' d='Shop.Theme.Catalog'}</div>
          <div class="products">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
