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

    function analiseDriverDocuments(document_id, element) {

        if(element.attr('id') == 'accept') {
            var $url = '/admin/validate-driver-documents/validate/'+document_id;
        } else {
            var $url = '/admin/validate-driver-documents/reject/'+document_id;
        }

        $.ajax({
            url: $url,
            dataType: 'json',
            success: function(result) {
                console.log(result);
            },
            error: function(err) {
                console.log(err);
            },
            complete: function() {
            }
        });

    }

    return {
        getCostumers: getCostumers,
        analiseDriverDocuments: analiseDriverDocuments
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

    var $approve_docs = $('.approve_docs');
    if($approve_docs.length) {
        $approve_docs.click(function(){
            var $doc_id  = $(this).val();

            $admin.analiseDriverDocuments($doc_id, $approve_docs);
        });
    }

});














