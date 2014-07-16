Template.chatroomsList.helpers
  # chatrooms: -> Chatrooms.find()

  # isMember: ->
  #   chatrooms = Chatrooms.find().fetch()
  #   for room in chatrooms
  #     _.contains(room.roomMembers, Meteor.userId())


  chatrooms: -> 
    chatrooms = Chatrooms.find().fetch()
    for room in chatrooms
      room.isMember = _.contains(room.roomMembers, Meteor.userId())
    chatrooms