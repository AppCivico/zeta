var $new_add = function(){

    var $modal;
    var $select;
    var initialize = function (who, ctx) {

        $modal  = $('#' + who);
        $select = $('#' + ctx);

        $modal.on('submit', 'form', {}, _on_submit);
    },
    _on_submit = function(){

        var $form = $(this),
        url = $form.attr('action');

        $.ajax({
            url: url,
            method: 'POST',
            data: $form.serialize(),
            dataType: 'html',
            success: function(result){
                if (result.substr(0,1) == '{') {
                    var result_val = $.parseJSON(result);
                    $select.append('<option value='+result_val.route_type.id+'>'+result_val.route_type.name+'</option>');
                    $select.val(result_val.route_type.id);
                    $modal.find('button[type=button]').click();
                }else{

                    $modal.find('.modal-body').html(result);
                    re_mask();

                    var cep_val;
                    $('#elm_state_id').change(function() {
                        get_cities($(this).val());
                    });

                    $('.postal_code', $modal).keyup(function() {
                        if(cep_val != $(this).val()){
                            get_address($(this));
                        }
                    });
                    $('.postal_code').click(function(){
                        cep_val = $(this).val();
                    });

                    if ($('.postal_code', $modal).val()) {
                        get_address($('.postal_code'));
                    }
                }
            }
        });

        return false;
    };

    return {
        initialize: initialize
    };
}();

var $load_parking = function(){

    var initialize = function (ctx) {

        $select = $('#' + ctx);
        $select.on('change', {}, _on_change);
    },
    _on_change = function(){
        $id = $select.val();

        $.ajax({
            url: '/user/form/vehicle_route_types/load_parking',
            data: {id: $id},
            dataType: 'json',
            success: function(result) {
                console.log(result);
            },
            error: function(err) {
                console.log(err);
            }
        });

        return false;
    };

    return {
        initialize: initialize
    };
}();

$( document ).ready(function() {

    $('#origin').click(function() {
        $new_add.initialize('new_address', 'elm_origin_id');
        $('#btn_save').button('reset');
        $('.clear_addr_rt').val('');
    });

    $('#destination').click(function() {
        $new_add.initialize('new_address', 'elm_destination_id');
        $('#btn_save').button('reset');
        $('.clear_addr_rt').val('');
    });

    $load_parking.initialize('elm_destination_id');
});