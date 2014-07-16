Meteor.publish 'chatrooms', () ->
  Chatrooms.find()

Meteor.publish 'currentUserChatrooms', () ->
  currentUser = Meteor.users.findOne
    _id: this.userId

  currentUserRooms = currentUser.profile.belongsToRooms
  
  Chatrooms.find
    _id: { $in: currentUserRooms }


Meteor.publish 'chatroom', (id) ->
  out = Chatrooms.find
    _id: id
  if _.contains(out.fetch()[0].roomMembers, this.userId)
    out
  else
    # THROW ERROR??


Meteor.publish 'messages', (chatroomId) ->
  Messages.find
    chatroomId: chatroomId

Meteor.publish 'users', () ->
  Meteor.users.find( {}, {fields: {'profile.name', 'services.github.username', '_id'}})
