Template.createChatroom.events

  "submit form": (e) ->
    e.preventDefault()

    roomInfo =
      name: $(e.target).find('[name=room-name]').val()
      description: $(e.target).find('[name=description]').val()


    Meteor.call 'addRoom', roomInfo, (error) ->
    #enter name of room collection
      if error
        alert(error.reason)
