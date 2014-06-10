Template.chatroomsList.helpers
    getChatrooms: -> Chatrooms.find().fetch()

Template.chatroomsList.events
  'click tbody > tr': ->
    $(@).find().attr("href")