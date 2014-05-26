Template.createChatroom.events

  "submit form": (e) ->
    e.preventDefault()

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
        current = result

        # Router.go 'Chatroom', {_id:current}



    else
      alert "Must log in first!"

