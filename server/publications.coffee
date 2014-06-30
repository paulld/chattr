Meteor.publish 'chatrooms', () ->
  Chatrooms.find()

Meteor.publish 'messages', (chatroomId) ->
  Messages.find
    chatroomId: chatroomId

Meteor.publish 'users', () ->
  Meteor.users.find( {}, {fields: {'profile.name', 'services.github.username'}})