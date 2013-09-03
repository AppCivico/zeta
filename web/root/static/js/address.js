$( document ).ready(function() {

    $('form').on('click','select,input', function(event){
        $(event.target).parents('.controls:first').find('.help-inline').show();
    });

    $('form').on('blur','select,input', function(event){
        $(event.target).parents('.controls:first').find('.help-inline').hide();
    });

    $('#elm_state_id').change(function(){
       get_cities($(this).val());
    });

    $(".errors").hide();

    $('.postal_code').keyup(function() {

        var cep = $(this).val().replace('_', '');

        if(cep.length < 9) {
            return false;
        }

        var $me         = $(this),
            postal_code = $me.val(),
            invalid     = false;

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

function get_cities(state_id) {

    if(!state_id) {
        return false;
    }

    $.ajax({
        url: "/get_cities",
        data: {state_id: state_id},
        dataType: 'html',
        success: function(result) {
            $("#cities").html(result);
        },
        error: function(err) {
            alert(err);
        }
    });
}