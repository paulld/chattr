@Chatrooms = new Meteor.Collection 'chatrooms'

Meteor.methods

  addRoom: (roomAttributes) ->
    user = Meteor.user()

    # TODO: Add validation for temporary or permanent selected

    unless user
      throw new Meteor.Error(401, "Login to create a room")

    unless roomAttributes.name
      throw new Meteor.Error(422, 'Please pick a name for the room')

    unless roomAttributes.description
      throw new Meteor.Error(422, 'Please add a description for the room')

    roomAttributes.roomMembers.push(user._id)

    room = _.extend(_.pick(roomAttributes, "name", "description", "createdBy", "roomMembers", "isTemporary"),
      created: new Date().getTime()
      createdBy: user._id
    )

    chatroomId = Chatrooms.insert(room)

  deleteRoom: (Inputs) ->
    if Inputs.userID is Inputs.owner
      Chatrooms.remove(Inputs.roomname)
    else
      throw new Meteor.Error(401, "You're not the owner of this room")