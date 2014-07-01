Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

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
      [
        Meteor.subscribe 'chatroom', @params._id
        Meteor.subscribe 'messages', @params._id
        Meteor.subscribe 'users'
        # Meteor.subscribe 'members', @params._id
      ]
    data: ->
      chatRoom = Chatrooms.findOne @params._id
      # roomMembers = Meteor.subscribe 'members', @params._id

Router.onBeforeAction 'loading'