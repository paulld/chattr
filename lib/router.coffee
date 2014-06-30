Router.configure
  layoutTemplate: 'layout'

Router.map () ->

  @route 'index',
    path: '/',
    template: 'home',
    waitOn: ->
      Meteor.subscribe 'users'
  # TODO: Reroute index to /chatrooms instead of duplcating

  @route 'home',
    path: '/chatrooms'
    waitOn: ->
      Meteor.subscribe 'users'
    data: -> Chatrooms.find()

  @route 'chatroom',
    path: '/chatrooms/:_id',
    waitOn: ->
      Meteor.subscribe 'messages', @params._id
    data: -> Chatrooms.findOne @params._id
