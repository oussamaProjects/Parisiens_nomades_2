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
<div class="product-variants">
  {foreach from=$groups key=id_attribute_group item=group}
    <div class="clearfix product-variants-item">
      {* <span class="control-label">{$group.name}</span> *}

      {if $group.group_type == 'color'}

      <div class="product-variants-item-content oe_dropdown_menu">
        <span class="dropdown_menu_titre" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Couleurs<i class="material-icons float-xs-right">&#xE313;</i></span>
        <div class="dropdown-menu">
          <ul id="group_{$id_attribute_group}" class="dropdown-menu-container">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="float-xs-left input-container">
                <label>
                  <input class="input-color" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                    {if $group_attribute.html_color_code}class="color" style="background-color: {$group_attribute.html_color_code}" {/if}
                    {if $group_attribute.texture}class="color texture" style="background-image: url({$group_attribute.texture})" {/if}
                  ><span class="sr-only">{$group_attribute.name}</span></span>
                </label>
              </li>
            {/foreach}
          </ul>
        </div>
      </div>

      {elseif $group.group_type == 'select'}
        <select
          class="product-variants-item-content form-control form-control-select"
          id="group_{$id_attribute_group}"
          data-product-attribute="{$id_attribute_group}"
          name="group[{$id_attribute_group}]">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
            <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
          {/foreach}
        </select>
      {elseif $group.group_type == 'radio'}
        <ul id="group_{$id_attribute_group}" class="product-variants-item-content">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
            <li class="input-container float-xs-left">
              <label>
                <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                <span class="radio-label">{$group_attribute.name}</span>
              </label>
            </li>
          {/foreach}
        </ul>
      {/if}
    </div>
  {/foreach}


  {if $product.attachments}
      {foreach from=$product.attachments item=attachment}
          <a class='attachment' data-toggle="modal" data-target="#attachementsModal" href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
          <div class="modal fade attachementsModal" id="attachementsModal" role="dialog">
              <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="modal-title">{l s='Size guide' d='Shop.Theme.product'}</div>
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
