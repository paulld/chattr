Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

Router.map () ->

  @route 'index',
    path: '/',
    template: 'home',
    waitOn: ->
      Meteor.subscribe 'currentUserChatrooms'
      Meteor.subscribe 'users'
  # TODO: Reroute index to /chatrooms instead of duplcating

  @route 'home',
    path: '/chatrooms'
    waitOn: ->
      Meteor.subscribe 'currentUserChatrooms'
      Meteor.subscribe 'users'
    data: -> Chatrooms.find()

  @route 'usersList',
    path: '/users'

  @route 'chatroomItem',

    path: '/chatrooms/:_id',
    notFoundTemplate: 'notFound'
    waitOn: ->
      [
        Meteor.subscribe 'chatroom', @params._id
        Meteor.subscribe 'messages', @params._id
        Meteor.subscribe 'users'
      ]
    data: -> Chatrooms.findOne @params._id
    # TODO: throw not_found when receive empty cursor?

  @route 'notFound',
    path: '*'

Router.onBeforeAction 'loading'
