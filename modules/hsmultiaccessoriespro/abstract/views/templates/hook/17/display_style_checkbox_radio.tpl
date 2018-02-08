{**
* Multi Accessories
*
* @author    PrestaMonster
* @copyright PrestaMonster
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}
{if $group.display_style == HsMaDisplayStyle::RADIO}
{assign var=input_type value='radio'}
{assign var=flag_checked value=0}
{else}
{assign var=input_type value='checkbox'}
{/if}
{assign var=image_width value=800}
<table id="product_list_accessory_{$group.id_accessory_group|intval}" class="accessorygroup clear">
    {foreach from=$accessories_groups[$group.id_accessory_group] item=accessory key=key}
    {assign var=is_checked value=0}
    {assign var=is_disabled value=0}
    {if $accessory.is_available_buy_together == 1}
    {if $input_type === 'radio' && !$flag_checked}
    {assign var=is_checked value=1}
    {assign var=flag_checked value=1}
    {else}
    {assign var=is_checked value=0}
    {/if}
    {if $input_type === 'checkbox'}
    {assign var=is_checked value=1}
    {if $buy_main_accessory_together == HsMaProductSettingAbstract::BUY_TOGETHER_REQUIRED && $accessory.required == 1}
    {assign var=is_disabled value=1}
    {/if}
    {/if}
    {/if}
    <tr class="clearfix"> 
        <div class="accessory_info">
            <a class="accessory_name" href="{$accessory.link|escape:'htmlall':'UTF-8'}" target="{if $accessory_configuration_keys.HSMA_OPEN_ACCESSORIES_IN_NEW_TAB}_blank{/if}" title="{$hs_i18n.click_to_view_details|strip_tags:'UTF-8'}">
                <span id="has_accessory_name">{$accessory.name|escape:'htmlall':'UTF-8'}</span>
            </a>
            
            <span class="accessory_price">
                {if $accessory_configuration_keys.HSMA_SHOW_PRICE}
                {assign var=old_price value=''}
                {if isset($accessory.cart_rule) && !empty($accessory.cart_rule)}
                {assign var=old_price value='line_though'}
                {/if}
                <span class="{$old_price|escape:'htmlall':'UTF-8'} price_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$accessory.id_accessory|escape:'htmlall':'UTF-8'}"> {Tools::displayPrice($accessory.price)}</span>
                {if isset($accessory.cart_rule) && !empty($accessory.cart_rule)}
                <span class="discount_price final_price_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$accessory.id_accessory|escape:'htmlall':'UTF-8'}"> {Tools::displayPrice($accessory.final_price)}</span>
                {/if}
                {/if}
                {if $accessory_configuration_keys.HSMA_EACH_ACCESSORY_TO_BASKET && !$accessory.is_available_for_order}

                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$accessory.id_accessory}" id="product_page_product_id">
                <input type="hidden" name="id_customization" value="" id="product_customization_id">
                <a href="#" title="{$hs_i18n.add_to_cart|escape:'html':'UTF-8'}"  class='hs_multi_accessories_add_to_cart'  data-button-action="add-to-cart" data-product-group="{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$accessory.id_accessory|escape:'htmlall':'UTF-8'}" data-idproduct="{$accessory.id_accessory|intVal}" data-idProductattribute="{if $accessory.id_product_attribute <> 0}{$accessory.id_product_attribute|intVal}{else}{$accessory.default_id_product_attribute|intVal}{/if}"><span></span></a>

                {/if} 
            </span>
            
        </div>
        {if $is_product_page}
        <td width="0%">
            <input 
            data-id-product-attribute ="{if $accessory.id_product_attribute != 0}{$accessory.id_product_attribute|intVal}{else}{$accessory.default_id_product_attribute|intVal}{/if}" data-randomId ="{$accessory.random_product_accessories_id|escape:'htmlall':'UTF-8'}" {if $is_checked == 1} 
            checked="checked" data-quang="1" {if $is_disabled == 1} disabled='disabled' {/if}{/if} 
            data-required-buy-together ="{$accessory.is_available_buy_together|intval}" 
            type="{$input_type|escape:'htmlall':'UTF-8'}" 
            id='accessories_proudct_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$accessory.id_accessory|escape:'htmlall':'UTF-8'}' 
            class="accessory_item" value="{$accessory.id_accessory|escape:'htmlall':'UTF-8'}" {if $accessory.is_available_for_order} 
            disabled="disabled"{/if} {if $group.display_style == HsMaDisplayStyle::RADIO} 
            name="accessories_{$group.id_accessory_group|intval}"{/if}
            style="display: none;"/>
        </td>
        {/if}
        {if $accessory_configuration_keys.HSMA_SHOW_IMAGES}
        <td width="65px">
            <div class="hsma_images-container">
              
                <div class="product-cover">
                  {if !$accessory_configuration_keys.HSMA_APPLY_FANCYBOX_TO_IMAGE}
                  <a href="{$accessory.link|escape:'htmlall':'UTF-8'}" target="_blank" class="product_img_link" title="{$accessory.name|escape:'htmlall':'UTF-8'}">
                      {/if}
                      <img class="accessory_image hsma-js-qv-product-cover"  src="{$accessory.image|escape:'htmlall':'UTF-8'}" width="55" height="72" title="{$accessory.name|escape:'htmlall':'UTF-8'}" alt="{$accessory.name|escape:'htmlall':'UTF-8'}" itemprop="image">
                      {if !$accessory_configuration_keys.HSMA_APPLY_FANCYBOX_TO_IMAGE}
                  </a>
                  {/if}
                  {if $accessory_configuration_keys.HSMA_APPLY_FANCYBOX_TO_IMAGE}
                  <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal_{$group.id_accessory_group}_{$accessory.id_accessory}">
                      <i class="material-icons zoom-in"></i>
                  </div>
                  {/if}
              </div>
          </div>
          {if $accessory_configuration_keys.HSMA_APPLY_FANCYBOX_TO_IMAGE}
          <div class="modal fade hsma_js-product-images-modal" id="product-modal_{$group.id_accessory_group}_{$accessory.id_accessory}">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-body">
                  <figure>
                      <img class="hsma-js-modal-product-cover hsma-product-cover-modal hsma-product_img_link accessory_img_link" width="{$image_width}"  src="{$accessory.image_fancybox|escape:'htmlall':'UTF-8'}" alt="{$accessory.name|escape:'htmlall':'UTF-8'}" title="{$accessory.name|escape:'htmlall':'UTF-8'}" itemprop="image">
                      <figcaption class="image-caption">
                        {block name='product_description_short'}
                        <div id="product-description-short" itemprop="description">{$accessory.description_short nofilter}</div>
                        {/block}
                    </figcaption>
                </figure>
                <aside id="thumbnails_{$group.id_accessory_group}_{$accessory.id_accessory}" class="thumbnails js-thumbnails text-xs-center"></aside>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    {/if}
