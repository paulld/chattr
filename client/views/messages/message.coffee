Template.message.helpers
  timeAgo: ->
    moment(@createdAt).fromNow()
  date: ->
    moment(@createdAt).format("D MMMM YYYY")
  time: ->
    moment(@createdAt).format("h:mm:ss A")


Template.message.events =
  'mouseover #time': (e) ->
    $(e.target).find('.time-ago').hide()
    $(e.target).find('.time-date').show()

  'mouseout #time': (e) ->
    $(e.target).find('.time-ago').show()
    $(e.target).find('.time-date').hide()
