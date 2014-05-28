Template.createChatroom.events

  "submit form": (e) ->
    e.preventDefault()

    if Meteor.user()
      roomInfo =
        name: $(e.target).find('[name=room-name]').val()
        description: $(e.target).find('[name=description]').val()
        createdBy: Meteor.userId()

      Meteor.call 'addRoom', roomInfo, (error, result) ->
      if error
        alert(error.reason)
      else
        Router.go 'chatroom', {_id:result}

    else
      alert "Must log in first!"

