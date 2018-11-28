App.currecies = App.cable.subscriptions.create "CurreciesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    @checkAndUpdateCurrency()

  checkAndUpdateCurrency: ->
    if $('#fb__update_currency_content').length > 0
      @updateCurrencyInfo()

  updateCurrencyInfo: ->
    $.ajax(url: "updated_index_with_ajx").done (html) ->
      $("#fb__update_currency_content").html html
