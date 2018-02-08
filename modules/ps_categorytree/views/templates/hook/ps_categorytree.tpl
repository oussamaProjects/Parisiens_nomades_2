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

{function name="categories" nodes=[] depth=0}
  {strip}
    {assign var='category_id' value="0"}
  {if isset($category.id)}
    {assign var='category_id' value=$category.id}
  {/if}
 
    {if $nodes|count}
      <ul class="category-sub-menu">
        {foreach from=$nodes item=node}
          <li data-depth="{$depth}">
            {if $depth===0 or $depth===1}
              <a href="{$node.link}" class="{if $node.id == $category_id}active collapse_cat_menu{/if}">{$node.name}</a>
              {if $node.children}
                <div class="navbar-toggler collapse-icons  {$node.name} {if $node.id == $category_id}collapse_cat_menu{/if}" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons add">&#xE145;</i>
                  <i class="material-icons remove">&#xE15B;</i>
                </div>
                <div class="collapse" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {else}
              <a class="category-sub-link{if $node.id == $category_id} active collapse_cat_menu{/if}" href="{$node.link}">{$node.name}</a>
              {if $node.children}
                {* <span class="arrows" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons arrow-right">&#xE315;</i>
                  <i class="material-icons arrow-down">&#xE313;</i>
                </span> *}
                <div class="collapse" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

<div class="block-categories hidden-sm-down">
  
  <ul class="category-top-menu">
    <li><a class="text-uppercase h4" href="{$categories.link nofilter}">{$categories.name}</a></li>
    <li>{categories nodes=$categories.children}
    <ul class="category-sub-menu" style="margin:0;">      
    <li data-depth="0"><a href="{url entity='prices-drop'}">{l s='Promotions' d='Shop.Theme.Catalog'} </a></li>        
    </ul>
    </li>
  </ul> 
</div>
{* {$category|var_dump}


<br> 
<hr> 
<br> 
{$categories.children|var_dump} *}