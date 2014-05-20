Router.configure
  layoutTemplate: 'layout'

Router.map () ->
  @route 'home', path: '/'

  @route 'mocha', path: '/tests'