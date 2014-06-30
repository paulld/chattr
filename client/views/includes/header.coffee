Template.header.events
  'click #login-buttons': ->
    setTimeout( ->
      if user = Meteor.user()
        if user.profile.name == "" or user.profile.name == null
          Meteor.call 'updateProfileName'
    , 6000)

Template.header.helpers
  activeRouteClass: () ->
    args = Array.prototype.slice.call arguments, 0

    active = _.any args, (name) ->
      Router.current() && Router.current().route.name == name

    active && 'active'