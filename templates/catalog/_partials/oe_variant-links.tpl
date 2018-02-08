<div class="variant-links"> 
  {foreach from=$combinations key=k item=comb} 
      {* because the array key are id_product, we can separate the product combinations in here 
        with if/else statement compared with the id_product from the foreach loop of products-list *}
      {if $k = $product.id_product}
        <div class="variant-title">
          {l s='Taille(s) disponible(s) : ' d='Shop.Theme.Actions'}
        </div>
          {foreach from=$comb item=attr}
            {* The attribute Group Name *} 
            {* List of attribute values inside the attribute Group for current product *} 
            {if isset($attr.group_name) and $attr.group_name == 'Pointure'} 
              <span class="taille>{$attr.attribute_name} </span>
            {/if}
          {/foreach}
      {/if}
  {/foreach}
  <span class="js-count-taille count"></span>
</div>

