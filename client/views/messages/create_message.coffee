Template.createMessage.events =

  # textEntered = () ->
    # if messageAttributes.message snst ''
      # $('#message').change( () -> $('#messageSubmit').addClass('btn-active'))

  'submit': (e) ->
    e.preventDefault()

    if Meteor.user()

      content = $(e.target).find('[id=content]').val()

      unless content is ''
        
        messageInfo =
          chatroomId: @_id
          content: content

        # unless messageInfo.message is ''
        Meteor.call 'addMessage', messageInfo, (error, result) ->
          #  Add error messages here…
          if error
            alert(error.reason)
          else
          content.value = ''

    else
      alert "Please log in!"
