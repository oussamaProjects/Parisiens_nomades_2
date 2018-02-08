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
{if $prestablog_categorie_obj->image_presente && $prestablog_config.prestablog_view_cat_img}
<img class="prestablog_cat_img" src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}c/full_{$prestablog_categorie_obj->id|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$prestablog_categorie_obj->title|escape:'htmlall':'UTF-8'}" />
{/if}
{if $prestablog_categorie_obj->image_presente && $prestablog_config.prestablog_view_cat_thumb}
<img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}c/thumb_{$prestablog_categorie_obj->id|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$prestablog_categorie_obj->title|escape:'htmlall':'UTF-8'}" class="prestablog_thumb_cat"/>
{/if}
{if isset($prestablog_categorie_obj->description) && $prestablog_config.prestablog_view_cat_desc}
<p class="cat_desc_blog">{PrestaBlogContent return=$prestablog_categorie_obj->description}</p>
{/if}
<div class="clearfix"></div>
<!-- /Module Presta Blog -->