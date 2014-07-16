Meteor.publish 'chatrooms', () ->
  Chatrooms.find()

Meteor.publish 'myChatrooms', (user) ->
  myRooms = user.profile.belongsToRooms
  Chatrooms.find
    _id: { $in: myRooms }


Meteor.publish 'chatroom', (id) ->
  Chatrooms.find
    _id: id

Meteor.publish 'messages', (chatroomId) ->
  Messages.find
    chatroomId: chatroomId

Meteor.publish 'users', () ->
  Meteor.users.find( {}, {fields: {'profile.name', 'services.github.username', '_id'}})
