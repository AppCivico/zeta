$( document ).ready(function() {

    $(".errors").hide();

    $('.postal_code').blur(function(){
        var postal_code = $(this).val(),
            invalid     = false,
            $me         = $(this);
        $me.addClass('input-loading');

        $(".errors").hide();

        if(postal_code == '') {
            invalid = true;
            $("#postal_code_error").show();
            $me.removeClass('input-loading');
        }

        if(invalid == false) {
            $.ajax({
                url: "/get_address",
                data: {postal_code: postal_code},
                dataType: 'json',
                success: function(result) {
                    if(result.error){
                        $('#cep_not_found').show();
                        $('#elm_state_id').focus();

                        setTimeout("$('#cep_not_found').fadeOut();", 10000);
                    } else {
                        $('#elm_address').val(result.address);
                        $('#elm_neighborhood').val(result.neighborhood);
                        $('#elm_state_id').val(result.state_id);

                        if($('#elm_city_id').find(":contains("+result.location+")").length) {
                            $('#elm_city_id').val(result.city_id);
                        } else {
                            $('#elm_city_id').append('<option value='+result.city_id+'>'+result.location+'</option>').val(result.city_id);
                        }

                        $('#elm_number').focus();
                    }
                },
                complete: function(){
                    $me.removeClass('input-loading');
                    $('.span3').removeAttr('disabled');
                }
            });
        }
    });

});

function reset_button(){
    setTimeout(function () {
        $("#check_token").button('reset');
    })
}