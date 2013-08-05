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

    $(document).on("click", "[data-activate-tab]", function(){
        var $me = $(this);
        $($me.attr('data-activate-tab')).tab('show');
    });

    $(document).on("click", "[data-set-focus]", function(){
        var $me = $(this);
        var elm = $($me.attr('data-set-focus'))[0]
        if (elm) elm.focus();
    });

    $(document).on("click", "button[data-loading-text]", function(){
        $(this).button('loading');
    });

    $('.timepicker-me').timepicker();


});