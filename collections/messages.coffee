@Messages = new Meteor.Collection 'messages'

Meteor.methods
  addMessage: (messageAttributes) ->
    message = _.extend(_.pick(messageAttributes, 'chatroomId', 'message'),
      authorId: Meteor.userId()
      authorName: user.profile.name
      submitted: Date.now()
    )
    Messages.insert message