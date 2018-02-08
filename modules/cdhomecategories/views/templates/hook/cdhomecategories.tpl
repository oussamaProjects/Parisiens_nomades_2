{*
* 2013 - 2015 CleanDev
*
* NOTICE OF LICENSE
*
* This file is proprietary and can not be copied and/or distributed
* without the express permission of CleanDev
*
* @author    CleanPresta : www.cleanpresta.com <contact@cleanpresta.com>
* @copyright 2013 - 2015 CleanDev.net
* @license   You only can use module, nothing more!
*}

<div id="homecategories">
	<div class="row">
		<div class="col-md-12">
			<div class="categories">

				{foreach from=$home_categories item='cat'}

					<div class="categorie">
						<div class="image"> 
							<img 
							class="img_zoom" 
							src="{$link->getCatImageLink($cat.link_rewrite, $cat.id_image_2, '')|escape:'html':'UTF-8'}" 
							alt="{$cat.name|escape:'html':'UTF-8'}"
							/> 
						</div>

						<div class="info">
							<div class="info-background">
								<div class="title">
									{$cat.name|escape:'html':'UTF-8'} 
								</div>
								{* <div class="court_description">Lorem ipsum dolar</div> *}
								<div class="description">
									{$cat.description nofilter}  
								</div>
								<a title="{$cat.name|escape:'html':'UTF-8'}" href="{$cat.link|escape:'html':'UTF-8'}" class="btn btn-white"> 
									{l s='Learn more' d='Shop.Theme.Catalog'} 
									<i class="fa fa-angle-right" aria-hidden="true"></i>
								</a>
							</div>
						</div>

					</div>

				{/foreach} 

			</div>
		</div>
	</div>
</div>