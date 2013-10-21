var $admin = function(){

    function getCostumers(form) {
        var $data;

        if(form) {
            $data = form;
        }

        $.ajax({
            url: "/admin/campaign/search_customer",
            dataType: 'html',
            data: $data,
            success: function(result) {
                $('#modal_body').html(result);
            },
            error: function(err) {
                console.log(err);
            },
            complete: function(){
                $('.customer_choice').click(function(){
                    $('#elm_customer').val($(this).val());
                    $('#customer_name').text(($(this).parent().text()));
                });
            }
        });
    }

    return {
        getCostumers: getCostumers
    };
}();

$( document ).ready(function() {
    if($('#customer_list').length) {
        $('#customer_list').click(function(){
            $admin.getCostumers();
        });
    }

    $('#search_customer').on('submit', function(){
        getCostumers($(this).serialize());
    });

    var $check_all = $('#check_all');
    if($check_all.length) {
        $check_all.on('click', function() {
            if($(this).attr('checked') == 'checked') {
                $(this).removeAttr('checked');
                $('.check_driver').attr('checked', false);
            } else {
                $(this).attr('checked', 'checked');
                $('.check_driver').attr('checked', true);
            }
        });
    }
});














