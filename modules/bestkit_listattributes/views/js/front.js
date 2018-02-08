/*
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
 *         DISCLAIMER   *
 * *************************************** */
/* Do not edit or add to this file if you wish to upgrade Prestashop to newer
 * versions in the future.
 * ****************************************************
 *
 *  @author     BEST-KIT
 *  @copyright  best-kit
 *  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

var bestkit_listattributes = {
	init : function() {
		// $('#products .product-miniature').each(function(i, item){
		// 	$(item).find('.thumbnail-container .product-thumbnail').append($(item).find('.bestkit_attr'))
		// })
		
		// if (bestkit_listattributes_style == 'float') {
		// 	$(document).on('mousemove', '#products .product-miniature', function(e) {
		// 		$('.bestkit_attr', $(e.currentTarget)).css({
		// 			'top': (e.pageY - $(this).offset().top + 25),
		// 			'left': (e.pageX - $(this).offset().left - 15)
		// 		});
		// 	});
		// } else {
		// 	$('#products .product-miniature').hover(function() {
		// 		$('.bestkit_attr', $(this)).show();
		// 	}, function() {
		// 		$('.bestkit_attr', $(this)).hide();
		// 	});
		// }
    }
};

$( document ).ready(function() {
    bestkit_listattributes.init();
});