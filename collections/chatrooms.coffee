@Chatrooms = new Meteor.Collection 'chatrooms'

Meteor.methods

  addRoom: (roomAttributes) ->
    user = Meteor.user()

    unless user
      throw new Meteor.Error(401, "Login to create a room")

    # unless roomAttributes.isTemporary
    #   throw new Meteor.Error(422, 'Please choose a room type: temporary of permanent')

    unless roomAttributes.name
      throw new Meteor.Error(422, 'Please pick a name for the room')

    unless roomAttributes.description
      throw new Meteor.Error(422, 'Please add a description for the room')

    unless roomAttributes.roomMembers
      throw new Meteor.Error(422, 'Please add at least one person to chat with')

    roomAttributes.roomMembers.push(user._id)

    room = _.extend(_.pick(roomAttributes, "name", "description", "createdBy", "roomMembers", "tags", "isTemporary"),
      createdAt: new Date().getTime()
      createdBy: user._id
    )

    if chatroomId = Chatrooms.insert(room)
      for member in roomAttributes.roomMembers
        Meteor.users.update({_id:member}, {$push:{"profile.belongsToRooms":chatroomId}})

    chatroomId

  deleteRoom: (inputs) ->
    if Meteor.userId() is inputs.createdBy
      if Chatrooms.remove(inputs.roomId)
        for member in inputs.roomMembers
          Meteor.users.update({_id:member}, {$pull:{"profile.belongsToRooms":inputs.roomId}})

    else
      throw new Meteor.Error(401, "You're not the owner of this room")

  quitRoom: (inputs) ->
    if Meteor.userId() is inputs.createdBy
      throw new Meteor.Error(401, "You can't leave a room where you are the owner, you can only delete it.")
    else
      if _.contains( inputs.roomMembers, Meteor.userId() )
        Chatrooms.update( {_id:inputs.roomId}, {$pull:{ "roomMembers": Meteor.userId() }} )
        Meteor.users.update({_id:Meteor.userId()}, {$pull:{"profile.belongsToRooms":inputs.roomId}})
      else
        throw new Meteor.Error(401, "You don't belong to this room")
