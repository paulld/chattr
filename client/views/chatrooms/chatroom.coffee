Template.chatroom.events

  "click #delete-room": (e) ->
    e.preventDefault()

    if confirm "Delete this room?"
      inputs =
        roomId: @_id
        createdBy: @createdBy
        roomMembers: @roomMembers

      Meteor.call 'deleteRoom', inputs , (error, result) ->
        if error
          console.log(error)
        if result
          Router.go 'home'

Template.chatroom.helpers
  isOwner: ->
    Meteor.userId() == @createdBy

  members: ->
    if @roomMembers
      roomMembers = _.map @roomMembers, (memberId) ->
        member = Meteor.users.findOne({_id: memberId})
