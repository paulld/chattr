Router.configure
  layoutTemplate: 'layout'

Router.map () ->

  @route 'home', path: '/'

  @route 'home', path: '/chatrooms'

  @route 'chatroom',
    path: '/chatrooms/:_id',
    waitOn: ->
      Meteor.subscribe 'messages', @params._id
    data: -> Chatrooms.findOne @params._id
