$( document ).ready(function() {

    $(".errors").hide();

    $('.postal_code').blur(function(){
        var postal_code = $(this).val();
        var invalid     = false;

        $(".errors").hide();

        if(postal_code == '') {
            invalid = true;
            $("#postal_code_error").show();
        }

        if(invalid == false) {
            $.ajax({
                url: "/get_address",
                data: {postal_code: postal_code},
                dataType: 'json',
                success: function(result){
                    $("#elm_address").val(result.address);
                    $("#elm_neighborhood").val(result.neighborhood);
                    $('#elm_state_id').val(result.state_id);

                    if($('#elm_city_id').find(":contains("+result.location+")").length) {
                        $('#elm_city_id').val(result.city_id);
                    } else {
                        $('#elm_city_id').append('<option value='+result.city_id+'>'+result.location+'</option>').val(result.city_id);
                    }
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