{*
	* 2007-2015 PrestaShop
	*
	* NOTICE OF LICENSE
	*
	* This source file is subject to the Academic Free License (AFL 3.0)
	* that is bundled with this package in the file LICENSE.txt.
	* It is also available through the world-wide-web at this URL:
	* http://opensource.org/licenses/afl-3.0.php
	* If you did not receive a copy of the license and are unable to
	* obtain it through the world-wide-web, please send an email
	* to license@prestashop.com so we can send you a copy immediately.
	*
	* DISCLAIMER
	*
	* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
	* versions in the future. If you wish to customize PrestaShop for your
	* needs please refer to http://www.prestashop.com for more information.
	*
	*  @author PrestaShop SA <contact@prestashop.com>
	*  @copyright  2007-2015 PrestaShop SA
	*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
	*  International Registered Trademark & Property of PrestaShop SA
	*}

	<!-- Module Editorial -->
	{if $editorial->body_title && $editorial->body_paragraph}
	<div class="row">
		<div class="col-md-12">

			<div id="editorial" class="editorial">

				<div class="bloc">

					<div class="info">
						{if $editorial->body_title}
							<div class="title">
								{$editorial->body_title|stripslashes} 
							</div>
						{/if} 

						{if $editorial->body_paragraph}
						<div class="description">
							{$editorial->body_paragraph nofilter}
						</div>
						{/if}
						
						{if $editorial->body_home_logo_link}
							<a href="{$editorial->body_home_logo_link|escape:'html':'UTF-8'}" title="{$editorial->body_title|escape:'html':'UTF-8'|stripslashes}" class="btn btn-white"> 
								{l s='Learn more' d='Shop.Theme.Catalog'}
								<i class="fa fa-angle-right" aria-hidden="true"></i>
							</a>
						{/if}
					</div>

					<div class="image">	
						{if $homepage_logo}
						<img  class="img_zoomm" src="{$link->getMediaLink($image_path)|escape:'html'}" alt="{$editorial->body_title|escape:'html':'UTF-8'|stripslashes}" {if $image_width}width="{$image_width}"{/if} {if $image_height}height="{$image_height}" {/if}/>
						{/if}
					</div>

				</div> 
			</div> 

		</div>
	</div>
	<!-- /Module Editorial -->
	{/if}
