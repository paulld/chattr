Template.message.helpers
  timeAgo: ->
    moment(@createdAt).fromNow()


Template.message.events =
  'mouseover #time': (e) ->
    $(e.target)
      .html(
        moment(@createdAt).format('D MMMM YYYY') +
        '<br>' +
        moment(@createdAt).format('h:mm:ss A')
      )
      .addClass('time-date')
  'mouseout #time': (e) ->
    $(e.target)
      .html(
        moment(@createdAt).fromNow()
      )
      .removeClass('time-date')