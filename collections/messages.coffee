@Messages = new Meteor.Collection 'messages'

Meteor.methods
  addMessage: (messageAttributes) ->
    message = _.extend(_.pick(messageAttributes, 'chatroomId', 'message'),
      userId: Meteor.userId()
      submitted: Date.now()
    )
    Messages.insert message