Meteor.publish 'chatrooms', () ->
  Chatrooms.find()