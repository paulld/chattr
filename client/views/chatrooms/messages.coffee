Template.messageInput.events =
  'submit': (e) ->
    e.preventDefault()

    $message = $(e.target).find('[id=message]')
    messageAttributes =
      chatroomId: @_id
      message: $message.val()

    unless messageAttributes.message is ''
      Meteor.call 'addMessage', messageAttributes, (error, result) ->
        #  Add error messages here…
        # if error
        #   console.log error
        # else
        message.value = ''