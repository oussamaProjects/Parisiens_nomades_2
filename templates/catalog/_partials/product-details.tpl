<div class="product-details product-information-content" id="product-details" data-product="{$product.embedded_attributes|json_encode}">
  <div class="title">{l s='Composition et détails' d='Shop.Theme.Catalog'}</div>
  {block name='product_reference'}
    {if isset($product_manufacturer->id)}
      <div class="product-manufacturer">
        {if isset($manufacturer_image_url)}
          <a href="{$product_brand_url}">
            <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" alt="{$product_manufacturer->name}">
          </a>
        {else}
          <ul>
            <li>
              {l s='Brand' d='Shop.Theme.Catalog'}: 
              <span><a href="{$product_brand_url}">{$product_manufacturer->name}</a></span>
            </li>
          </ul>
        {/if}
      </div>
    {/if}
    {* {if isset($product.reference_to_display)}
      <ul class="product-reference">
        <li>
          {l s='Reference' d='Shop.Theme.Catalog'}: 
          <span itemprop="sku">{$product.reference_to_display}</span> 
        </li>
      </ul>
    {/if} *}
  {/block}

  {block name='product_quantities'}
    {* {if $product.show_quantities}
      <ul class="product-quantities">
        <li>
          {l s='In stock' d='Shop.Theme.Catalog'}: 
          <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
        </li>
      </ul>
    {/if} *}
  {/block}

  {block name='product_features'}
    {if $product.features}
      <section class="">
        {* <h3 class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</h3> *}
        <ul class="data-sheet">
          {foreach from=$product.features item=feature}
            <li class="name">{$feature.name}: <span class="value">{$feature.value}</span></li>
          {/foreach}
        </ul>
      </section>
    {/if}
  {/block}

  {* if product have specific references, a table will be added to product details section *}
  {block name='product_specific_references'}
    {* {if isset($product.specific_references)}
      <section class="product-features">
        <h3 class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</h3>
          <ul class="data-sheet">
            {foreach from=$product.specific_references item=reference key=key}
              <li class="name">{$key}: <span class="value">{$reference}</span></li>
            {/foreach}
          </ul>
      </section>
    {/if} *}
  {/block}

  {block name='product_condition'}
    {* {if $product.condition}
      <ul class="product-condition">
        <li>
        {l s='Condition' d='Shop.Theme.Catalog'}: 
        <span>{$product.condition.label}</span>
        </li>
        <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
      </ul>
    {/if} *}
  {/block}
</div>
 