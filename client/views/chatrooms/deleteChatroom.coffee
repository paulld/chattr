Template.deleteChatroom.events

  "submit form": (e) ->
    e.preventDefault()

    Meteor.call 'deleteRoom', , (error) ->
      if error
        console.log(error.reason)



