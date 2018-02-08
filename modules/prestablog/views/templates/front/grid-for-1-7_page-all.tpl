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

    <!-- Module Presta Blog -->
    {*if isset($prestablog_title_h1)}<h1>{$prestablog_title_h1|escape:'htmlall':'UTF-8'}</h1>{/if*}
    <!-- <h2><span>{$NbNews|intval} {if $NbNews <> 1}{l s='articles' mod='prestablog'}{else}{l s='article' mod='prestablog'}{/if}</span></h2> -->

    {if sizeof($news)}
    <div id="blog_list" class="PrestaBlog">
        {foreach from=$news item=news_item name=NewsName}

        <div class="block_cont">
            <div class="block_left">

                {if isset($news_item.image_presente)}
                {if isset($news_item.link_for_unique)}
                <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" class="product_img_link image" title="{$news_item.title|escape:'htmlall':'UTF-8'}">
                    {/if}
                    <img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}thumb_{$news_item.id_prestablog_news|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$news_item.title|escape:'htmlall':'UTF-8'}" class="img_zoom" />
                    {if isset($news_item.link_for_unique)}
                </a>
                {/if}
                {/if}
            </div>
            <div class="block_right">

                <div class="titre">
                    {if isset($news_item.link_for_unique)}
                    <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" title="{$news_item.title|escape:'htmlall':'UTF-8'}">
                        {/if}
                        {$news_item.title|escape:'htmlall':'UTF-8'}
                        {if isset($news_item.link_for_unique)}
                    </a>
                    {/if}
                    <br />
                </div>

                <div class="date_blog-cat">

                    <span class="date_blog">
                        <i class="fa fa-calendar" aria-hidden="true"></i> 
                        {dateFormat date=$news_item.date full=false} 
                    </span>
                    {if sizeof($news_item.categories)}
                    <div class="categorie_blog">
                        <i class="fa fa-folder-open" aria-hidden="true"></i>  
                        {foreach from=$news_item.categories item=categorie key=key name=current}
                        <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}">
                            {$categorie.title|escape:'htmlall':'UTF-8'}
                        </a>
                        {if !$smarty.foreach.current.last},{/if}
                        {/foreach}
                    </div>
                    {/if}
                </div>

                <div class="blog_desc">
                    {if $news_item.paragraph_crop!=''}
                    {$news_item.paragraph_crop|escape:'htmlall':'UTF-8'}
                    {/if} 
                </div>

                {*if isset($news_item.link_for_unique)}
                <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" class="blog_link">
                    {l s='Read more' mod='prestablog'}
                </a>
                {if $prestablog_config.prestablog_comment_actif==1 && $news_item.count_comments>0}
                <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment" class="comments"> 
                    {$news_item.count_comments|intval}
                </a>
                {/if}
                {if $prestablog_config.prestablog_commentfb_actif==1}
                <a
                href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment"
                id="showcomments{$news_item.id_prestablog_news|intval}"
                class="comments"
                data-commentsurl="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}"
                data-commentsidnews="{$news_item.id_prestablog_news|intval}"
                > </a>
                {/if}
                {/if *}
            </div>
        </div>

        {/foreach}
    </div>
    {include file="$prestablog_pagination"}
    {else}
    <p class="warning">{l s='Empty' mod='prestablog'}</p>
    {/if}
    <!-- /Module Presta Blog -->
