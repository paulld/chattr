Template.chatroom.events

  "click #delete-room": (e) ->
    e.preventDefault()

    inputs =
      roomId: @_id
      owner: @createdBy
      members: @roomMembers

    console.log "inputs: ", inputs

    Meteor.call 'deleteRoom', inputs , (error, result) ->
      if error
        console.log(error)
      if result
        Router.go 'home'

Template.chatroom.helpers
  isOwner: ->
    Meteor.userId() == @createdBy
