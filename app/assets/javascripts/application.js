// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require tinymce-jquery
//= require selectize
//= require popper
//= require bootstrap
//= require_tree .

$(document).ready(function(){
    $('.add-prod').click(function(){
        var val = $('.edit_cart_item #cart_item_quantity').val();
        alert('Hello');
        $('.edit_cart_item #cart_item_quantity').attr('value', parseInt(val) + 1);
        $('.edit_cart_item').submit();
        return false;
    });

    $('.price-sort').click(function(){
        if ($('.category-sidebar').length) {
            $('.category-sidebar .products_filter_form #sort_direction').attr('value', $(this).attr('sort_direction'));
            $('.category-sidebar .products_filter_form').submit();
        }
        else if ($('.brand-sidebar').length) {
            $('.brand-sidebar .products_filter_form #sort_direction').attr('value', $(this).attr('sort_direction'));
            $('.brand-sidebar .products_filter_form').submit();
        }
    })

    $('.order-buttons-container .create-order').click(function(){
        $('.order-form-container .order-form .new_order').submit();
    })

    $('#select_product_brand').selectize();
    $('#select_product_categories').selectize({
        plugins: ['remove_button'],
        delimeter: ',',
        persist: false
    });

    //Uploading and choosing product images

    $('.image-upload-modal .images-container .image-item').click(function(){
        var imageID = $(this).attr("image-id");
        var imageURL = $(this).attr("image-url");
        if ($(this).hasClass('selected')){
            $(this).removeClass('selected');
            $('.product-form .product-images-fields').find('div.product-image-field[field-image-id="'+ imageID + '"]').remove();
        }
        else {
            var imageWrapper = $('<div class="product-image-field" field-image-id='+ imageID +'>' +
            '<div class="product-image-preview" style="background-image: url('+ imageURL +');">' +
            '<div class="remove-product-image"><i class="fa fa-times" aria-hidden="true"></i></div></div>' +
            '<input multiple="multiple" value="' + imageID + '" type="hidden" name="product[image_ids][]" id="product_image_ids">' +
            '</div>');
            $(this).addClass('selected');
            $('.product-form .product-images-fields').append(imageWrapper);
        }
    });

    //Removing product images

    $(document).on('click', '.remove-product-image', function(){
        $(this).closest('div.product-image-field').remove();
        if ($('.product-images-fields').length == 1){
            $('.product-images-fields').append('<input multiple="multiple" value="" type="hidden" name="product[image_ids][]" id="product_image_ids">');
        }
    });

    //Calculating price of the order to include the shipping price

    $(document).on('change', '.order-form .shipping-method-select', function(){
        var shippingPriceContainer = $('.order-shipping-price-container');
        var orderPriceContainer = $('.summary-price-container .total-price');
        var shippingMethodPrice = $('.shipping-method-select :selected').attr('data-cost');
        var orderSubtotalPrice = orderPriceContainer.attr('data-price');

        if(shippingPriceContainer.length) {
            shippingPriceContainer.hide();
            orderPriceContainer.html('$' + orderSubtotalPrice);
        }

        if(shippingMethodPrice >= 0) {
            var orderTotalPrice = parseFloat(orderSubtotalPrice) + parseFloat(shippingMethodPrice);
            shippingPriceContainer.find('.shipping-price').html('$' + shippingMethodPrice);
            shippingPriceContainer.show();
            orderPriceContainer.html('$' + orderTotalPrice);
        }

    });

    //Product search form

    $('#products_search').selectize();

    //Product images slider

    $('.product-images-carousel').carousel();

    $('.product-images-carousel .carousel-inner .carousel-item:first-child').addClass("active");
});