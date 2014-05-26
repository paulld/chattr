Template.chatroom.events

  "click": (e) ->
    e.preventDefault()

    Inputs =
      roomname : @_id
      owner: @createdBy
      userID : Meteor.userId()



    Meteor.call 'deleteRoom', Inputs , (error) ->
      if error
        console.log(error)
      else
        Router.go 'home'
