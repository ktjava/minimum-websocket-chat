App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data["name"] isnt "" and data["message"] isnt "" then $('#messages').append('<p>'+data["name"]+': '+data["message"]+'</p>')
    
  speak: (name, message) ->
    @perform 'speak', name: name, message: message

  $(document).on 'click', '[data-behavior~=room_speaker]', (event) ->
    nameForm = $('#name_form')
    messageForm = $('#message_form')
    App.room.speak nameForm.val(), messageForm.val()
    nameForm.preventDefault()
    messageForm.val('')
    messageForm.preventDefault()