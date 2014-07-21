Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

Router.map () ->

  @route 'home',
    path: '/'

  @route 'privacyPolicy',
    path: '/privacy-policy'

  @route 'termsOfUse',
    path: '/terms-of-use'


  @route 'dashboard',
    path: '/chatrooms'
    template: 'dashboard'
    onData: ->
      Meteor.subscribe 'currentUserChatrooms'
      Meteor.subscribe 'users'
    data: -> Chatrooms.find()

  @route 'chatroomItem',
    path: '/chatrooms/:_id'
    waitOn: ->
      [
        Meteor.subscribe 'chatroom', @params._id
        Meteor.subscribe 'messages', @params._id
        Meteor.subscribe 'users'
      ]
    data: -> Chatrooms.findOne @params._id
    # TODO: throw not_found when receive empty cursor?


  @route 'usersList',
    path: '/users'
    onData: -> Meteor.subscribe 'users'
    data: -> Meteor.users.find().fetch()

  @route 'userItem', 
    path: '/users/:_id'
    waitOn: -> Meteor.subscribe 'user', @params._id
    data: -> Meteor.users.findOne @params._id


  @route 'notFound',
    path: '*'
    notFoundTemplate: 'notFound'


requireLogin = (pause) ->
  if (! Meteor.user())
    if Meteor.loggingIn()
      @render('loading')
    else
      @render('accessDenied')
    pause()

Router.onBeforeAction requireLogin,
  except: [
    'home'
    'privacyPolicy'
    'termsOfUse'
    'notFound'
  ]
Router.onBeforeAction 'loading'
