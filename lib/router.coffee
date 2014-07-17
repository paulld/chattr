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


  @route 'usersList',
    path: '/users',
    waitOn: -> Meteor.subscribe 'users'
    data: -> Meteor.users.find().fetch()

  @route 'userItem', 
    path: '/users/:_id',
    waitOn: -> Meteor.subscribe 'user', @params._id
    data: -> Meteor.users.findOne @params._id


  @route 'notFound',
    path: '*'

Router.onBeforeAction 'loading'
