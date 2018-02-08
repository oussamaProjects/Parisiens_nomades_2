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
			<i class="fa fa-search" aria-hidden="true"></i>
			{l s='Search for an article' mod='prestablog'}
		</div>
		<div class="block_content">
			<div class="form_search">
				<form action="{PrestaBlogUrl}" method="post" id="prestablog_bloc_search">
				<input id="prestablog_search" class="search_query form-control ac_input" type="text" value="{$prestablog_search_query|escape:'htmlall':'UTF-8'}" placeholder="{l s='Search...' mod='prestablog'}" name="prestablog_search" autocomplete="off">
					<button class="btn btn-default button-search" type="submit"></button>
					<div class="clear"></div>
				</form>
			</div>
		</div>
	</div>
	<!-- /Module Presta Blog -->
