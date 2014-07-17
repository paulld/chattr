Meteor.publish 'chatrooms', () ->
  Chatrooms.find()
# TODO: Keep chatrooms publication for admin ?

Meteor.publish 'currentUserChatrooms', () ->
  currentUser = Meteor.users.findOne
    _id: this.userId

  currentUserRooms = currentUser.profile.belongsToRooms
  
  Chatrooms.find
    _id: { $in: currentUserRooms }


Meteor.publish 'chatroom', (item_id) ->
  out = Chatrooms.find( { _id: item_id } )
  if out.fetch() is not []
    if _.contains(out.fetch()[0].roomMembers, this.userId)
      out
    else
      # TODO: Better syntax? Throw not_found error?
  else
    out
      # TODO: Way to throw error/empty cursor when try to access a restricted room?


Meteor.publish 'messages', (chatroomId) ->
  Messages.find
    chatroomId: chatroomId

Meteor.publish 'users', () ->
  Meteor.users.find( {},               {fields: {'profile.name', 'services.github.username', 'services.github.email', '_id'}} )

Meteor.publish 'user', (item_id) ->
  Meteor.users.find( { _id: item_id }, {fields: {'profile.name', 'services.github.username', 'services.github.email', '_id'}} )
  