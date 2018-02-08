{*
  * 2008 - 2017 (c) HDClic
  *
  * MODULE PrestaBlog
  *
  * @author    HDClic <prestashop@hdclic.com>
  * @copyright Copyright (c) permanent, HDClic
  * @license   Addons PrestaShop license limitation
  * @version    4.0.1
  * @link    http://www.hdclic.com
  *
  * NOTICE OF LICENSE
  *
  * Don't use this module on several shops. The license provided by PrestaShop Addons
  * for all its modules is valid only once for a single shop.
  *}
</div>
<!-- Module Presta Blog -->
<div class="titre_type">{l s='Véto-pharma news' mod='prestablog'}</div>
<div class="row">
  <section id="blog_footer" class="footer-block col-xs-12 col-md-12 col-lg-4">
    <ul class="toggle-footer">
      {if $ListeBlocLastNews}
      {foreach from=$ListeBlocLastNews item=Item name=myLoop}

      <li>  
       {if isset($Item.link_for_unique)}
       {if isset($Item.image)}
       <img src="{$Item.image}" alt="{$Item.title|escape:'htmlall':'UTF-8'}">
       {/if}
       <a href="{PrestaBlogUrl id=$Item.id_prestablog_news seo=$Item.link_rewrite titre=$Item.title}">
        {/if}
        <div class="titre">{$Item.title|escape:'htmlall':'UTF-8'}</div>
        {if $prestablog_config.prestablog_footlastnews_intro}
        <span>{$Item.paragraph_crop|escape:'htmlall':'UTF-8'}</span>
        {/if}

        <div class="date_blog">
         <i class="fa fa-calendar" aria-hidden="true"></i>
         {dateFormat date=$Item.date full=false}
       </div>
       {if isset($Item.link_for_unique)}
     </a>
     {/if}
   </li>
   {if !$smarty.foreach.myLoop.last}{/if}
   {/foreach}
   {else}
   <li>{l s='No news' mod='prestablog'}</li>
   {/if}
   {if $prestablog_config.prestablog_footlastnews_showall}
   <li>
     <a href="{PrestaBlogUrl}" class="button_large">{l s='See all' mod='prestablog'}</a>
   </li>
   {/if}
 </ul>
</section>
<!-- /Module Presta Blog -->
