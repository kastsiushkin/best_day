# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    completer = new GmapsCompleter
        inputField: '#gmaps-input-address'
        errorField: '#gmaps-error'
        debugOn: false
        zoomLevel: 2
        mapType: google.maps.MapTypeId.ROADMAP
        pos: [0,0]

    completer.autoCompleteInit
        country: "us"
