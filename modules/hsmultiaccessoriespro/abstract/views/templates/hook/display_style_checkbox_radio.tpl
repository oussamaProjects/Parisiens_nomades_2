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

<table id="product_list_accessory_{$group.id_accessory_group|intval}" class="accessorygroup clear">
    {foreach from=$accessories_groups[$group.id_accessory_group] item=product key=key}
    {assign var=is_checked value=0}
    {assign var=is_disabled value=0}
    {if $product.is_available_buy_together == 1}
    {if $input_type === 'radio' && !$flag_checked}
    {assign var=is_checked value=1}
    {assign var=flag_checked value=1}
    {else}
    {assign var=is_checked value=0}
    {/if}
    {if $input_type === 'checkbox'}
    {assign var=is_checked value=1}
    {if $buy_main_accessory_together == HsMaProductSettingAbstract::BUY_TOGETHER_REQUIRED && $product.required == 1}
    {assign var=is_disabled value=1}
    {/if}
    {/if}
    {/if}
    <tr class="clearfix"> 
        {if $is_product_page}
        <td width="10%">
            <input data-id-product-attribute ="{if $product.id_product_attribute != 0}{$product.id_product_attribute|intVal}{else}{$product.default_id_product_attribute|intVal}{/if}" data-randomId ="{$product.random_product_accessories_id|escape:'htmlall':'UTF-8'}" {if $is_checked == 1} checked="checked" data-quang="1" {if $is_disabled == 1} disabled='disabled' {/if}{/if} data-required-buy-together ="{$product.is_available_buy_together|intval}" type="{$input_type|escape:'htmlall':'UTF-8'}" id='accessories_proudct_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$product.id_accessory|escape:'htmlall':'UTF-8'}' class="accessory_item" value="{$product.id_accessory|escape:'htmlall':'UTF-8'}" {if $product.is_available_for_order} disabled="disabled"{/if} {if $group.display_style == HsMaDisplayStyle::RADIO}name="accessories_{$group.id_accessory_group|intval}"{/if}/>
        </td>
        {/if}
        {if $accessory_configuration_keys.HSMA_SHOW_IMAGES}
        <td>
            {if $accessory_configuration_keys.HSMA_APPLY_FANCYBOX_TO_IMAGE}
            <a href="{$product.image_fancybox|escape:'htmlall':'UTF-8'}"  class="thickbox fancybox shown product_img_link accessory_img_link" title="{$product.name|escape:'htmlall':'UTF-8'}">
                {else}
                <a href="{$product.link|escape:'htmlall':'UTF-8'}" target="_blank" class="product_img_link" title="{$product.name|escape:'htmlall':'UTF-8'}">
                    {/if}
                    <img class="accessory_image" src="{$product.image|escape:'htmlall':'UTF-8'}" width="45" height="45" title="{$product.name|escape:'htmlall':'UTF-8'}" alt="{$product.name|escape:'htmlall':'UTF-8'}" />
                </a>
            </td>
            {/if}
            <td>
                <a class="ma_accessory_name" href="{$product.link|escape:'htmlall':'UTF-8'}" target="{if $accessory_configuration_keys.HSMA_OPEN_ACCESSORIES_IN_NEW_TAB}_blank{/if}" title="{$hs_i18n.click_to_view_details|strip_tags:'UTF-8'}">
                    {$product.name|escape:'htmlall':'UTF-8'}
                </a>
                <br />
                
                {if $product.is_available_when_out_of_stock && $accessory_configuration_keys.HSMA_SHOW_ICON_OUT_OF_STOCK}
                <span class="warning_out_of_stock" title="{$product.available_later|escape:'html':'UTF-8'}"></span>
                {else if $product.is_available_for_order && $accessory_configuration_keys.HSMA_SHOW_ICON_OUT_OF_STOCK}
                <span class="forbidden_ordering" title="{$hs_i18n.out_of_stock|escape:'html':'UTF-8'}"></span>
                {/if}
                {if $accessory_configuration_keys.HSMA_SHOW_CUSTOM_QUANTITY}
                <input class="custom_quantity" {if !$accessory_configuration_keys.HSMA_ALLOW_CUSTOMER_CHANGE_QTY} disabled="disabled" {/if} data-custom-quantity="{$product.default_quantity|intval}" type="number" name="quantity" id="quantity_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$product.id_accessory|escape:'htmlall':'UTF-8'}" value="{$product.default_quantity|intval}"/>
                {/if}
                <span class="combination_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$product.id_accessory|escape:'htmlall':'UTF-8'}"></span>
                {if $accessory_configuration_keys.HSMA_SHOW_SHORT_DESCRIPTION}
                {*<a class="icon-info-sign tooltip accessories-btn" title="{l s='view detail' mod='hsmultiaccessoriespro'}">&nbsp;</a>*}
                <div class="tooltipster-content" style="display:none;">
                    {if $accessory_configuration_keys.HSMA_SHOW_IMAGES}
                    <img class="accessory_image" src="{$link->getImageLink($product.link_rewrite|escape:'htmlall':'UTF-8', $product.id_image, {$accessory_image_type})|escape:'html'}" width="45" height="45" title="{$product.name|escape:'htmlall':'UTF-8'}" title="{$hs_i18n.click_to_view_details|escape:'html':'UTF-8'}" />
                    {/if}
                    {$product.description_short|escape:'htmlall':'UTF-8'}{*HTML should be kept. PrestaShop accepts html in back office, therefore there is no result to escape here.*}
                </div>
                {/if} 
                <span class="accessory_price">
                    {if $accessory_configuration_keys.HSMA_SHOW_PRICE}
                    {assign var=old_price value=''}
                    {if isset($product.cart_rule) && !empty($product.cart_rule)}
                    {assign var=old_price value='line_though'}
                    {/if}
                    <span class="{$old_price|escape:'htmlall':'UTF-8'} price_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$product.id_accessory|escape:'htmlall':'UTF-8'}"> {convertPrice price=$product.price}</span>
                    {if isset($product.cart_rule) && !empty($product.cart_rule)}
                    <span class="discount_price final_price_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$product.id_accessory|escape:'htmlall':'UTF-8'}"> {convertPrice price=$product.final_price}</span>
                    {/if}
                    {/if}
                    {if $accessory_configuration_keys.HSMA_EACH_ACCESSORY_TO_BASKET && !$product.is_available_for_order}
                    <a href="{if $utilize_block_cart_ajax}javascript:void(0);{else}{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_accessory|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}{/if}" title="{$hs_i18n.add_to_cart|escape:'html':'UTF-8'}"  class='hs_multi_accessories_add_to_cart' data-product-group="{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$product.id_accessory|escape:'htmlall':'UTF-8'}" data-idproduct="{$product.id_accessory|intVal}" data-idProductattribute="{if $product.id_product_attribute <> 0}{$product.id_product_attribute|intVal}{else}{$product.default_id_product_attribute|intVal}{/if}"><span></span></a>
                    {/if}
                    
                </span>
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
