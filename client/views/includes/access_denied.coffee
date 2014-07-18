Template.accessDenied.events
  'click #login-buttons': ->
    setTimeout( ->
      if user = Meteor.user()
        if user.profile.name == "" or user.profile.name == null
          Meteor.call 'updateProfileName'
    , 6000)