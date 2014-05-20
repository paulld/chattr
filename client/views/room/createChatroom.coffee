Template.createChatroom.events "submit form": (e) ->
  e.preventDefault()

  roominfo =
    name: $(e.target).find('[name=room-name]').val()

  Meteor.call 'chatrooms', roominfo, (error, id) ->
  #enter name of room collection
    if error
      alert(error.reason)