</td>
{/if}
<td>
    <form action="{$urls.pages.cart}" class="add_accessory_to_cart">
        
        {if $accessory.is_available_when_out_of_stock && $accessory_configuration_keys.HSMA_SHOW_ICON_OUT_OF_STOCK}
        <span class="warning_out_of_stock" title="{$accessory.available_later|escape:'html':'UTF-8'}"></span>
        {else if $accessory.is_available_for_order && $accessory_configuration_keys.HSMA_SHOW_ICON_OUT_OF_STOCK}
        <span class="forbidden_ordering" title="{$hs_i18n.out_of_stock|escape:'html':'UTF-8'}"></span>
        {/if} 
        <div class="hscombination">
        <div class="combination combination_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$accessory.id_accessory|escape:'htmlall':'UTF-8'}"></div>

        {if $accessory.attachments}   
            {foreach from=$accessory.attachments item=attachment} 
                <a class='attachment' data-toggle="modal" data-target="#hsattachementsModal" href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
                <div class="modal fade attachementsModal" id="hsattachementsModal" role="dialog">
                    <div class="modal-dialog"> 
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <div class="modal-title">{l s='Size guide' d='hsmultiaccessoriespro'}</div>
                        </div>
                        <div class="modal-body">
                            <img src="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}" alt="">
                        </div> 
                    </div>
                    </div>
                </div>
            {/foreach}  
        {/if} 
        </div>

        {if $accessory_configuration_keys.HSMA_SHOW_SHORT_DESCRIPTION}
        {*<a class="icon-info-sign tooltip accessories-btn" title="{l s='view detail' mod='hsmultiaccessoriespro'}">&nbsp;</a>*}
        <div class="tooltipster-content" style="display:none;">
            {if $accessory_configuration_keys.HSMA_SHOW_IMAGES}
            <img class="accessory_image" src="{$link->getImageLink($accessory.link_rewrite|escape:'htmlall':'UTF-8', $accessory.id_image, {$accessory_image_type})|escape:'html'}" width="45" height="45" title="{$accessory.name|escape:'htmlall':'UTF-8'}" title="{$hs_i18n.click_to_view_details|escape:'html':'UTF-8'}" />
            {/if}
            {$accessory.description_short|escape:'htmlall':'UTF-8'}{*HTML should be kept. PrestaShop accepts html in back office, therefore there is no result to escape here.*}
        </div>
        {/if} 
        
        {if $accessory_configuration_keys.HSMA_SHOW_CUSTOM_QUANTITY}
        <div class="accessory_info">
            <div class="control-label">{l s='Quantity' d='Shop.Theme.Catalog'}</div>
            <input class="custom_quantity" name='qty' {if !$accessory_configuration_keys.HSMA_ALLOW_CUSTOMER_CHANGE_QTY} disabled="disabled" {/if} data-custom-quantity="{$accessory.default_quantity|intval}" type="number" name="quantity" id="quantity_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$accessory.id_accessory|escape:'htmlall':'UTF-8'}" value="{$accessory.default_quantity|intval}" min='{$accessory.min_quantity|intval}'/>
        </div>
        {/if}
        
    </form>
</td>
</tr>
{/foreach}
{if $group.display_style == HsMaDisplayStyle::RADIO}
{if $buy_main_accessory_together == HsMaProductSettingAbstract::BUY_TOGETHER_NO || empty($id_products_buy_together[$group.id_accessory_group])}
<tr class="clearfix">
    <td width="10%">
        <input type="radio" name="accessories_{$group.id_accessory_group|intval}" class="accessory_item" value="0"/>
    </td>
    {if $accessory_configuration_keys.HSMA_SHOW_IMAGES}
    <td>&nbsp;</td>
    {/if}
    <td>
        <span  class="ma_none_option">{$hs_i18n.none|escape:'html':'UTF-8'}</span>
    </td>
</tr>  
{/if}
{/if}
</table>	
