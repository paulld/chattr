Template.chatroom.events

  "click #delete-room": (e) ->
    e.preventDefault()

    Inputs =
      roomname : @_id
      owner: @createdBy
      userID : Meteor.userId()

    Meteor.call 'deleteRoom', Inputs , (error, result) ->
      if error
        console.log(error)
      if result
        Router.go 'home'

Template.messages.helpers
  messages: ->
    Messages.find()
