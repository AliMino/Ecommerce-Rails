# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    criteria = $('#copon_expiration_type').change ->
        if($('#copon_expiration_type :selected').text() == 'By Usage')
            dates = $('#dates')
            dates.hide()
            usages = $('#usages')
            usages.show()
        else
            usages = $('#usages')
            usages.hide()
            dates = $('#dates')
            dates.show()
