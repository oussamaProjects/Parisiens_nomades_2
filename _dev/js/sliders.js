import $ from 'jquery';

$(document).ready(function () {

	$('#manufacturers_slider').owlCarousel({
		autoplay:true,
		slideSpeed : 2000,
		autoplayTimeout:1500,
		autoplayHoverPause:true,		
		loop:true,
		margin:30,
		dots: false,
		nav:true,	 
		navText: ['<i class="fa fa-long-arrow-left" aria-hidden="true"></i>','<i class="fa fa-long-arrow-right" aria-hidden="true"></i>'],
		responsive:{
			0:{
				items:1
			},
			600:{
				items:3
			},
			1000:{
				items:4
			}
		}
	});    
   
	let productsSliderArg = {
		autoPlay:true,
		slideSpeed : 2000,
		autoplayTimeout:1000,
		autoplayHoverPause:true,		
		loop:true,
		margin: 0,
		dots: false,
		nav:true,	 
		navText: ['<i class="fa fa-long-arrow-left" aria-hidden="true"></i>','<i class="fa fa-long-arrow-right" aria-hidden="true"></i>'],
		responsive:{
			0:{
				items:1
			},
			600:{
				items:2
			},
			1000:{
				items:3
			},
			1124:{
				items:4
			}
		}
	};

	$('#bestsellers-products').owlCarousel( productsSliderArg ); 
	$('#new-products').owlCarousel( productsSliderArg ); 
	$('#featured-products').owlCarousel( productsSliderArg ); 
	
});