# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $("[name='use_copon_btn']").click ->
        console.log(event.target.id)
        $.ajax({
            type: 'POST',
            url: '/used_copons'
            dateType: 'JSON'
            data: {
                copon_id: event.target.id
            },
            success: alert('copon used')
        })
