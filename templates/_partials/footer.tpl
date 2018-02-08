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

{if $page.page_name == 'index'}
  <div id="manufacturers">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-titre">{l s='Our marque' mod='blockmanufacturer'}</div>
            <div id="manufacturers_slider" class="custom-carousel owl-carousel owl-theme owl-loaded">
              {foreach from=$manufacturers item=manufacturer name=manufacturer_list}
                <div class="manufacturer">
                  <a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)}" title="{l s='More about' mod='blockmanufacturer'} {$manufacturer.name}">
                    <img src="{$urls.img_manu_url}{$manufacturer.id_manufacturer}.jpg" alt="{$manufacturer.name|truncate:60:'...'|escape:'htmlall':'UTF-8'}" />
                  </a>
              </div>
              {/foreach}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
{/if}
 
{block name='hook_footer_before'}
  {hook h='displayFooterBefore'}
{/block} 

<div class="footer-container">
  <div class="container">
    <div class="row">
      {block name='hook_footer'}
        {hook h='displayFooter'}
      {/block}
    </div>
    <div class="row">
      {block name='hook_footer_after'}
        {hook h='displayFooterAfter'}
      {/block}
    </div>
    
  </div>
 
  <div class="footer-bas"> 
    {block name='copyright_link'}
      <span>
       {l s='%copyright% %year% Parisiens Nomades Tous droits réservés' sprintf=['%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'} 
      </span>
      <span class="sprt"> - </span>
      <a class="_blank" href="{url entity='cms' id=2 }">
        {l s='Mentions légales' d='Shop.Theme.Global'}
      </a>
      <span class="sprt"> - </span>
      <a class="_blank" href="https://comenscene.com/" target="_blank" rel="nofollow">
        {l s='Réalisation Com en Scène' d='Shop.Theme.Global'} 
      </a> 
    {/block} 
  </div> 
</div>
