Template.createChatroom.events

  "click input": (e) ->
    $('#new-room-options').show()


  "submit form": (e) ->
    e.preventDefault()
    
    if Meteor.user()
      temp = $(e.target).find('[name=room-type]:checked').val() is "true"
      # TODO: improve this code: how to convert "true" to true and "false" to false?

      roomInfo =
        name: $(e.target).find('[name=room-name]').val()
        description: $(e.target).find('[name=description]').val()
        roomMembers: $(e.target).find('[name=user-list]').val()
        isTemporary: temp

      Meteor.call 'addRoom', roomInfo, (error, result) ->
        if error
          alert(error.reason)
        else
          Router.go 'chatroom', {_id:result}

    else
      alert "Must log in first!"


