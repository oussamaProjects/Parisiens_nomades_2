{**
* Multi Accessories
*
* @author    PrestaMonster
* @copyright PrestaMonster
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}

<div id="multiAccessoriesTab">
{if !empty($accessory_groups) && !empty($accessories_groups)}
    <script type="text/javascript">
        changeMainPrice = {$change_main_price|escape:'htmlall':'UTF-8'};
        $(document).ready(function () {
            priceTable = new PriceTable({
                products: {$accessories_table_price|escape:'quotes':'UTF-8'},
                randomMainProductId: '{$random_main_product_id|escape:'htmlall':'UTF-8'}',
                changeMainPrice: changeMainPrice,
                subTotal: '{$sub_total|escape:'htmlall':'UTF-8'}',
                showTablePrice: {$show_table_price|escape:'htmlall':'UTF-8'},
                showCombination: {$show_combination|intval},
                showOptionImage: {$accessory_configuration_keys.HSMA_SHOW_IMAGES|escape:'htmlall':'UTF-8'},
                warningOutOfStock: '{$hs_i18n.accessory_is_out_of_stock|escape:'htmlall':'UTF-8'}',
                warningNotEnoughProduct: '{$hs_i18n.there_is_not_enough_product_in_stock|escape:'htmlall':'UTF-8'}',
                warningCustomQuantity: '{$hs_i18n.quantity_must_be_greater_than_or_equal_to_minimum_quantity|escape:'htmlall':'UTF-8'}'
            });
            priceTable.onLoad();
            window.adminProductSetting = new AdminProductSetting({});            
        });
    </script>
    {if isset($is_prestashop_16)}
        {if !empty($tab_name)}<h3 class="page-product-heading"> {$tab_name|escape:'htmlall':'UTF-8'}</h3>{/if}
    {/if}    
    <div class="accessories_table_price">
        <table class="accessories_table_price_content">
        </table>
    </div>
    <div id="group_accessories">
        {if empty($tab_name)}<h3>{if !empty($accessory_block_title)} {$accessory_block_title|escape:'htmlall':'UTF-8'} {/if}</h3>{/if}
        {assign var=is_expand value=0}
        {foreach from=$accessory_groups item=group}
            {if isset($accessories_groups[$group.id_accessory_group]) &&  !empty($accessories_groups[$group.id_accessory_group])}
                <div class="option-row clearfix">
                    <h4>
                        {assign var=class_expand value="icon_expand"}
                        {assign var=class_collapse value="icon_collapse"}
                        {if $collapse_expand_groups !== HsMaDisplayStyle::DISPLAY_GROUPS_NONE}
                            {if $collapse_expand_groups == HsMaDisplayStyle::DISPLAY_GROUPS_EXPAND}
                                {assign var=class_expand value="icon_expand"}
                                {assign var=class_collapse value=""}
                            {elseif $collapse_expand_groups == HsMaDisplayStyle::DISPLAY_GROUPS_EXPAND_FIRST}
                                {if !$is_expand}
                                    {assign var=class_expand value="icon_expand"}
                                    {assign var=class_collapse value=""}
                                    {assign var=is_expand value=1}
                                {else}
                                    {assign var=class_expand value=""}
                                {/if}
                            {elseif $collapse_expand_groups == HsMaDisplayStyle::DISPLAY_GROUPS_COLLAPSE}
                                {assign var=class_expand value=""}
                                {assign var=class_collapse value="icon_collapse"}
                            {/if}
                            <i class="ma_grower {$class_collapse|escape:'htmlall':'UTF-8'} {$class_expand|escape:'htmlall':'UTF-8'}"></i>
                        {/if}
                        {$group.name|escape:'html':'UTF-8'}
                    </h4>
                    {assign var=is_show_group value="block"}
                    {if !$class_expand}
                        {assign var=is_show_group value="none"}
                    {/if}
                    <div class="content_group" style="display: {$is_show_group|escape:'htmlall':'UTF-8'}">
                    {if $group.display_style == HsMaDisplayStyle::DROPDOWN}{*Display style = Dropdown*}
                        {include file="./display_style_dropdown.tpl"}
                    {else}{*Display style = Checkbox & radio*}
                        {include file="./display_style_checkbox_radio.tpl"}
                    {/if}
                    </div>
                </div>
            {/if}
        {/foreach}
    </div>
{/if}
</div>