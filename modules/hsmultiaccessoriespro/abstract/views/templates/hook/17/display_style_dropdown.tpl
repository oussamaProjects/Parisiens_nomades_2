{**
* Multi Accessories
*
* @author    PrestaMonster
* @copyright PrestaMonster
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}

{if $accessory_configuration_keys.HSMA_SHOW_CUSTOM_QUANTITY}
    {assign var=has_input_quantity value='has_input_quantity'}
{else}
    {assign var=has_input_quantity value=''}
{/if}
{if $accessory_configuration_keys.HSMA_SHOW_IMAGES}
    {assign var=show_option_image value=1}
{else}   
    {assign var=show_option_image value=0}
{/if}
{assign var=flag_selected value=0}
<form action="{$urls.pages.cart}" class="add_accessory_to_cart">
<table>
    <tr>
        {if $accessory_configuration_keys.HSMA_SHOW_IMAGES}
        <td class="dropdown-image">
            <div class="accessory_img">
                <a class="accessory_image_{$group.id_accessory_group|escape:'htmlall':'UTF-8'} thickbox fancybox shown product_img_link accessory_img_link" href="">

                </a>
            </div>
        </td>
        {/if}
        <td class="dropdown-content">
            <div id="randomid-group-{$group.id_accessory_group|intval}" class="randomid-group" data-idgroup="{$group.id_accessory_group|intval}" data-randomid="0"></div>
            <div data-idgroup="{$group.id_accessory_group|intval}" class="accessory_dropdown_wrap {$has_input_quantity|escape:'htmlall':'UTF-8'}">    
    
                {if $accessory_configuration_keys.HSMA_SHOW_CUSTOM_QUANTITY}
                    <input data-custom-quantity="{$main_product_minimal_quantity|intval}" {if !$accessory_configuration_keys.HSMA_ALLOW_CUSTOMER_CHANGE_QTY}disabled="disabled"{/if} class="custom_quantity" type="number" name="quantity" id="quantity_{$group.id_accessory_group|intval}" value="{if isset($quantity_backup)}{$quantity_backup|intval}{else}{if $main_product_minimal_quantity > 1}{$main_product_minimal_quantity|intval}{else}1{/if}{/if}"/>
                {/if}
                <select id="accessories_group_{$group.id_accessory_group|escape:'html':'UTF-8'}" class="accessories_group {if $show_option_image}ddproductslick{/if}" name="accessory_{$group.id_accessory_group|escape:'html':'UTF-8'}">
                    {if $buy_main_accessory_together == HsMaProductSettingAbstract::BUY_TOGETHER_NO || empty($id_products_buy_together[$group.id_accessory_group])}
                        <option value="0">{$hs_i18n.select_accessory|escape:'htmlall':'UTF-8'}</option>
                    {/if}
                    {foreach from=$accessories_groups[$group.id_accessory_group] item=product}
                        {if $product.is_available_buy_together && !$flag_selected}
                            {assign var=flag_selected value=1}
                            {assign var=selected_dropdown value=1}
                        {else}
                            {assign var=selected_dropdown value=0}
                        {/if}
                        <option data-description="{$product.random_product_accessories_id|escape:'htmlall':'UTF-8'}" {if $show_option_image}data-imagesrc="{$product.image|escape:'htmlall':'UTF-8'}"{/if} data-stockavailable="{$product.is_stock_available|intval}" data-alloworderingwhenoutofstock="{$product.is_available_when_out_of_stock|intval}" data-id-product-attribute ="{if $product.id_product_attribute != 0}{$product.id_product_attribute|intVal}{else}{$product.default_id_product_attribute|intVal}{/if}" value="{$product.id_accessory|escape:'htmlall':'UTF-8'}" {if $selected_dropdown} selected="selected" {/if} data-randomid="{$product.random_product_accessories_id|escape:'htmlall':'UTF-8'}">
                            {$product.name|escape:'htmlall':'UTF-8'}
                            {if $accessory_configuration_keys.HSMA_SHOW_PRICE}
                                {assign var=old_price value=''}
                                {if isset($product.cart_rule) && !empty($product.cart_rule)}
                                    {assign var=old_price value='line_though'}
                                {/if}
                                |<span class="{$old_price|escape:'htmlall':'UTF-8'} price_{$group.id_accessory_group|escape:'htmlall':'UTF-8'}_{$product.id_accessory|escape:'htmlall':'UTF-8'}">
                                    {Tools::displayPrice($product.price)}
                                </span>
                                {if isset($product.cart_rule) && !empty($product.cart_rule)}
                                    |<span class="discount_price">
                                        {Tools::displayPrice($product.final_price)}
                                    </span>
                                {/if}
                            {/if}
                        </option>
                    {/foreach}
                </select>
                   <div id="combination_{$group.id_accessory_group|intval}" class="display_combination accessories_group_combination combination_{$group.id_accessory_group|intval}"></div>
            </div>
              
        </td>
    </tr>
</table>
</form>