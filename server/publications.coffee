Meteor.publish 'chatrooms', () ->
  Chatrooms.find()

Meteor.publish 'chatroom', (id) ->
  Chatrooms.find
    _id: id

Meteor.publish 'messages', (chatroomId) ->
  Messages.find
    chatroomId: chatroomId

Meteor.publish 'users', () ->
  Meteor.users.find( {}, {fields: {'profile.name', 'services.github.username'}})

Meteor.publish 'members', (chatroomId) ->
  room = Chatrooms.findOne(_id: chatroomId)
  roomMembers = room.roomMembers
  x = []
  for memberId in roomMembers
    m = Meteor.users.findOne({_id: memberId})
    x.push(m)
  x
