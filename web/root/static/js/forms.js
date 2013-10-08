function re_mask() {
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
}

$( document ).ready(function() {
    re_mask();
	if ($("#elm_vehicle_body_style_id").length > 0){
		var body_style_ui = $("<div class='body-style-select'><ul></ul></div>");
		$("#elm_vehicle_body_style_id option").each(function(index,item){
			if ($(item).attr("value") != ""){
				var sChecked = ($(item).attr("value") == $("#elm_vehicle_body_style_id").val()) ? "checked='checked'" : "";
				$(body_style_ui).find("ul").append("<li class='item body-style-" + $(item).attr("value") + "'><input type='radio' name='body-style-select' value='" + $(item).attr("value") + "' " + sChecked + "><div class='image'></div><div class='text'>" + $(item).html() + "</div></li>");
			}
		});
		$("#elm_vehicle_body_style_id").after($(body_style_ui));
		$("#elm_vehicle_body_style_id").hide();

		$(".body-style-select ul li input").change(function(e){
			$("#elm_vehicle_body_style_id").val($(this).val());
		});
	}

	if($('.datepicker').length){
        $('.datepicker').datepicker({language:'pt-BR', format:'dd/mm/yyyy'});
	}
});