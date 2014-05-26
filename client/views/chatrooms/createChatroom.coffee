Template.createChatroom.events

  "submit form": (e) ->
    e.preventDefault()
    # current = null

    if Meteor.user()
      roomInfo =
        name: $(e.target).find('[name=room-name]').val()
        description: $(e.target).find('[name=description]').val()
        createdBy: Meteor.users.findOne(Meteor.userId()).profile.name

      Meteor.call 'addRoom', roomInfo, (error, result) ->
      #enter name of room collection
        if error
          alert(error.reason)
        else
        Router.go 'chatroom', {_id:result}

    else
      alert "Must log in first!"

