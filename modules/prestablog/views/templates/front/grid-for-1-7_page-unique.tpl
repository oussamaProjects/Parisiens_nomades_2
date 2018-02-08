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
    {if isset($news)}
    <div id="blog_detail" class="PrestaBlog">
        <a name="article"></a>

        <div class="header_blog">

            {if isset($news_Image) && $prestablog_config.prestablog_view_news_img}
            <img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}slide_{$news->id|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" class="news" alt="{$news->title|escape:'htmlall':'UTF-8'}"/>
            {/if}
            <div class="titre" data-referenceid="{$news->id|intval}">{$news->title|escape:'htmlall':'UTF-8'}</div>


            <div class="date_blog-cat">

                <span class="date_blog">
                    <i class="fa fa-calendar" aria-hidden="true"></i>
                    {dateFormat date=$news->date full=false}
                    {if sizeof($news->categories)}
                </span> 

                <div class="categorie_blog">
                    <i class="fa fa-folder-open" aria-hidden="true"></i>  
                    {foreach from=$news->categories item=categorie key=key name=current}
                    <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}">
                        {$categorie.title|escape:'htmlall':'UTF-8'}
                    </a>
                    {if $prestablog_config.prestablog_uniqnews_rss}<sup><a target="_blank" href="{PrestaBlogUrl rss=$key}"><img src="{$prestablog_theme_dir|escape:'html':'UTF-8'}/img/rss.png" alt="Rss feed" align="absmiddle" /></a></sup>{/if}
                    {if !$smarty.foreach.current.last},{/if}
                    {/foreach}
                    {/if}
                </div>
            </div>
        </div>

        <div id="prestablogfont">{PrestaBlogContent return=$news->content}</div>
        <div class="clear"></div>
        {if (sizeof($news->products_liaison))}
        <div id="blog_product_linked">
            <h3>{l s='Related products' mod='prestablog'}</h3>
            <div class="blog_product_linked_container">
                {foreach from=$news->products_liaison item=product key=key name=current}
                <a href="{$product.link|escape:'htmlall':'UTF-8'}">
                    <div class="productslinks">
                        <div class="wrap_blog">
                            <div>
                                <div class="product_name_blog">
                                    <p class="titre_product_blog">
                                        {$product.name|escape:'htmlall':'UTF-8'}
                                    </p>
                                </div>
                                {PrestaBlogContent return=$product.thumb}
                            </div>
                        </div>
                    </div>
                </a>
                {/foreach}
            </div>
        </div>
        {/if}

        {if $prestablog_config.prestablog_socials_actif}
        <div class="rrssb-buttons-container">
            <div class="titre">{l s='Share' mod='prestablog'} : </div>
            <ul class="rrssb-buttons clearfix">
                {if $prestablog_config.prestablog_s_facebook}
                <li class="facebook">
                    <a href="https://www.facebook.com/sharer/sharer.php?u={$prestablog_current_url|escape:'url':'UTF-8'}" class="popup">
                        <span class="icon">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_twitter}
                <li class="twitter">
                    <a href="http://twitter.com/home?status={$news->title|escape:'url':'UTF-8'}%20{$prestablog_current_url|escape:'url':'UTF-8'}" class="popup">
                        <span class="icon">
                            <i class="fa fa-twitter" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_googleplus}
                <li class="googleplus">
                    <a href="https://plus.google.com/share?url={$prestablog_current_url|escape:'url':'UTF-8'}" class="popup">
                        <span class="icon">
                            <i class="fa fa-google-plus" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_linkedin}
                <li class="linkedin">
                    <a href="http://www.linkedin.com/shareArticle?mini=true&url={$prestablog_current_url|escape:'url':'UTF-8'}&title={$news->title|escape:'url':'UTF-8'}&summary={$news->title|escape:'url':'UTF-8'}" class="popup">
                        <span class="icon">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_email}
                <li class="email">
                    <a href="mailto:?subject={$news->title|escape:'url':'UTF-8'}&amp;body={$prestablog_current_url|escape:'url':'UTF-8'}">
                        <span class="icon">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_pinterest}
                <li class="pinterest">
                    <a href="http://pinterest.com/pin/create/button/?url={$prestablog_current_url|escape:'url':'UTF-8'}&amp;media={$prestablog_root_url_path|escape:'url':'UTF-8'}{$prestablog_theme_upimgnoslash|escape:'url':'UTF-8'}thumb_{$news->id|intval}.jpg&amp;description={$news->title|escape:'url':'UTF-8'}">
                        <span class="icon">
                            <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_pocket}
                <li class="pocket">
                    <a href="https://getpocket.com/save?url={$prestablog_current_url|escape:'url':'UTF-8'}">
                        <span class="icon">
                            <i class="fa fa-pocket" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_tumblr}
                <li class="tumblr">
                    <a href="http://tumblr.com/share/link?url={$prestablog_current_url|escape:'url':'UTF-8'}&name={$news->title|escape:'url':'UTF-8'}">
                        <i class="fa fa-tumblr" aria-hidden="true"></i>

                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_reddit}
                <li class="reddit">
                    <a href="http://www.reddit.com/submit?url={$prestablog_current_url|escape:'url':'UTF-8'}&title={$news->title|escape:'url':'UTF-8'}&text={$news->title|escape:'url':'UTF-8'}">
                        <span class="icon">
                            <i class="fa fa-hacker-news" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
                {if $prestablog_config.prestablog_s_hackernews}
                <li class="hackernews">
                    <a href="https://news.ycombinator.com/submitlink?u={$prestablog_current_url|escape:'url':'UTF-8'}&t={$news->title|escape:'url':'UTF-8'}&text={$news->title|escape:'url':'UTF-8'}">
                        <span class="icon">
                            <i class="fa fa-hacker-news" aria-hidden="true"></i>
                        </span>
                    </a>
                </li>
                {/if}
            </ul>
        </div>
        {/if}


        {if (sizeof($news->articles_liaison))}
        <div id="blog_article_linked">
            <div id="blog_list" class="PrestaBlog">

                <div class="title">{l s='Similar posts' mod='prestablog'}</div>
                
                <div id="similar_post_slider">    
                    {foreach from=$news->articles_liaison item=article key=key name=current}
                    <div class="item">
                        <div class="block_cont">

                            <div class="block_left">

                                <a href="{PrestaBlogUrl id=$article.id seo=$article.link titre=$article.title}" class="product_img_link" title="{$article.title|escape:'htmlall':'UTF-8'}">
                                    <img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}thumb_{$article.id|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$article.title|escape:'htmlall':'UTF-8'}" />
                                </a> 
                            </div>
                            <div class="block_right">

                                <div class="titre">
                                    {if isset($article.title)}
                                    <a href="{$article.link|escape:'htmlall':'UTF-8'}">
                                        {/if}
                                        {$article.title|escape:'htmlall':'UTF-8'}
                                        {if isset($article.title)}
                                    </a>
                                    {/if}
                                    <br />
                                </div>

                                <div class="date_blog-cat">

                                    <span class="date_blog">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        {dateFormat date=$article.date full=false}
                                    </span>

                                    {if sizeof($article.categories)}
                                    <div class="categorie_blog">
                                        <i class="fa fa-folder-open" aria-hidden="true"></i>  
                                        {foreach from=$article.categories item=categorie key=key name=current}
                                        <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}">
                                            {$categorie.title|escape:'htmlall':'UTF-8'}
                                        </a>
                                        {if !$smarty.foreach.current.last},{/if}
                                        {/foreach}
                                    </div>
                                    {/if}
                                </div>

                                <div class="blog_desc">
                                    {if $article.paragraph_crop!=''}
                                    {$article.paragraph_crop|escape:'htmlall':'UTF-8'}
                                    {/if} 
                                </div>

                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>

            </div>
        </div> 
        {/if}


    </div>
    {/if}
    <!-- /Module Presta Blog -->
