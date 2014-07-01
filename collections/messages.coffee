@Messages = new Meteor.Collection 'messages'

Meteor.methods
  addMessage: (messageAttributes) ->
    user = Meteor.user()

    unless user
      throw new Meteor.Error(401, "Please login to add a message")

    unless messageAttributes.content
      throw new Meteor.Error(422, 'Please enter a message')

    message = _.extend(_.pick(messageAttributes, 'chatroomId', 'content'),
      authorId: Meteor.userId()
      authorName: user.profile.name
      submitted: Date.now()
    )
    Messages.insert message