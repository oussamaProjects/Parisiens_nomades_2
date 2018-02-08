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
  <div id="search_filters">

    {block name='facets_title'}
      {* <h4 class="text-uppercase h6 hidden-sm-down">{l s='Filter By' d='Shop.Theme.Actions'}</h4> *}
    {/block}

    {block name='facets_clearall_button'}
      {* <div id="_desktop_search_filters_clear_all" class="hidden-sm-down clear-all-wrapper">
        <button data-search-url="{$clear_all_link}" class="btn btn-tertiary js-search-filters-clear-all">
          <i class="material-icons">&#xE86A;</i> 
        </button>
      </div> *}
    {/block}

    <div class="facets_container">
    {foreach from=$facets item="facet"}
      {if $facet.displayed}
        <section class="facet clearfix"> 
          {assign var=_expand_id value=10|mt_rand:100000}
          {assign var=_collapse value=true}
          {foreach from=$facet.filters item="filter"}
            {if $filter.active}{assign var=_collapse value=false}{/if}
          {/foreach} 

          {if $facet.widgetType !== 'dropdown'}
            
            <h1>{$facet.label}</h1>
            {block name='facet_item_other'}
              <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if}">
                {foreach from=$facet.filters key=filter_key item="filter"}
                  {if $filter.displayed}
                    <li>
                      <label class="facet-label{if $filter.active} active {/if}" for="facet_input_{$_expand_id}_{$filter_key}">
                        {if $facet.multipleSelectionAllowed}
                          <span class="custom-checkbox">
                            <input
                              id="facet_input_{$_expand_id}_{$filter_key}"
                              data-search-url="{$filter.nextEncodedFacetsURL}"
                              type="checkbox"
                              {if $filter.active } checked {/if}
                            >
                            {if isset($filter.properties.color)}
                              <span class="color" style="background-color:{$filter.properties.color}"></span>
                              {elseif isset($filter.properties.texture)}
                                <span class="color texture" style="background-image:url({$filter.properties.texture})"></span>
                              {else}
                              <span {if !$js_enabled} class="ps-shown-by-js" {/if}><i class="material-icons checkbox-checked">&#xE5CA;</i></span>
                            {/if}
                          </span>
                        {else}
                          <span class="custom-radio">
                            <input
                              id="facet_input_{$_expand_id}_{$filter_key}"
                              data-search-url="{$filter.nextEncodedFacetsURL}"
                              type="radio"
                              name="filter {$facet.label}"
                              {if $filter.active } checked {/if}
                            >
                            <span {if !$js_enabled} class="ps-shown-by-js" {/if}></span>
                          </span>
                        {/if}

                        <a
                          href="{$filter.nextEncodedFacetsURL}"
                          class="_gray-darker search-link js-search-link"
                          rel="nofollow"
                        >
                          {$filter.label}
                          {if $filter.magnitude}
                            <span class="magnitude">({$filter.magnitude})</span>
                          {/if}
                        </a>
                      </label>
                    </li>
                  {/if}
                {/foreach}
              </ul>
            {/block}

          {else}

            {block name='facet_item_dropdown'}
              <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if} {$facet.label} {$facet.type}">
                <li>
                  <div class="facet-dropdown dropdown">
                    <a class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      {$active_found = false}
                      <span>
                        {foreach from=$facet.filters key=filter_key item="filter"}
                          {if $filter.active}
                            {$filter.label}
                            {if $filter.magnitude}
                              ({$filter.magnitude})
                            {/if}
                            {$active_found = true}
                          {/if}
                        {/foreach}
                        {if !$active_found}
                         {$facet.label}
                        {/if}
                      </span> 
                      <i class="material-icons float-xs-right">&#xE313;</i>
                    </a>
                    <div class="dropdown-menu">
                      <div class="dropdown-menu-container">
                        {foreach from=$facet.filters item="filter"}
 
                          {if !$filter.active}

                            {if isset($filter.properties.color)}
                            <span class="custom-checkbox">
                              <input
                                id="facet_input_{$_expand_id}_{$filter_key}"
                                data-search-url="{$filter.nextEncodedFacetsURL}"
                                type="checkbox" {if $filter.active } checked {/if} >
                              <span class="color" style="background-color:{$filter.properties.color}"></span>
                            </span>
                            {elseif isset($filter.properties.texture)}
                              <span class="color texture" style="background-image:url({$filter.properties.texture})"></span> 
                            {else}
                              <a rel="nofollow"  href="{$filter.nextEncodedFacetsURL}" class="select-list" >
                                {$filter.label}
                                {if $filter.magnitude} 
                                  {* <span>({$filter.magnitude})</span> *}
                                {/if}
                              </a>
                            {/if}
  
                          {/if}

                        {/foreach}
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            {/block}

          {/if}
        </section>
      {/if}
    {/foreach}
    </div>
  </div>
