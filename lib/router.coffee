Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

Router.map () ->

  @route 'index',
    path: '/',
    template: 'home',
    waitOn: ->
      Meteor.subscribe 'myChatrooms', Meteor.user()
      Meteor.subscribe 'users'
  # TODO: Reroute index to /chatrooms instead of duplcating

  @route 'home',
    path: '/chatrooms'
    waitOn: ->
      Meteor.subscribe 'myChatrooms', Meteor.user()
      Meteor.subscribe 'users'
    data: -> Chatrooms.find()

  @route 'chatroom',

    path: '/chatrooms/:_id',
    waitOn: ->
      [
        Meteor.subscribe 'chatroom', @params._id
        Meteor.subscribe 'messages', @params._id
        Meteor.subscribe 'users'
      ]
    data: -> Chatrooms.findOne @params._id
    onBeforeAction: ->
      room = Chatrooms.findOne @params._id
      # console.log room
      if room then console.log room.roomMembers
      # console.log room.roomMembers

Router.onBeforeAction 'loading'