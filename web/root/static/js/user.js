$( document ).ready(function() {

    $(document).on("click", "[data-changeval-name]", function(){
        var $me = $(this);
        $me.parents('form:first').find('[name="' + $me.attr('data-changeval-name') + '"]').val(
            $me.attr('data-changeval-value')
        );
    });

    $(document).on("click", "[data-toggle-class]", function(){
        var $me = $(this), $tg = $me.attr('data-toggle-class-target') ? $($me.attr('data-toggle-class-target')) : $me;
        $tg.toggleClass($me.attr('data-toggle-class'));
    });


});