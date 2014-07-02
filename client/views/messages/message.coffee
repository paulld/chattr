Template.message.helpers
  time: ->
    time = moment(@createdAt).format("D MMM, h:mm A")
