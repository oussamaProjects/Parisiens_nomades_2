{if Configuration::get('lbf_includeapp')==1}
{literal}
<div id="fb-root"></div>
<script>(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
{/literal}

{/if} 
<div class="facebook_container">

	<div class="facebook_poage">

		<div class="fb-page" data-width="{Configuration::get('lbf_width')}" adapt_container_width="true" data-height="{Configuration::get('lbf_height')}" data-href="{Configuration::get('lbf_url')}" data-small-header="{if Configuration::get('lbf_small_header')==1}true{else}false{/if}" data-hide-cta="{if Configuration::get('lbf_hide_cta')==1}true{else}false{/if}" data-hide-cover="{if Configuration::get('lbf_hide_cover')==1}true{else}false{/if}" data-show-facepile="{if Configuration::get('lbf_show_facepile')==1}true{else}false{/if}" data-show-posts="{if Configuration::get('lbf_show_posts')==1}true{else}false{/if}"><div class="fb-xfbml-parse-ignore"></div></div>

	</div>

	{* <div class="facebook_post">

		<div id="facebook_post" style="height: {Configuration::get('lbf_height')}px ; overflow: hidden; overflow-y: scroll;">
			{if {Context::getContext()->shop->id} == 1}
			<div class="fb-post" data-href="{Configuration::get('lbf_url')}/posts/772305562949042" data-width="320" ></div>
			<div class="fb-post" data-href="{Configuration::get('lbf_url')}/posts/760219960824269" data-width="320" ></div>
			{else}
			<div class="fb-post" data-href="{Configuration::get('lbf_url')}/posts/1090367734429606" data-width="320" data-show-text="true"></div>
			<div class="fb-post" data-href="{Configuration::get('lbf_url')}/posts/1086015331531513" data-width="320" data-show-text="true"></div>
			{/if}
		</div>
	</div> *}
</div> 