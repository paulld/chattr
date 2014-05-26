@Chatrooms = new Meteor.Collection 'chatrooms'

Meteor.methods addRoom: (roomInfo) ->
  # user = Meteor.user()

  # # ensure the user is logged in
  # throw new Meteor.Error(401, "You need to login to create chatrooms")  unless user

  # # ensure the post has a title
  # throw new Meteor.Error(422, "Please fill in room name")  unless roominfo.name

  #pick out the whitelisted keys
  roomAttributes = _.extend(_.pick(roomInfo, "name", "description"),
    # userId: user._id
    # author: user.username
    created: new Date().getTime()
  )

  chatroomId = Chatrooms.insert(roomAttributes)
  console.log(chatroomId)

