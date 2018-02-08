 
 <div class="bestkit_available_sizes bestkit_attr {$bestkit_listattributes.ps_version|escape:'htmlall':'UTF-8'}">
	{foreach $bestkit_listattributes.attributes as $key => $attributes}
		<div class="variant-title">{$key|escape:'htmlall':'UTF-8'}:</div> 
		<span class="bestkit_attr_content">
			{foreach $attributes as $attribute}
				{assign var='img_color_exists' value=file_exists($attribute.col_img_dir|cat:$attribute.id_attribute|cat:'.jpg')}
				{if $img_color_exists}
					<img src="{$bestkit_listattributes.img_col_dir}{$attribute.id_attribute|intval}.jpg" title="{$attribute.name|escape:'htmlall':'UTF-8'}" width="20" height="20" />
				{else}
					{if !empty($attribute.color)}
						<span class="bestkit_square_attr" style="background:{$attribute.color|escape:'htmlall':'UTF-8'}">&nbsp;&nbsp;&nbsp;</span>
					{else}
						<span class="bestkit_name_attr">{$attribute.name|escape:'htmlall':'UTF-8'}</span>
					{/if}
				{/if}
			{/foreach}
		</span>
	{/foreach}
</div>


<script type="text/javascript">
if (typeof(bestkit_listattributes) != 'undefined') {
	bestkit_listattributes.init();
}
</script>