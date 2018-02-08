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
	<div class="block-categories">
		<div class="title_block">
			<i class="fa fa-pencil-square-o aria-hidden="true"></i>
			{l s='Recent Posts' mod='prestablog'}
		</div>
		<div class="block_content" id="prestablog_lastliste">
			{if $ListeBlocLastNews}
			<ul class="list_type_1">
				{foreach from=$ListeBlocLastNews item=Item name=myLoop}

				{if isset($Item.link_for_unique)}
				<li>
					<a href="{PrestaBlogUrl id=$Item.id_prestablog_news seo=$Item.link_rewrite titre=$Item.title}">{/if}
						{if isset($Item.image_presente) && $prestablog_config.prestablog_lastnews_showthumb}
						<img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}adminth_{$Item.id_prestablog_news|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$Item.title|escape:'htmlall':'UTF-8'}" class="lastlisteimg" />
						{/if}
						<i class="fa fa-angle-right" aria-hidden="true"></i>
						<span>{$Item.title|escape:'htmlall':'UTF-8'}</span>
						{if $prestablog_config.prestablog_lastnews_showintro}
						<span>{$Item.paragraph_crop|escape:'htmlall':'UTF-8'}</span>
						{/if}
						{if isset($Item.link_for_unique)}
					</a>
				</li>
				{/if}

				{if !$smarty.foreach.myLoop.last}{/if}
				{/foreach}
			</ul>
			{else}
			<p>{l s='No news' mod='prestablog'}</p>
			{/if}

			{if $prestablog_config.prestablog_lastnews_showall}
			<div class="clearblog"></div>
			<a href="{PrestaBlogUrl}" class="btn-primary">{l s='See all' mod='prestablog'}</a>
			{/if}
			
		</div>
	</div>
	<!-- /Module Presta Blog -->
