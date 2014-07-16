Template.chatroomsList.helpers
  chatrooms: -> 
    chatrooms = Chatrooms.find().fetch()
    for room in chatrooms
      room.isMember = _.contains(room.roomMembers, Meteor.userId())
    chatrooms
