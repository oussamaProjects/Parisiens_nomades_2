<div class="variant-links">

  <div class="variant-title">
    {l s='Couleur(s) disponible(s) :' d='Shop.Theme.Actions'}
  </div>
  {foreach from=$variants item=variant}
    <a href="{$variant.url}"
       class="{$variant.type}"
       title="{$variant.name}"
       {*
          TODO:
            put color in a data attribute for use with attr() as soon as browsers support it,
            see https://developer.mozilla.org/en/docs/Web/CSS/attr
        *}
      {if $variant.html_color_code} style="background-color: {$variant.html_color_code}" {/if}
      {if $variant.texture} style="background-image: url({$variant.texture})" {/if}
    ><span class="sr-only">{$variant.name}</span></a>
  {/foreach}
  <a href="{$product.url}"><span class="js-count-color count"></span></a>
 
  {block name='product_reviews'}
    {hook h='displayVariantLinks' product=$product}
  {/block}

</div>


