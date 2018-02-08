{* <div class="col-md-12">
  <b>{$page.page_name}</b>
</div> *}

{if $page.page_name != 'index' 
and $page.page_name != 'cart' 
and $page.page_name != 'product' 
and $page.page_name != 'category' 
and $page.page_name != 'manufacturer' 

}
  <div class="col-md-12">
    <div id="page_banner">
      <img src="{$urls.img_url}img_{$page.page_name}.jpg" alt="">
      <div class="page_banner_wrapper">

         {block name='page_header_container'}
            {block name='page_header'}
            
               {if $page.page_name == 'module-prestablog-blog'}
                  <div class="titre blog">
                     {* {if isset($prestablog_title_h1)}  *}
                        {* {$prestablog_title_h1|escape:'htmlall':'UTF-8'}   *}
                        {l s='Inside Monarqueo ' d='Shop.Theme.Catalog'}
                     {* {/if} *}
                  </div>  
               {elseif $page.page_name == 'contact'}
                  <div class="titre contact">
                     {l s='Contact' d='Shop.Theme.Catalog'}
                  </div> 
               {elseif $page.page_name == 'cms'}
                  <div class="titre cms">
                     {block name='page_title'} {/block}
                  </div>
               {elseif $page.page_name == 'prices-drop'}
                  <div class="titre cms">
                      {l s='Promotions' d='Shop.Theme.Catalog'} 
                  </div>  
                {else}
                  <div class="titre cms">
                    {block name='page_title'}{$page.page_name} {/block}
                  </div> 
                {/if} 

            {/block}
         {/block}

         {block name='breadcrumb'}
            {include file='_partials/breadcrumb.tpl'}
         {/block}

      </div>

   </div>
  </div>
  <div class="clearfix"></div>
{/if} 

