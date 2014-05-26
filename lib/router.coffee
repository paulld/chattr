Router.configure
  layoutTemplate: 'layout'

Router.map () ->
  @route 'home', path: '/'

  @route 'chatroom',
    path: '/chatrooms/:_id',
    data: -> Chatrooms.findOne @params._id



