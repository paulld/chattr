Template.chatroomsList.helpers
  chatrooms: -> 
    chatrooms = Chatrooms.find({}, {sort: {createdAt: -1}}).fetch()
    for room in chatrooms
      room.isMember = _.contains(room.roomMembers, Meteor.userId())
    chatrooms
