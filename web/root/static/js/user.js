$( document ).ready(function() {

    $(document).on("click", "[data-changeval-name]", function(){
        var $me = $(this), $elm = $me.parents('form:first').find('[name="' + $me.attr('data-changeval-name') + '"]');

        if ($me.attr('data-changeval-value')){
            $elm.val($me.attr('data-changeval-value'));
        }else if ($me.attr('data-changeval-valuehc')){

            setTimeout(function(){
                $elm.val( $me.hasClass($me.attr('data-changeval-valuehc')) ? 1 : 0 );
            });
        }
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

    $('[data-toggle="tooltip"]').tooltip();

    $(document).on("click", "[data-send-click]", function(){
        $($(this).attr('data-send-click')).click();
    });


    $("[data-confirm]").click(function(event) {
        var confirmPrompt = event.currentTarget.attributes['data-confirm'].value;
        if (window.confirm(confirmPrompt)){
            return 1;
        }else{
            event.preventDefault();
        }
        return 0;

    });

    $('.timepicker-me').timepicker();

});