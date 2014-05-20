loginname =  Meteor.user().profile.name

# Meteor.user().profile.name

Template.login.helpers
  name: loginname