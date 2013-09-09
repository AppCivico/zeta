$( document ).ready(function() {
    $('.date').mask('99/99/9999');
    $('.phone').mask('(99) 9999-9999');
    $('.postal_code').mask('99999-999');
    $('.cpf').mask('999.999.999-99');
    $('#elm_car_plate').mask('aaa-9999');

    $('.mobile_phone').focusout(function(){
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if(phone.length > 10) {
            element.mask("(99) 99999-9999");
        } else {
            element.mask("(99) 9999-9999?9");
        }
    }).trigger('focusout');

});