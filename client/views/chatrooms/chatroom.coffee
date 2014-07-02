Template.chatroom.events

  "click #delete-room": (e) ->
    e.preventDefault()

    inputs =
      roomId: @_id
      owner: @createdBy
      members: @roomMembers

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
      members = []
      for memberId in @roomMembers
        member = Meteor.users.findOne({_id: memberId})
        members.push(member)
      members