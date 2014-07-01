Template.createMessage.events =

  'submit': (e) ->
    e.preventDefault()

    if Meteor.user()

      content = $(e.target).find('[id=content]').val()

      unless content is ''
        
        messageInfo =
          chatroomId: @_id
          content: content

        Meteor.call 'addMessage', messageInfo, (error, result) ->
          if error
            alert(error.reason)
          else
            $(e.target).find('[id=content]').val('')

    else
      alert "Please log in!"
