@Chatrooms = new Meteor.Collection 'chatrooms'

Meteor.methods addroom: (roominfo) ->
  # user = Meteor.user()

  # # ensure the user is logged in
  # throw new Meteor.Error(401, "You need to login to create chatrooms")  unless user

  # # ensure the post has a title
  # throw new Meteor.Error(422, "Please fill in room name")  unless roominfo.name

  console.log("running addroom method")
  #pick out the whitelisted keys
  roomattributes = _.extend(_.pick(roominfo, "name"),
    # userId: user._id
    # author: user.username
    created: new Date().getTime()
  )

  add = Chatrooms.insert(roomattributes)
  add
