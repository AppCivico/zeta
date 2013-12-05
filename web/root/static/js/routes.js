var $new_add = function () {

    var $modal;
    var $select;
    var initialize = function (who, ctx) {

        $modal = $('#' + who);
        $select = $('#' + ctx);

        $modal.on('submit', 'form', {}, _on_submit);
    },
        _on_submit = function () {

            var $form = $(this),
                url = $form.attr('action');

            $.ajax({
                url: url,
                method: 'POST',
                data: $form.serialize(),
                dataType: 'html',
                success: function (result) {
                    if (result.substr(0, 1) == '{') {
                        var result_val = $.parseJSON(result);
                        $select.append('<option value=' + result_val.route_type.id + '>' + result_val.route_type.name + '</option>');
                        $select.val(result_val.route_type.id);
                        $modal.find('button[type=button]').click();
                    } else {

                        $modal.find('.modal-body').html(result);
                        re_mask();

                        var cep_val;
                        $('#elm_state_id').change(function () {
                            $address.get_cities($(this).val());
                        });

                        $('.postal_code', $modal).keyup(function () {
                            if (cep_val != $(this).val()) {
                                $address.get_address($(this));
                            }
                        });
                        $('.postal_code').click(function () {
                            cep_val = $(this).val();
                        });

                        if ($('.postal_code', $modal).val()) {
                            $address.get_address($('.postal_code'));
                        }
                    }
                }
            });

            return false;
        };

    return {
        initialize: initialize,
    };

}();

var $route = function() {

    function swap_route_point(elm) {
        $('.route_addr option').show();

        var target;

        if(elm == 'elm_origin_id') {
            target = 'elm_destination_id';
        } else {
            target = 'elm_origin_id';
        }

        var id = $('#'+elm+' option:selected').attr('data-address_id');
        $('#'+target+' option[data-address_id=' + id + ']').hide();
    }

    return {
        swap_route_point: swap_route_point
    };

}();

$(document).ready(function () {

    $('#origin').click(function () {
        $new_add.initialize('new_address', 'elm_origin_id');
        $('#btn_save').button('reset');
        $('.clear_addr_rt').val('');
    });

    $('#destination').click(function () {
        $new_add.initialize('new_address', 'elm_destination_id');
        $('#btn_save').button('reset');
        $('.clear_addr_rt').val('');
    });


    var $route_addr = $('.route_addr');
    if($route_addr.length) {
        $route.swap_route_point('elm_destination_id');
        $route.swap_route_point('elm_origin_id');

        $route_addr.on('change', function(){
            var $elm = $(this).attr('id');
            $('.route_addr option').show();
            $route.swap_route_point($elm)
        });

    }

});