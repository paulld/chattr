Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

Router.map () ->

  @route 'index',
    path: '/',

  @route 'dashboard',
    path: '/chatrooms'
    template: 'dashboard',
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

requireLogin = (pause) ->
  if (! Meteor.user())
    if Meteor.loggingIn()
      @render('loading')
    else
      @render('accessDenied')
    pause()

Router.onBeforeAction requireLogin, {except: 'index'}
Router.onBeforeAction 'loading'


# Router.onBeforeAction(function() { clearErrors() });
