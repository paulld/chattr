Meteor.publish 'chatrooms', () ->
  Chatrooms.find()

Meteor.publish 'messages', (chatroomId) ->
  Messages.find
    chatroomId: chatroomId