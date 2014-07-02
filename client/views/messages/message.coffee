Template.message.helpers
  time: ->
    moment(@createdAt).format("D MMM, h:mm A")
