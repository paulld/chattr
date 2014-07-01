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
    console.log @roomMembers
  #   # room = Chatrooms.find({_id: @_id}).fetch()
  #   # console.log room[0]
  #   # x = []
  #   # for memberId in @roomMembers
  #   #   m = Meteor.users.find
  #   #     _id: memberId
  #   #   x.push(m)
  #   # x

  # #   name = 